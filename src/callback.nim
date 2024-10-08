import opengl, glfw, context, ultralight, std/[unicode, strformat]

template disposable*(resource: pointer, body: untyped) =
  try:
    body
  finally:
    destroy(resource)

proc glfwToUltralightKey(key: int32): int32 =
  case key:
    of GLFWKey.Space: return 0x20
    of GLFWKey.Apostrophe: return 0xDE
    of GLFWKey.Comma: return 0xBC
    of GLFWKey.Minus: return 0xBD
    of GLFWKey.Period: return 0xBE
    of GLFWKey.Slash: return 0xBF
    of GLFWKey.K0: return 0x30
    of GLFWKey.K1: return 0x31
    of GLFWKey.K2: return 0x32
    of GLFWKey.K3: return 0x33
    of GLFWKey.K4: return 0x34
    of GLFWKey.K5: return 0x35
    of GLFWKey.K6: return 0x36
    of GLFWKey.K7: return 0x37
    of GLFWKey.K8: return 0x38
    of GLFWKey.K9: return 0x39
    of GLFWKey.Semicolon: return 0xBA
    of GLFWKey.Equal, GLFWKey.KPEqual: return 0xBB
    of GLFWKey.A: return 0x41
    of GLFWKey.B: return 0x42
    of GLFWKey.C: return 0x43
    of GLFWKey.D: return 0x44
    of GLFWKey.E: return 0x45
    of GLFWKey.F: return 0x46
    of GLFWKey.G: return 0x47
    of GLFWKey.H: return 0x48
    of GLFWKey.I: return 0x49
    of GLFWKey.J: return 0x4A
    of GLFWKey.K: return 0x4B
    of GLFWKey.L: return 0x4C
    of GLFWKey.M: return 0x4D
    of GLFWKey.N: return 0x4E
    of GLFWKey.O: return 0x4F
    of GLFWKey.P: return 0x50
    of GLFWKey.Q: return 0x51
    of GLFWKey.R: return 0x52
    of GLFWKey.S: return 0x53
    of GLFWKey.T: return 0x54
    of GLFWKey.U: return 0x55
    of GLFWKey.V: return 0x56
    of GLFWKey.W: return 0x57
    of GLFWKey.X: return 0x58
    of GLFWKey.Y: return 0x59
    of GLFWKey.Z: return 0x5A
    of GLFWKey.LeftBracket: return 0xDB
    of GLFWKey.Backslash: return 0xDC
    of GLFWKey.RightBracket: return 0xDD
    of GLFWKey.GraveAccent: return 0xC0
    of GLFWKey.Escape: return 0x1B
    of GLFWKey.Enter, GLFWKey.KPEnter: return 0x0D
    of GLFWKey.Tab: return 0x09
    of GLFWKey.Backspace: return 0x08
    of GLFWKey.Insert: return 0x2D
    of GLFWKey.Delete: return 0x2E
    of GLFWKey.Right: return 0x27
    of GLFWKey.Left: return 0x25
    of GLFWKey.Down: return 0x28
    of GLFWKey.Up: return 0x26
    of GLFWKey.PageUp: return 0x21
    of GLFWKey.PageDown: return 0x22
    of GLFWKey.Home: return 0x24
    of GLFWKey.End: return 0x23
    of GLFWKey.CapsLock: return 0x14
    of GLFWKey.ScrollLock: return 0x91
    of GLFWKey.NumLock: return 0x90
    of GLFWKey.PrintScreen: return 0x2C
    of GLFWKey.Pause: return 0x13
    of GLFWKey.F1: return 0x70
    of GLFWKey.F2: return 0x71
    of GLFWKey.F3: return 0x72
    of GLFWKey.F4: return 0x73
    of GLFWKey.F5: return 0x74
    of GLFWKey.F6: return 0x75
    of GLFWKey.F7: return 0x76
    of GLFWKey.F8: return 0x77
    of GLFWKey.F9: return 0x78
    of GLFWKey.F10: return 0x79
    of GLFWKey.F11: return 0x7A
    of GLFWKey.F12: return 0x7B
    of GLFWKey.F13: return 0x7C
    of GLFWKey.F14: return 0x7D
    of GLFWKey.F15: return 0x7E
    of GLFWKey.F16: return 0x7F
    of GLFWKey.F17: return 0x80
    of GLFWKey.F18: return 0x81
    of GLFWKey.F19: return 0x82
    of GLFWKey.F20: return 0x83
    of GLFWKey.F21: return 0x84
    of GLFWKey.F22: return 0x85
    of GLFWKey.F23: return 0x86
    of GLFWKey.F24: return 0x87
    of GLFWKey.KP0: return 0x60
    of GLFWKey.KP1: return 0x61
    of GLFWKey.KP2: return 0x62
    of GLFWKey.KP3: return 0x63
    of GLFWKey.KP4: return 0x64
    of GLFWKey.KP5: return 0x65
    of GLFWKey.KP6: return 0x66
    of GLFWKey.KP7: return 0x67
    of GLFWKey.KP8: return 0x68
    of GLFWKey.KP9: return 0x69
    of GLFWKey.KPDecimal: return 0x6E
    of GLFWKey.KPDivide: return 0x6F
    of GLFWKey.KPMultiply: return 0x6A
    of GLFWKey.KPSubtract: return 0x6D
    of GLFWKey.KPAdd: return 0x6B
    of GLFWKey.LeftShift, GLFWKey.RightShift: return 0x10
    of GLFWKey.LeftControl, GLFWKey.RightControl: return 0x11
    of GLFWKey.LeftAlt, GLFWKey.RightAlt: return 0x12
    of GLFWKey.LeftSuper: return 0x5B
    of GLFWKey.RightSuper: return 0x5C
    else: return 0

