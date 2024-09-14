from raylib import Vector2
import ultralight

type
  GlobalState* = object
    screenSize*: Vector2
    cursorPos*: Vector2
    scrollOffset*: Vector2
    ultralightContext*: tuple[
      session: UltralightSession,
      view: UltralightView,
      renderer: UltralightRenderer,
      config: UltralightConfig,
      viewConfig: UltralightViewConfig
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