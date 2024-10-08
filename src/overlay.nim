import raylib, ultralight, glfw, opengl, context, callback, std/[strformat, os]

const windowConfiguration = flags(
  WindowUndecorated, WindowTransparent, WindowResizable, WindowMousePassthrough, WindowTopmost, WindowHighdpi
)

proc overlay*() =
  setConfigFlags(windowConfiguration)
  initWindow(0, 0, "Raylib example")
  maximizeWindow()

  setGLGetProc(glfwGetProcAddress)
  doAssert glInit(), "glInit failed"

  var (currentWindowWidth, currentWindowHeight) = (getScreenWidth(), getScreenHeight())
  setupWindowCallback(glfwGetCurrentContext())

  let currentContext = getSharedState()
  currentContext.raylibContext.window = glfwGetCurrentContext()
  currentContext.screenSize.x = float32(currentWindowWidth)
  currentContext.screenSize.y = float32(currentWindowHeight)
  currentContext.ultralightContext.view = newUltralightView(currentContext.ultralightContext.renderer, uint32(currentContext.screenSize.x), uint32(currentContext.screenSize.y), currentContext.ultralightContext.viewConfig, currentContext.ultralightContext.session)
  let windowURL = when not defined(release):
    newUltralightString("http://localhost:3000/")
  else:
    newUltralightString("file:///index.html")

  disposable(windowURL):
    currentContext.ultralightContext.view.loadURL(windowURL)
  currentContext.ultralightContext.view.setDOMReadyCallback(domReadyCallback, nil)
  currentContext.ultralightContext.view.setAddConsoleMessageCallback(addConsoleMessageCallback, nil)
  currentContext.ultralightContext.view.setChangeCursorCallback(cursorChangeCallback, nil)

  currentContext.cursorCollection.iBeamCursor = glfwCreateStandardCursor(GLFWIBeamCursor)
  currentContext.cursorCollection.crosshairCursor = glfwCreateStandardCursor(GLFWCrosshairCursor)
  currentContext.cursorCollection.handCursor = glfwCreateStandardCursor(GLFWHandCursor)
  currentContext.cursorCollection.hresizeCursor = glfwCreateStandardCursor(GLFWHResizeCursor)
  currentContext.cursorCollection.vresizeCursor = glfwCreateStandardCursor(GLFWVResizeCursor)

  setTargetFPS(60)

  let rendererTexture = loadRenderTexture(int32(currentContext.screenSize.x), int32(currentContext.screenSize.y))
  var previousKeyState: bool

  while not windowShouldClose():
    beginDrawing()
    clearBackground(Blank)
    drawFPS(10, 10)

    block overlayState:
      let overlayShouldDrawing = shouldOpenOverlay()
      if overlayShouldDrawing and not previousKeyState:
        currentContext.showUltralightOverlay = not currentContext.showUltralightOverlay
      elif currentContext.ultralightContext.disableOverlay:
        currentContext.showUltralightOverlay = false
        currentContext.ultralightContext.disableOverlay = false
      previousKeyState = overlayShouldDrawing

    if not currentContext.showUltralightOverlay and not isWindowState(WindowMousePassthrough):
      setWindowState(flags(WindowMousePassthrough))

    if currentContext.showUltralightOverlay:
      if isWindowState(WindowMousePassthrough):
        clearWindowState(flags(WindowMousePassthrough))

      currentContext.ultralightContext.renderer.refreshDisplay(0)
      currentContext.ultralightContext.renderer.update()
      currentContext.ultralightContext.renderer.render()

      if currentContext.ultralightContext.view.loading:
        drawText("Loading...", 190, 300, 20, WHITE)
      else:
        let surface = currentContext.ultralightContext.view.surface()
        glBindTexture(GL_TEXTURE_2D, rendererTexture.texture.id)
        let dirtyBounds = surface.dirtyBounds()
        if not dirtyBounds.intRectIsEmpty():
          let pixelArray = surface.lockPixels()
          if uint32(dirtyBounds.right - dirtyBounds.left) == surface.width:
            glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA.GLint, currentWindowWidth, currentWindowHeight, 0, GL_BGRA, GL_UNSIGNED_BYTE, pixelArray)
          else:
            for y in dirtyBounds.top ..< dirtyBounds.bottom:
              let offset = surface.rowBytes() * uint32(y) + uint32(dirtyBounds.left * 4)
              glTexSubImage2D(GL_TEXTURE_2D, 0, dirtyBounds.left, y, dirtyBounds.right - dirtyBounds.left, 1, GL_BGRA, GL_UNSIGNED_BYTE, cast[pointer](cast[int64](pixelArray) + cast[int64](offset)))
          surface.clearDirtyBounds()
          surface.unlockPixels()
        drawTexture(rendererTexture.texture, 0, 0, WHITE)
    endDrawing()