proc glfwToUltralightModifiers(modifiers: int32): uint32 =
  var ultralightModifiers: uint32 = 0

  if (modifiers and GLFW_MOD_ALT) != 0:
    ultralightModifiers = ultralightModifiers or 1

  if (modifiers and GLFW_MOD_CONTROL) != 0:
    ultralightModifiers = ultralightModifiers or 1 div 1

  if (modifiers and GLFW_MOD_SUPER) != 0:
    ultralightModifiers = ultralightModifiers or 1 div 2

  if (modifiers and GLFW_MOD_SHIFT) != 0:
    ultralightModifiers = ultralightModifiers or 1 div 3

  return ultralightModifiers

proc sizeCallback(window: GLFWWindow, width: int32, height: int32) {.cdecl.} =
  glViewport(0, 0, width, height)
  let currentContext = getSharedState()
  currentContext.screenSize.x = float32(width)
  currentContext.screenSize.y = float32(height)
  if currentContext.ultralightContext.view != nil:
    currentContext.ultralightContext.view.resize(uint32(width), uint32(height))

  if currentContext.raylibContext.sizeCallback != nil:
    currentContext.raylibContext.sizeCallback(window, width, height)

proc clickCallback(window: GLFWWindow, button: int32, action: int32, mods: int32) {.cdecl.} =
  let ultralightMouseButton = case button:
    of GLFWMouseButton.Button1: Left
    of GLFWMouseButton.Button2: Right
    of GLFWMouseButton.Button3: Middle
    else: None

  let ultralightEventType = case action:
    of 1: Down
    of 0: Up
    else: Down

  var x, y: float64
  getCursorPos(window, addr x, addr y)

  let currentContext = getSharedState()
  currentContext.cursorPos.x = float32(x)
  currentContext.cursorPos.y = float32(y)
  if currentContext.ultralightContext.view != nil:
    let ultralightMouseEvent = newUltralightMouseEvent(ultralightEventType, int32(x), int32(y), ultralightMouseButton)
    disposable(ultralightMouseEvent):
      fire(currentContext.ultralightContext.view, ultralightMouseEvent)

  if currentContext.raylibContext.clickCallback != nil:
    currentContext.raylibContext.clickCallback(window, button, action, mods)

proc scrollCallback(window: GLFWWindow, xoffset: float64, yoffset: float64) {.cdecl.} =
  let currentContext = getSharedState()
  currentContext.scrollOffset.x = float32(xoffset)
  currentContext.scrollOffset.y = float32(yoffset)

  if currentContext.ultralightContext.view != nil: 
    let ultralightScrollEvent = newUltralightScrollEvent(ByPixel, int32(xoffset * 60), int32(yoffset * 60))
    disposable(ultralightScrollEvent):
      fire(currentContext.ultralightContext.view, ultralightScrollEvent)
  
  if currentContext.raylibContext.scrollCallback != nil:
    currentContext.raylibContext.scrollCallback(window, xoffset, yoffset)
  
