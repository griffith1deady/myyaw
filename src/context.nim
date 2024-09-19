from raylib import Vector2
from glfw import GLFWWindow
import ultralight

type
  GlobalState* = object
    screenSize*: Vector2
    cursorPos*: Vector2
    scrollOffset*: Vector2
    contentScale*: Vector2
    showUltralightOverlay*: bool
    ultralightContext*: tuple[
      session: UltralightSession,
      view: UltralightView,
      renderer: UltralightRenderer,
      config: UltralightConfig,
      viewConfig: UltralightViewConfig
    ]
    raylibContext*: tuple[
      sizeCallback: proc(window: GLFWWindow, width: int32, height: int32) {.cdecl.},
      clickCallback: proc(window: GLFWWindow, button: int32, action: int32, mods: int32) {.cdecl.},
      scrollCallback: proc(window: GLFWWindow, xoffset: float64, yoffset: float64) {.cdecl.},
      positionCallback: proc(window: GLFWWindow, x: float64, y: float64) {.cdecl.},
      keyCallback: proc(window: GLFWWindow, key: int32, scancode: int32, action: int32, mods: int32) {.cdecl.},
      charCallback: proc(window: GLFWWindow, codepoint: uint32) {.cdecl.},
    ]
  SharedState* = ptr GlobalState

var contextInitializationCallback: proc(self: SharedState) {.closure.}

proc setContextPreloadingCallback*(callback: proc(self: SharedState) {.closure.}) =
  contextInitializationCallback = callback

proc getSharedState*(): SharedState {.inline.} =
  var sharedState {.global.}: SharedState

  if sharedState.isNil:
    sharedState = cast[SharedState](allocShared0(sizeof(GlobalState)))
    if contextInitializationCallback != nil:
      contextInitializationCallback(sharedState)

  return sharedState