import raylib, ultralight, nimgl/[opengl], glfw, winim/lean, context, callback

const windowConfiguration = flags(
  WindowUndecorated, WindowTransparent, WindowMaximized, WindowTopmost, WindowHighdpi
)

proc ui() =
  setConfigFlags(windowConfiguration)
  initWindow(0, 0, "Raylib example")

  doAssert glInit(), "glInit failed"

  let currentWindow = glfwGetCurrentContext()
  let nativeWindow = getWindowHandle()

  var currentWindowWidth, currentWindowHeight: int32
  currentWindow.getWindowSize(addr currentWindowWidth, addr currentWindowHeight)

  var currentWindowXScale, currentWindowYScale: float32
  currentWindow.getWindowContentScale(addr currentWindowXScale, addr currentWindowYScale)

  setupWindowCallback(currentWindow, nativeWindow)

  let currentContext = getSharedState()
  currentContext.screenSize.x = float32(currentWindowWidth)
  currentContext.screenSize.y = float32(currentWindowHeight)
  currentContext.contentScale.x = currentWindowXScale
  currentContext.contentScale.y = currentWindowYScale
  currentContext.ultralightContext.view = newUltralightView(currentContext.ultralightContext.renderer, uint32(currentContext.screenSize.x), uint32(currentContext.screenSize.y), currentContext.ultralightContext.viewConfig, currentContext.ultralightContext.session)
  currentContext.ultralightContext.view.loadURL(newUltralightString("file:///index.html"))

  setTargetFPS(60)

  let rendererTexture = loadRenderTexture(int32(currentContext.screenSize.x), int32(currentContext.screenSize.y))
  var previousKeyState: bool
  var drawOverlay = false

  while not windowShouldClose():
    beginDrawing()
    clearBackground(Blank)
    drawFPS(10, 10)

    let overlayShouldDrawing = shouldOpenOverlay()
    if overlayShouldDrawing and not previousKeyState:
      drawOverlay = not drawOverlay
    previousKeyState = overlayShouldDrawing

    if not drawOverlay and not isWindowState(WindowMousePassthrough):
      setWindowState(flags(WindowMousePassthrough))

    if drawOverlay:
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

ui()