proc positionCallback(window: GLFWWindow, x: float64, y: float64) {.cdecl.} =
  let currentMouseButton = if getMouseButton(window, GLFWMouseButton.Button1) == GLFWPress: Left
    elif getMouseButton(window, GLFWMouseButton.Button2) == GLFWPress: Right
    elif getMouseButton(window, GLFWMouseButton.Button3) == GLFWPress: Middle
    else: None

  let currentContext = getSharedState()
  currentContext.cursorPos.x = float32(x)
  currentContext.cursorPos.y = float32(y)

  if currentContext.ultralightContext.view != nil:
    let ultralightMouseEvent = newUltralightMouseEvent(Moved, int32(x), int32(y), currentMouseButton)
    disposable(ultralightMouseEvent):
      fire(currentContext.ultralightContext.view, ultralightMouseEvent)

  if currentContext.raylibContext.positionCallback != nil:
    currentContext.raylibContext.positionCallback(window, x, y)

proc keyCallback(window: GLFWWindow, key: int32, scancode: int32, action: int32, mods: int32) {.cdecl.} =
  let translatedAction = case action:
    of GLFWPress: RawKeyDown
    of GLFWRelease: KeyUp
    else: return

  let currentContext = getSharedState()
  if currentContext.ultralightContext.view != nil:
    let emptyUltralightString = newUltralightString("")
    let translatedKey = glfwToUltralightKey(key)
    let translatedModifiers = glfwToUltralightModifiers(mods)

    disposable(emptyUltralightString):
      let ultralightKeyEvent = newUltralightKeyEvent(translatedAction, translatedModifiers, translatedKey, scancode, emptyUltralightString, emptyUltralightString, false, false, false)
      disposable(ultralightKeyEvent):
        fire(currentContext.ultralightContext.view, ultralightKeyEvent)

    if translatedAction == RawKeyDown and (key == GLFWKey.ENTER or key == GLFWKey.TAB):
      let text = if key == GLFWKey.ENTER: newUltralightString("\n") else: newUltralightString("\t")
      disposable(text):
        let extraEvent = newUltralightKeyEvent(Char, 0, 0, 0, text, text, false, false, false)
        disposable(extraEvent):
          fire(currentContext.ultralightContext.view, extraEvent)
    
    if currentContext.raylibContext.keyCallback != nil:
      currentContext.raylibContext.keyCallback(window, key, scancode, action, mods)

proc modifierCallback(window: GLFWWindow, codepoint: uint32, mods: int32) {.cdecl.} =
  let currentContext = getSharedState()
  if currentContext.ultralightContext.view != nil:
    let ultralightText = newUltralightString(cstring($Rune(codepoint)))
    disposable(ultralightText):
      let ultralightCharEvent = newUltralightKeyEvent(Char, 0, 0, 0, ultralightText, ultralightText, false, false, false)
      disposable(ultralightCharEvent):
        fire(currentContext.ultralightContext.view, ultralightCharEvent)

proc closeOverlay(context: JavaScriptContextRef, function: JavaScriptObjectRef, thisObject: JavaScriptObjectRef, argumentCount: csize_t, arguments: ptr UncheckedArray[JavaScriptValueRef], exception: ptr JavaScriptValueRef): JavaScriptValueRef {.cdecl.} =
  let currentContext = getSharedState()
  currentContext.ultralightContext.disableOverlay = not currentContext.ultralightContext.disableOverlay
  return valueMakeBoolean(context, currentContext.ultralightContext.disableOverlay)

proc cursorChangeCallback*(userData: pointer, view: UltralightView, cursor: UltralightCursor) {.cdecl.} =
  let currentContext = getSharedState()
  case cursor:
    of IBeam:
      currentContext.raylibContext.window.setCursor(currentContext.cursorCollection.iBeamCursor)
    of Cross:
      currentContext.raylibContext.window.setCursor(currentContext.cursorCollection.crosshairCursor)
    of Hand:
      currentContext.raylibContext.window.setCursor(currentContext.cursorCollection.handCursor)
    of EastResize, WestResize, EastWestResize:
      currentContext.raylibContext.window.setCursor(currentContext.cursorCollection.hresizeCursor)
    of NorthResize, SouthResize, NorthSouthResize:
      currentContext.raylibContext.window.setCursor(currentContext.cursorCollection.vresizeCursor)  
    else: discard

proc domReadyCallback*(userData: pointer, view: UltralightView, time: culonglong, success: bool, exception: UltralightString) {.cdecl.} =
  let javaScriptContext = view.lockJavaScriptContext()

  let currentContext = getSharedState()
  javaScriptContext.addToWindow("configuration", javaScriptContext.objectMake(Configuration.makeJSClass(), cast[pointer](currentContext.configuration)))
  javaScriptContext.exportWindow("closeOverlay", closeOverlay)

  unlockJavaScriptContext(view)

proc addConsoleMessageCallback*(userData: pointer, view: UltralightView, source: UltralightMessageSource, level: UltralightMessageLevel, message: UltralightString, length: uint32, line: uint32, originalMessage: UltralightString) {.cdecl.} =
  echo fmt"[{level}] {message.data}"

proc preinitialize(self: SharedState) =
  #[Platform loader]#
  enablePlatformFontLoader()
  enablePlatformFileSystem(newUltralightString("assets"))
  `platformLogger=`(UltralightLogger(logMessage: proc(level: UltralightLogLevel, message: UltralightString) {.cdecl.} =
    echo fmt"[{level}] {message.data}"
  ))

  #[Configuration]#
  self.ultralightContext.config = newUltralightConfig()
  self.ultralightContext.config.faceWinding = CounterClockwise
  self.ultralightContext.config.fontHinting = Smooth

  #[View configuration]#
  self.ultralightContext.viewConfig = newUltralightViewConfig()
  let userAgent = newUltralightString("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36")
  disposable(userAgent):
    self.ultralightContext.viewConfig.userAgent = userAgent

  self.ultralightContext.viewConfig.accelerated = false 
  self.ultralightContext.viewConfig.transparent = true

  let fontFamilyStandart = newUltralightString("Outfit")
  disposable(fontFamilyStandart):
    self.ultralightContext.viewConfig.fontFamilyStandard = fontFamilyStandart

  #[Session and renderer creation]#
  self.ultralightContext.renderer = newUltralightRenderer(self.ultralightContext.config)
  let sessionName = newUltralightString("myyaw")
  disposable(sessionName):
    self.ultralightContext.session = newUltralightSession(self.ultralightContext.renderer, false, sessionName)

  self.configuration = new(Configuration)

proc setupWindowCallback*(window: GLFWWindow) =
  doAssert window.setWindowSizeCallback(sizeCallback) != nil, "setWindowSizeCallback failed"
  doAssert window.setCursorPosCallback(positionCallback) != nil, "setCursorPosCallback failed"
  doAssert window.setMouseButtonCallback(clickCallback) != nil, "setMouseButtonCallback failed"
  doAssert window.setCharCallback(nil) != nil, "setCharCallback failed"
  doAssert window.setScrollCallback(scrollCallback) != nil, "setScrollCallback failed"
  doAssert window.setCharModsCallback(modifierCallback) == nil, "setCharModsCallback failed"
  doAssert window.setKeyCallback(keyCallback) != nil, "setKeyCallback failed"
  setContextPreloadingCallback(preinitialize)

var prevKeyDownState: bool = false

proc shouldOpenOverlay*(): bool

when defined(linux):
  import x11/[x, xlib, xtst]

  var
    display = XOpenDisplay(nil)
    root = XRootWindow(display, 0)

  proc keyPressed*(key: int): bool =
    var keys: array[0..31, char]
    discard XQueryKeymap(display, keys)
    let keycode = XKeysymToKeycode(display, key.culong)
    (ord(keys[keycode.int div 8]) and (1 shl (keycode.int mod 8))) != 0

  proc shouldOpenOverlay*(): bool =
    let currKeyState = keyPressed(0xFF63)
    if currKeyState and not prevKeyDownState:
      result = true
    else:
      result = false

    prevKeyDownState = currKeyState

elif defined(windows):
  import winim/lean
  
  proc shouldOpenOverlay*(): bool =
    let currKeyState = GetAsyncKeyState(VK_INSERT) == -32768

    if currKeyState and not prevKeyDownState:
      result = true
    else:
      result = false

    prevKeyDownState = currKeyState