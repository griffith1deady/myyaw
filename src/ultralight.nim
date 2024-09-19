
const libraryFormat = when defined(windows):
    ".dll"
elif defined(linux):
    ".so"
else:
    ".dylib"

const libraryPrefix = when defined(windows):
    ""
elif defined(linux):
    "lib"
else:
    "lib"

{.pragma: appCoreImport, cdecl, dynlib: libraryPrefix & "AppCore" & libraryFormat.}
{.pragma: ultralightImport, cdecl, dynlib: libraryPrefix & "Ultralight" & libraryFormat.}
{.pragma: ultralightCoreImport, cdecl, dynlib: libraryPrefix & "UltralightCore" & libraryFormat.}
{.pragma: webkitImport, cdecl, dynlib: libraryPrefix & "WebCore" & libraryFormat.}

const
  PropertyAttributeNone* = cint(0)
  PropertyAttributeReadOnly* = cint(2)
  PropertyAttributeDontEnum* = cint(4)
  PropertyAttributeDontDelete* = cint(8)
  ClassAttributeNone* = cint(0)
  ClassAttributeNoAutomaticPrototype* = cint(2)

type
  JavaScriptTypeEnum* {.size: sizeof(cint).} = enum
    TypeUndefined = 0, TypeNull = 1, TypeBoolean = 2, TypeNumber = 3,
    TypeString = 4, TypeObject = 5, TypeSymbol = 6
  JavaScriptTypedArrayTypeEnum* {.size: sizeof(cint).} = enum
    TypedArrayTypeInt8Array = 0, TypedArrayTypeInt16Array = 1,
    TypedArrayTypeInt32Array = 2, TypedArrayTypeUint8Array = 3,
    TypedArrayTypeUint8ClampedArray = 4, TypedArrayTypeUint16Array = 5,
    TypedArrayTypeUint32Array = 6, TypedArrayTypeFloat32Array = 7,
    TypedArrayTypeFloat64Array = 8, TypedArrayTypeArrayBuffer = 9,
    TypedArrayTypeNone = 10, TypedArrayTypeBigInt64Array = 11,
    TypedArrayTypeBigUint64Array = 12
  UltralightMessageSourceEnum* {.size: sizeof(cint).} = enum
    MessageSourceXML = 0, RceJavaScript = 1, MessageSourceNetwork = 2,
    MessageSourceConsoleAPI = 3, MessageSourceStorage = 4,
    MessageSourceAppCache = 5, MessageSourceRendering = 6, MessageSourceCSS = 7,
    MessageSourceSecurity = 8, MessageSourceContentBlocker = 9,
    MessageSourceOther = 10
  UltralightMessageLevelEnum* {.size: sizeof(cint).} = enum
    MessageLevelLog = 1, MessageLevelWarning = 2, MessageLevelError = 3,
    MessageLevelDebug = 4, MessageLevelInfo = 5
  UltralightCursorEnum* {.size: sizeof(cint).} = enum
    CursorPointer = 0, CursorCross = 1, CursorHand = 2, CursorIBeam = 3,
    CursorWait = 4, CursorHelp = 5, CursorEastResize = 6, CursorNorthResize = 7,
    CursorNorthEastResize = 8, CursorNorthWestResize = 9,
    CursorSouthResize = 10, CursorSouthEastResize = 11,
    CursorSouthWestResize = 12, CursorWestResize = 13,
    CursorNorthSouthResize = 14, CursorEastWestResize = 15,
    CursorNorthEastSouthWestResize = 16, CursorNorthWestSouthEastResize = 17,
    CursorColumnResize = 18, CursorRowResize = 19, CursorMiddlePanning = 20,
    CursorEastPanning = 21, CursorNorthPanning = 22,
    CursorNorthEastPanning = 23, CursorNorthWestPanning = 24,
    CursorSouthPanning = 25, CursorSouthEastPanning = 26,
    CursorSouthWestPanning = 27, CursorWestPanning = 28, CursorMove = 29,
    CursorVerticalText = 30, CursorCell = 31, CursorContextMenu = 32,
    CursorAlias = 33, CursorProgress = 34, CursorNoDrop = 35, CursorCopy = 36,
    CursorNone = 37, CursorNotAllowed = 38, CursorZoomIn = 39,
    CursorZoomOut = 40, CursorGrab = 41, CursorGrabbing = 42, CursorCustom = 43
  UltralightBitmapFormatEnum* {.size: sizeof(cint).} = enum
    BitmapFormatA8UNORM = 0, BitmapFormatBGRA8UNORMSRGB = 1
  UltralightKeyEventTypeEnum* {.size: sizeof(cint).} = enum
    KeyEventTypeKeyDown = 0, KeyEventTypeKeyUp = 1, KeyEventTypeRawKeyDown = 2,
    KeyEventTypeChar = 3
  UltralightMouseEventTypeEnum* {.size: sizeof(cint).} = enum
    MouseEventTypeMouseMoved = 0, MouseEventTypeMouseDown = 1,
    MouseEventTypeMouseUp = 2
  UltralightMouseButtonEnum* {.size: sizeof(cint).} = enum
    MouseButtonNone = 0, MouseButtonLeft = 1, MouseButtonMiddle = 2,
    MouseButtonRight = 3
  UltralightScrollEventTypeEnum* {.size: sizeof(cint).} = enum
    ScrollEventTypeScrollByPixel = 0, ScrollEventTypeScrollByPage = 1
  UltralightGamepadEventTypeEnum* {.size: sizeof(cint).} = enum
    GamepadEventTypeConnected = 0, GamepadEventTypeDisconnected = 1
  UltralightFaceWindingEnum* {.size: sizeof(cint).} = enum
    FaceWindingClockwise = 0, FaceWindingCounterClockwise = 1
  UltralightFontHintingEnum* {.size: sizeof(cint).} = enum
    FontHintingSmooth = 0, FontHintingNormal = 1, FontHintingMonochrome = 2
  UltralightVertexBufferFormatEnum* {.size: sizeof(cint).} = enum
    VertexBufferFormat2f4ub2f = 0, VertexBufferFormat2f4ub2f2f28f = 1
  UltralightShaderTypeEnum* {.size: sizeof(cint).} = enum
    ShaderTypeFill = 0, ShaderTypeFillPath = 1
  UltralightCommandTypeEnum* {.size: sizeof(cint).} = enum
    CommandTypeClearRenderBuffer = 0, CommandTypeDrawGeometry = 1
  UltralightLogLevelEnum* {.size: sizeof(cint).} = enum
    LogLevelError = 0, LogLevelWarning = 1, LogLevelInfo = 2
  UltralightWindowFlagsEnum* {.size: sizeof(cint).} = enum
    WindowFlagsBorderless = 1, WindowFlagsTitled = 2, WindowFlagsResizable = 4,
    WindowFlagsMaximizable = 8, WindowFlagsHidden = 16

type
  OpaqueSettingsStruct* = object
  OpaqueWindowStruct* = object
  OpaqueRendererStruct* = object
  OpaqueViewStruct* = object
  OpaqueScrollEventStruct* = object
  OpaqueJavaScriptContextStruct* = object
  OpaqueAppStruct* = object
  OpaqueGamepadButtonEventStruct* = object
  OpaqueKeyEventStruct* = object
  OpaqueMouseEventStruct* = object
  OpaqueViewConfigStruct* = object
  OpaqueJavaScriptPropertyNameArrayStruct* = object
  OpaqueBitmapStruct* = object
  OpaqueStringStruct* = object
  OpaqueSurfaceStruct* = object
  OpaqueJavaScriptContextGroupStruct* = object
  OpaqueMonitorStruct* = object
  OpaqueConfigStruct* = object
  OpaqueSessionStruct* = object
  OpaqueGamepadAxisEventStruct* = object
  OpaqueJavaScriptStringStruct* = object
  OpaqueJavaScriptValueStruct* = object
  OpaqueJavaScriptClassStruct* = object
  OpaqueBufferStruct* = object
  OpaqueOverlayStruct* = object
  OpaqueFontFileStruct* = object
  OpaqueGamepadEventStruct* = object
  OpaqueJavaScriptPropertyNameAccumulatorStruct* = object

type
  JavaScriptContextGroupRef* = ptr OpaqueJavaScriptContextGroupStruct
  JavaScriptContextRef* = ptr OpaqueJavaScriptContextStruct
  JavaScriptGlobalContextRef* = ptr OpaqueJavaScriptContextStruct
  JavaScriptStringRef* = ptr OpaqueJavaScriptStringStruct
  JavaScriptClassRef* = ptr OpaqueJavaScriptClassStruct
  JavaScriptPropertyNameArrayRef* = ptr OpaqueJavaScriptPropertyNameArrayStruct
  JavaScriptPropertyNameAccumulatorRef* = ptr OpaqueJavaScriptPropertyNameAccumulatorStruct
  JavaScriptTypedArrayBytesDeallocator* = proc (a0: pointer; a1: pointer): void {.cdecl.}
  JavaScriptValueRef* = ptr OpaqueJavaScriptValueStruct
  JavaScriptObjectRef* = ptr OpaqueJavaScriptValueStruct
  JavaScriptType* = JavaScriptTypeEnum
  JavaScriptTypedArrayType* = JavaScriptTypedArrayTypeEnum
  JavaScriptPropertyAttributes* = cuint
  JavaScriptClassAttributes* = cuint
  JavaScriptObjectInitializeCallback* = proc (a0: JavaScriptContextRef; a1: JavaScriptObjectRef): void {.cdecl.}
  JavaScriptObjectFinalizeCallback* = proc (a0: JavaScriptObjectRef): void {.cdecl.}
  JavaScriptObjectHasPropertyCallback* = proc (a0: JavaScriptContextRef; a1: JavaScriptObjectRef; a2: JavaScriptStringRef): bool {.cdecl.}
  JavaScriptObjectGetPropertyCallback* = proc (a0: JavaScriptContextRef; a1: JavaScriptObjectRef; a2: JavaScriptStringRef; a3: ptr JavaScriptValueRef): JavaScriptValueRef {.cdecl.}
  JavaScriptObjectSetPropertyCallback* = proc (a0: JavaScriptContextRef; a1: JavaScriptObjectRef; a2: JavaScriptStringRef; a3: JavaScriptValueRef; a4: ptr JavaScriptValueRef): bool {.cdecl.}
  JavaScriptObjectDeletePropertyCallback* = proc (a0: JavaScriptContextRef; a1: JavaScriptObjectRef; a2: JavaScriptStringRef; a3: ptr JavaScriptValueRef): bool {.cdecl.}
  JavaScriptObjectGetPropertyNamesCallback* = proc (a0: JavaScriptContextRef; a1: JavaScriptObjectRef; a2: JavaScriptPropertyNameAccumulatorRef): void {.cdecl.}
  JavaScriptObjectCallAsFunctionCallback* = proc (a0: JavaScriptContextRef; a1: JavaScriptObjectRef; a2: JavaScriptObjectRef; a3: csize_t; a4: ptr UncheckedArray[JavaScriptValueRef]; a5: ptr JavaScriptValueRef): JavaScriptValueRef {.cdecl.}
  JavaScriptObjectCallAsConstructorCallback* = proc (a0: JavaScriptContextRef; a1: JavaScriptObjectRef; a2: csize_t; a3: ptr UncheckedArray[JavaScriptValueRef]; a4: ptr JavaScriptValueRef): JavaScriptObjectRef {.cdecl.}
  JavaScriptObjectHasInstanceCallback* = proc (a0: JavaScriptContextRef; a1: JavaScriptObjectRef; a2: JavaScriptValueRef; a3: ptr JavaScriptValueRef): bool {.cdecl.}
  JavaScriptObjectConvertToTypeCallback* = proc (a0: JavaScriptContextRef; a1: JavaScriptObjectRef; a2: JavaScriptType; a3: ptr JavaScriptValueRef): JavaScriptValueRef {.cdecl.}
  JavaScriptStaticValueStruct* {.pure, inheritable, bycopy.} = object
    name*: cstring           
    getProperty*: JavaScriptObjectGetPropertyCallback
    setProperty*: JavaScriptObjectSetPropertyCallback
    attributes*: JavaScriptPropertyAttributes
  JavaScriptStaticValue* = JavaScriptStaticValueStruct
  JavaScriptStaticFunctionStruct* {.pure, inheritable, bycopy.} = object
    name*: cstring      
    callAsFunction*: JavaScriptObjectCallAsFunctionCallback
    attributes*: JavaScriptPropertyAttributes
  JavaScriptStaticFunction* = JavaScriptStaticFunctionStruct
  JavaScriptClassDefinitionStruct* {.pure, inheritable, bycopy.} = object
    version*: cint        
    attributes*: JavaScriptClassAttributes
    className*: cstring
    parentClass*: JavaScriptClassRef
    staticValues*: ptr JavaScriptStaticValue
    staticFunctions*: ptr JavaScriptStaticFunction
    initialize*: JavaScriptObjectInitializeCallback
    finalize*: JavaScriptObjectFinalizeCallback
    hasProperty*: JavaScriptObjectHasPropertyCallback
    getProperty*: JavaScriptObjectGetPropertyCallback
    setProperty*: JavaScriptObjectSetPropertyCallback
    deleteProperty*: JavaScriptObjectDeletePropertyCallback
    getPropertyNames*: JavaScriptObjectGetPropertyNamesCallback
    callAsFunction*: JavaScriptObjectCallAsFunctionCallback
    callAsConstructor*: JavaScriptObjectCallAsConstructorCallback
    hasInstance*: JavaScriptObjectHasInstanceCallback
    convertToType*: JavaScriptObjectConvertToTypeCallback
  JavaScriptClassDefinition* = JavaScriptClassDefinitionStruct
  JavaScriptChar* = wcharT
  wcharT* = cushort
  UltralightChar16* = cushort
  UltralightConfig* = ptr OpaqueConfigStruct
  UltralightRenderer* = ptr OpaqueRendererStruct
  UltralightSession* = ptr OpaqueSessionStruct
  UltralightViewConfig* = ptr OpaqueViewConfigStruct
  UltralightView* = ptr OpaqueViewStruct
  UltralightBitmap* = ptr OpaqueBitmapStruct
  UltralightString* = ptr OpaqueStringStruct
  UltralightBuffer* = ptr OpaqueBufferStruct
  UltralightKeyEvent* = ptr OpaqueKeyEventStruct
  UltralightMouseEvent* = ptr OpaqueMouseEventStruct
  UltralightScrollEvent* = ptr OpaqueScrollEventStruct
  UltralightGamepadEvent* = ptr OpaqueGamepadEventStruct
  UltralightGamepadAxisEvent* = ptr OpaqueGamepadAxisEventStruct
  UltralightGamepadButtonEvent* = ptr OpaqueGamepadButtonEventStruct
  UltralightSurface* = ptr OpaqueSurfaceStruct
  UltralightBitmapSurface* = ptr OpaqueSurfaceStruct
  UltralightFontFile* = ptr OpaqueFontFileStruct
  UltralightMessageSource* = UltralightMessageSourceEnum
  UltralightMessageLevel* = UltralightMessageLevelEnum
  UltralightCursor* = UltralightCursorEnum
  UltralightBitmapFormat* = UltralightBitmapFormatEnum
  UltralightKeyEventType* = UltralightKeyEventTypeEnum
  UltralightMouseEventType* = UltralightMouseEventTypeEnum
  UltralightMouseButton* = UltralightMouseButtonEnum 
  UltralightScrollEventType* = UltralightScrollEventTypeEnum
  UltralightGamepadEventType* = UltralightGamepadEventTypeEnum
  UltralightFaceWinding* = UltralightFaceWindingEnum
  UltralightFontHinting* = UltralightFontHintingEnum
  UltralightRectStruct* {.pure, inheritable, bycopy.} = object
    left*: cfloat            
    top*: cfloat
    right*: cfloat
    bottom*: cfloat
  UltralightRect* = UltralightRectStruct
  UltralightIntRectStruct* {.pure, inheritable, bycopy.} = object
    left*: cint             
    top*: cint
    right*: cint
    bottom*: cint
  UltralightIntRect* = UltralightIntRectStruct
  UltralightRenderTargetStruct* {.pure, inheritable, bycopy.} = object
    isEmpty*: bool        
    width*: cuint
    height*: cuint
    textureId*: cuint
    textureWidth*: cuint
    textureHeight*: cuint
    textureFormat*: UltralightBitmapFormat
    uvCoords*: UltralightRect
    renderBufferId*: cuint
  UltralightRenderTarget* = UltralightRenderTargetStruct
  ulDestroyBUfferCallback* = proc (a0: pointer; a1: pointer): void {.cdecl.}
  UltralightClipboardClearCallback* = proc (): void {.cdecl.}
  UltralightClipboardReadPlainTextCallback* = proc (a0: UltralightString): void {.cdecl.}
  UltralightClipboardWritePlainTextCallback* = proc (a0: UltralightString): void {.cdecl.}
  UltralightClipboardStruct* {.pure, inheritable, bycopy.} = object
    clear*: UltralightClipboardClearCallback
    readPlainText*: UltralightClipboardReadPlainTextCallback
    writePlainText*: UltralightClipboardWritePlainTextCallback
  UltralightClipboard* = UltralightClipboardStruct
  UltralightFileSystemFileExistsCallback* = proc (a0: UltralightString): bool {.cdecl.}
  UltralightFileSystemGetFileMimeTypeCallback* = proc (a0: UltralightString): UltralightString {.cdecl.}
  UltralightFileSystemGetFileCharsetCallback* = proc (a0: UltralightString): UltralightString {.cdecl.}
  UltralightFileSystemOpenFileCallback* = proc (a0: UltralightString): UltralightBuffer {.cdecl.}
  UltralightFileSystemStruct* {.pure, inheritable, bycopy.} = object
    fileExists*: UltralightFileSystemFileExistsCallback
    getFileMimeType*: UltralightFileSystemGetFileMimeTypeCallback
    getFileCharset*: UltralightFileSystemGetFileCharsetCallback
    openFile*: UltralightFileSystemOpenFileCallback
  UltralightFileSystem* = UltralightFileSystemStruct
  UltralightFontLoaderGetFallbackFont* = proc (): UltralightString {.cdecl.}
  UltralightFontLoaderGetFallbackFontForCharacters* = proc (a0: UltralightString; a1: cint; a2: bool): UltralightString {.cdecl.}
  UltralightFontLoaderLoad* = proc (a0: UltralightString; a1: cint; a2: bool): UltralightFontFile {.cdecl.}                
  UltralightFontLoaderStruct* {.pure, inheritable, bycopy.} = object
    getFallbackFont*: UltralightFontLoaderGetFallbackFont
    getFallbackFontForCharacters*: UltralightFontLoaderGetFallbackFontForCharacters
    load*: UltralightFontLoaderLoad
  UltralightFontLoader* = UltralightFontLoaderStruct
  UltralightRenderBufferStruct* {.pure, inheritable, bycopy.} = object
    textureId*: cuint
    width*: cuint
    height*: cuint
    hasStencilBuffer*: bool
    hasDepthBuffer*: bool
  UltralightRenderBuffer* = UltralightRenderBufferStruct
  UltralightVertex2f4ub2fStruct* {.pure, inheritable, bycopy.} = object
    pos*: array[2'i64, cfloat]
    color*: array[4'i64, uint8]
    obj*: array[2'i64, cfloat]
  UltralightVertex2f4ub2f* = UltralightVertex2f4ub2fStruct
  UltralightVertex2f4ub2f2f28fStruct* {.pure, inheritable, bycopy.} = object
    pos*: array[2'i64, cfloat] 
    color*: array[4'i64, uint8]
    tex*: array[2'i64, cfloat]
    obj*: array[2'i64, cfloat]
    data0*: array[4'i64, cfloat]
    data1*: array[4'i64, cfloat]
    data2*: array[4'i64, cfloat]
    data3*: array[4'i64, cfloat]
    data4*: array[4'i64, cfloat]
    data5*: array[4'i64, cfloat]
    data6*: array[4'i64, cfloat]
  UltralightVertex2f4ub2f2f28f* = UltralightVertex2f4ub2f2f28fStruct
  UltralightVertexBufferFormat* = UltralightVertexBufferFormatEnum
  UltralightVertexBufferStruct* {.pure, inheritable, bycopy.} = object
    format*: UltralightVertexBufferFormat
    size*: cuint
    data*: ptr uint8
  UltralightVertexBuffer* = UltralightVertexBufferStruct
  UltralightIndexType* = cuint
  UltralightIndexBufferStruct* {.pure, inheritable, bycopy.} = object
    size*: cuint
    data*: ptr uint8
  UltralightIndexBuffer* = UltralightIndexBufferStruct
  UltralightShaderType* = UltralightShaderTypeEnum
  UltralightMatrix4x4Struct* {.pure, inheritable, bycopy.} = object
    data*: array[16'i64, cfloat]
  UltralightMatrix4x4* = UltralightMatrix4x4Struct
  UltralightVec4Struct* {.pure, inheritable, bycopy.} = object
    value*: array[4'i64, cfloat]
  UltralightVec4* = UltralightVec4Struct
  UltralightGPUStateStruct* {.pure, inheritable, bycopy.} = object
    viewportWidth*: cuint
    viewportHeight*: cuint
    transform*: UltralightMatrix4x4
    enableTexturing*: bool
    enableBlend*: bool
    shaderType*: uint8
    renderBufferId*: cuint
    texture1Id*: cuint
    texture2Id*: cuint
    texture3Id*: cuint
    uniformScalar*: array[8'i64, cfloat]
    uniformVector*: array[8'i64, UltralightVec4]
    clipSize*: uint8
    clip*: array[8'i64, UltralightMatrix4x4]
    enableScissor*: bool
    scissorRect*: UltralightIntRect
  UltralightGPUState* = UltralightGPUStateStruct
  UltralightCommandType* = UltralightCommandTypeEnum
  UltralightCommandStruct* {.pure, inheritable, bycopy.} = object
    commandType*: uint8
    gpuState*: UltralightGPUState
    geometryId*: cuint
    indicesCount*: cuint
    indicesOffset*: cuint
  UltralightCommand* = UltralightCommandStruct
  UltralightCommandListStruct* {.pure, inheritable, bycopy.} = object
    size*: cuint           
    commands*: ptr UltralightCommand
  UltralightCommandList* = UltralightCommandListStruct
  UltralightGPUDriverBeginSynchronizeCallback* = proc (): void {.cdecl.}
  UltralightGPUDriverEndSynchronizeCallback* = proc (): void {.cdecl.}
  UltralightGPUDriverNextTextureIdCallback* = proc (): cuint {.cdecl.}
  UltralightGPUDriverCreateTextureCallback* = proc (a0: cuint; a1: UltralightBitmap): void {.cdecl.}
  UltralightGPUDriverUpdateTextureCallback* = proc (a0: cuint; a1: UltralightBitmap): void {.cdecl.} 
  UltralightGPUDriverDestroyTextureCallback* = proc (a0: cuint): void {.cdecl.}
  UltralightGPUDriverNextRenderBufferIdCallback* = proc (): cuint {.cdecl.}
  UltralightGPUDriverCreateRenderBufferCallback* = proc (a0: cuint; a1: UltralightRenderBuffer): void {.cdecl.}
  UltralightGPUDriverDestroyRenderBufferCallback* = proc (a0: cuint): void {.cdecl.}
  UltralightGPUDriverNextGeometryIdCallback* = proc (): cuint {.cdecl.}
  UltralightGPUDriverCreateGeometryCallback* = proc (a0: cuint; a1: UltralightVertexBuffer; a2: UltralightIndexBuffer): void {.cdecl.}
  UltralightGPUDriverUpdateGeometryCallback* = proc (a0: cuint; a1: UltralightVertexBuffer; a2: UltralightIndexBuffer): void {.cdecl.}
  UltralightGPUDriverDestroyGeometryCallback* = proc (a0: cuint): void {.cdecl.}
  UltralightGPUDriverUpdateCommandListCallback* = proc (a0: UltralightCommandList): void {.cdecl.}
  UltralightGPUDriverStruct* {.pure, inheritable, bycopy.} = object
    beginSynchronize*: UltralightGPUDriverBeginSynchronizeCallback
    endSynchronize*: UltralightGPUDriverEndSynchronizeCallback
    nextTextureId*: UltralightGPUDriverNextTextureIdCallback
    createTexture*: UltralightGPUDriverCreateTextureCallback
    updateTexture*: UltralightGPUDriverUpdateTextureCallback
    destroyTexture*: UltralightGPUDriverDestroyTextureCallback
    nextRenderBufferId*: UltralightGPUDriverNextRenderBufferIdCallback
    createRenderBuffer*: UltralightGPUDriverCreateRenderBufferCallback
    destroyRenderBuffer*: UltralightGPUDriverDestroyRenderBufferCallback
    nextGeometryId*: UltralightGPUDriverNextGeometryIdCallback
    createGeometry*: UltralightGPUDriverCreateGeometryCallback
    updateGeometry*: UltralightGPUDriverUpdateGeometryCallback
    destroyGeometry*: UltralightGPUDriverDestroyGeometryCallback
    updateCommandList*: UltralightGPUDriverUpdateCommandListCallback
  UltralightGPUDriver* = UltralightGPUDriverStruct
  uintptrT* = culonglong
  intptrT* = clonglong
  UltralightLogLevel* = UltralightLogLevelEnum
  UltralightLoggerLogMessageCallback* = proc (a0: UltralightLogLevel; a1: UltralightString): void {.cdecl.}
  UltralightLoggerStruct* {.pure, inheritable, bycopy.} = object
    logMessage*: UltralightLoggerLogMessageCallback
  UltralightLogger* = UltralightLoggerStruct
  UltralightSurfaceDefinitionCreateCallback* = proc (a0: cuint; a1: cuint): pointer {.cdecl.}
  UltralightSurfaceDefinitionDestroyCallback* = proc (a0: pointer): void {.cdecl.}
  UltralightSurfaceDefinitionGetWidthCallback* = proc (a0: pointer): cuint {.cdecl.}
  UltralightSurfaceDefinitionGetHeightCallback* = proc (a0: pointer): cuint {.cdecl.}
  UltralightSurfaceDefinitionGetRowBytesCallback* = proc (a0: pointer): cuint {.cdecl.}
  UltralightSurfaceDefinitionGetSizeCallback* = proc (a0: pointer): csize_t {.cdecl.}
  UltralightSurfaceDefinitionLockPixelsCallback* = proc (a0: pointer): pointer {.cdecl.}
  UltralightSurfaceDefinitionUnlockPixelsCallback* = proc (a0: pointer): void {.cdecl.}
  UltralightSurfaceDefinitionResizeCallback* = proc (a0: pointer; a1: cuint; a2: cuint): void {.cdecl.}
  UltralightSurfaceDefinitionStruct* {.pure, inheritable, bycopy.} = object
    create*: UltralightSurfaceDefinitionCreateCallback
    destroy*: UltralightSurfaceDefinitionDestroyCallback
    getWidth*: UltralightSurfaceDefinitionGetWidthCallback
    getHeight*: UltralightSurfaceDefinitionGetHeightCallback
    getRowBytes*: UltralightSurfaceDefinitionGetRowBytesCallback
    getSize*: UltralightSurfaceDefinitionGetSizeCallback
    lockPixels*: UltralightSurfaceDefinitionLockPixelsCallback
    unlockPixels*: UltralightSurfaceDefinitionUnlockPixelsCallback
    resize*: UltralightSurfaceDefinitionResizeCallback
  UltralightSurfaceDefinition* = UltralightSurfaceDefinitionStruct
  UltralightChangeTitleCallback* = proc (a0: pointer; a1: UltralightView; a2: UltralightString): void {.cdecl.}
  UltralightChangeURLCallback* = proc (a0: pointer; a1: UltralightView; a2: UltralightString): void {.cdecl.}
  UltralightChangeTooltipCallback* = proc (a0: pointer; a1: UltralightView; a2: UltralightString): void {.cdecl.}
  UltralightChangeCursorCallback* = proc (a0: pointer; a1: UltralightView; a2: UltralightCursor): void {.cdecl.}
  UltralightAddConsoleMessageCallback* = proc (a0: pointer; a1: UltralightView; a2: UltralightMessageSource; a3: UltralightMessageLevel; a4: UltralightString; a5: cuint; a6: cuint; a7: UltralightString): void {.cdecl.}
  UltralightCreateChildViewCallback* = proc (a0: pointer; a1: UltralightView; a2: UltralightString; a3: UltralightString; a4: bool; a5: UltralightIntRect): UltralightView {.cdecl.}
  UltralightCreateInspectorViewCallback* = proc (a0: pointer; a1: UltralightView; a2: bool; a3: UltralightString): UltralightView {.cdecl.}        
  UltralightBeginLoadingCallback* = proc (a0: pointer; a1: UltralightView; a2: culonglong; a3: bool; a4: UltralightString): void {.cdecl.}
  UltralightFinishLoadingCallback* = proc (a0: pointer; a1: UltralightView; a2: culonglong; a3: bool; a4: UltralightString): void {.cdecl.}
  UltralightFailLoadingCallback* = proc (a0: pointer; a1: UltralightView; a2: culonglong; a3: bool; a4: UltralightString; a5: UltralightString; a6: UltralightString; a7: cint): void {.cdecl.}
  UltralightWindowObjectReadyCallback* = proc (a0: pointer; a1: UltralightView; a2: culonglong; a3: bool; a4: UltralightString): void {.cdecl.} 
  UltralightDOMReadyCallback* = proc (a0: pointer; a1: UltralightView; a2: culonglong; a3: bool; a4: UltralightString): void {.cdecl.}
  UltralightUpdateHistoryCallback* = proc (a0: pointer; a1: UltralightView): void {.cdecl.}
  UltralightSettings* = ptr OpaqueSettingsStruct
  UltralightApp* = ptr OpaqueAppStruct
  UltralightWindow* = ptr OpaqueWindowStruct
  UltralightMonitor* = ptr OpaqueMonitorStruct
  UltralightOverlay* = ptr OpaqueOverlayStruct
  UltralightWindowFlags* = UltralightWindowFlagsEnum
  UltralightUpdateCallback* = proc (a0: pointer): void {.cdecl.}
  UltralightCloseCallback* = proc (a0: pointer; a1: UltralightWindow): void {.cdecl.}
  UltralightResizeCallback* = proc (a0: pointer; a1: UltralightWindow; a2: cuint; a3: cuint): void {.cdecl.}

when 0 is static:
  const
    JavaScriptCOBJCAPIENABLED* = 0
else:
  let JavaScriptCOBJCAPIENABLED* = 0

proc evaluateScript*(context: JavaScriptContextRef; script: JavaScriptStringRef;
                     thisObject: JavaScriptObjectRef;
                     sourceURL: JavaScriptStringRef; startingLineNumber: cint;
                     exception: ptr JavaScriptValueRef): JavaScriptValueRef {.
    cdecl, importc: "JSEvaluateScript".}
proc checkScriptSyntax*(context: JavaScriptContextRef;
                        script: JavaScriptStringRef;
                        sourceURL: JavaScriptStringRef;
                        startingLineNumber: cint;
                        exception: ptr JavaScriptValueRef): bool {.cdecl,
    importc: "JSCheckScriptSyntax".}
proc garbageCollect*(context: JavaScriptContextRef): void {.cdecl,
    importc: "JSGarbageCollect".}
proc valueGetType*(context: JavaScriptContextRef; value: JavaScriptValueRef): JavaScriptType {.
    cdecl, importc: "JSValueGetType".}
proc valueIsUndefined*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.
    cdecl, importc: "JSValueIsUndefined".}
proc valueIsNull*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.
    cdecl, importc: "JSValueIsNull".}
proc valueIsBoolean*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.
    cdecl, importc: "JSValueIsBoolean".}
proc valueIsNumber*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.
    cdecl, importc: "JSValueIsNumber".}
proc valueIsString*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.
    cdecl, importc: "JSValueIsString".}
proc valueIsSymbol*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.
    cdecl, importc: "JSValueIsSymbol".}
proc valueIsObject*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.
    cdecl, importc: "JSValueIsObject".}
proc valueIsObjectOfClass*(context: JavaScriptContextRef;
                           value: JavaScriptValueRef;
                           jsClass: JavaScriptClassRef): bool {.cdecl,
    importc: "JSValueIsObjectOfClass".}
proc valueIsArray*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.
    cdecl, importc: "JSValueIsArray".}
proc valueIsDate*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.
    cdecl, importc: "JSValueIsDate".}
proc valueGetTypedArrayType*(context: JavaScriptContextRef;
                             value: JavaScriptValueRef;
                             exception: ptr JavaScriptValueRef): JavaScriptTypedArrayType {.
    cdecl, importc: "JSValueGetTypedArrayType".}
proc valueIsEqual*(context: JavaScriptContextRef; a: JavaScriptValueRef;
                   b: JavaScriptValueRef; exception: ptr JavaScriptValueRef): bool {.
    cdecl, importc: "JSValueIsEqual".}
proc valueIsStrictEqual*(context: JavaScriptContextRef; a: JavaScriptValueRef;
                         b: JavaScriptValueRef): bool {.cdecl,
    importc: "JSValueIsStrictEqual".}
proc valueIsInstanceOfConstructor*(context: JavaScriptContextRef;
                                   value: JavaScriptValueRef;
                                   constructor: JavaScriptObjectRef;
                                   exception: ptr JavaScriptValueRef): bool {.
    cdecl, importc: "JSValueIsInstanceOfConstructor".}
proc valueMakeUndefined*(context: JavaScriptContextRef): JavaScriptValueRef {.
    cdecl, importc: "JSValueMakeUndefined".}
proc valueMakeNull*(context: JavaScriptContextRef): JavaScriptValueRef {.cdecl,
    importc: "JSValueMakeNull".}
proc valueMakeBoolean*(context: JavaScriptContextRef; boolean: bool): JavaScriptValueRef {.
    cdecl, importc: "JSValueMakeBoolean".}
proc valueMakeNumber*(context: JavaScriptContextRef; number: cdouble): JavaScriptValueRef {.
    cdecl, importc: "JSValueMakeNumber".}
proc valueMakeString*(context: JavaScriptContextRef;
                      string_arg: JavaScriptStringRef): JavaScriptValueRef {.
    cdecl, importc: "JSValueMakeString".}
proc valueMakeSymbol*(context: JavaScriptContextRef;
                      description: JavaScriptStringRef): JavaScriptValueRef {.
    cdecl, importc: "JSValueMakeSymbol".}
proc valueMakeFromJavaScriptONString*(context: JavaScriptContextRef;
                                      string_arg: JavaScriptStringRef): JavaScriptValueRef {.
    cdecl, importc: "JSValueMakeFromJSONString".}
proc valueCreateJavaScriptONString*(context: JavaScriptContextRef;
                                    value: JavaScriptValueRef; indent: cuint;
                                    exception: ptr JavaScriptValueRef): JavaScriptStringRef {.
    cdecl, importc: "JSValueCreateJSONString".}
proc valueToBoolean*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.
    cdecl, importc: "JSValueToBoolean".}
proc valueToNumber*(context: JavaScriptContextRef; value: JavaScriptValueRef;
                    exception: ptr JavaScriptValueRef): cdouble {.cdecl,
    importc: "JSValueToNumber".}
proc valueToStringCopy*(context: JavaScriptContextRef;
                        value: JavaScriptValueRef;
                        exception: ptr JavaScriptValueRef): JavaScriptStringRef {.
    cdecl, importc: "JSValueToStringCopy".}
proc valueToObject*(context: JavaScriptContextRef; value: JavaScriptValueRef;
                    exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.
    cdecl, importc: "JSValueToObject".}
proc valueProtect*(context: JavaScriptContextRef; value: JavaScriptValueRef): void {.
    cdecl, importc: "JSValueProtect".}
proc valueUnprotect*(context: JavaScriptContextRef; value: JavaScriptValueRef): void {.
    cdecl, importc: "JSValueUnprotect".}
var kJavaScriptClassDefinitionEmpty* {.importc: "kJSClassDefinitionEmpty".}: JavaScriptClassDefinition
proc classCreate*(definition: ptr JavaScriptClassDefinition): JavaScriptClassRef {.
    cdecl, importc: "JSClassCreate".}
proc classRetain*(jsClass: JavaScriptClassRef): JavaScriptClassRef {.cdecl,
    importc: "JSClassRetain".}
proc classRelease*(jsClass: JavaScriptClassRef): void {.cdecl,
    importc: "JSClassRelease".}
proc objectMake*(context: JavaScriptContextRef; jsClass: JavaScriptClassRef;
                 data: pointer): JavaScriptObjectRef {.cdecl,
    importc: "JSObjectMake".}
proc objectMakeFunctionWithCallback*(context: JavaScriptContextRef;
                                     name: JavaScriptStringRef; callAsFunction: JavaScriptObjectCallAsFunctionCallback): JavaScriptObjectRef {.
    cdecl, importc: "JSObjectMakeFunctionWithCallback".}
proc objectMakeConstructor*(context: JavaScriptContextRef;
                            jsClass: JavaScriptClassRef; callAsConstructor: JavaScriptObjectCallAsConstructorCallback): JavaScriptObjectRef {.
    cdecl, importc: "JSObjectMakeConstructor".}
proc objectMakeArray*(context: JavaScriptContextRef; argumentCount: csize_t;
                      arguments: ptr UncheckedArray[JavaScriptValueRef];
                      exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.
    cdecl, importc: "JSObjectMakeArray".}
proc objectMakeDate*(context: JavaScriptContextRef; argumentCount: csize_t;
                     arguments: ptr UncheckedArray[JavaScriptValueRef];
                     exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.
    cdecl, importc: "JSObjectMakeDate".}
proc objectMakeError*(context: JavaScriptContextRef; argumentCount: csize_t;
                      arguments: ptr UncheckedArray[JavaScriptValueRef];
                      exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.
    cdecl, importc: "JSObjectMakeError".}
proc objectMakeRegExp*(context: JavaScriptContextRef; argumentCount: csize_t;
                       arguments: ptr UncheckedArray[JavaScriptValueRef];
                       exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.
    cdecl, importc: "JSObjectMakeRegExp".}
proc objectMakeDeferredPromise*(context: JavaScriptContextRef;
                                resolve: ptr JavaScriptObjectRef;
                                reject: ptr JavaScriptObjectRef;
                                exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.
    cdecl, importc: "JSObjectMakeDeferredPromise".}
proc objectMakeFunction*(context: JavaScriptContextRef;
                         name: JavaScriptStringRef; parameterCount: cuint;
    parameterNames: ptr UncheckedArray[JavaScriptStringRef];
                         body: JavaScriptStringRef;
                         sourceURL: JavaScriptStringRef;
                         startingLineNumber: cint;
                         exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.
    cdecl, importc: "JSObjectMakeFunction".}
proc objectGetPrototype*(context: JavaScriptContextRef;
                         object_arg: JavaScriptObjectRef): JavaScriptValueRef {.
    cdecl, importc: "JSObjectGetPrototype".}
proc objectSetPrototype*(context: JavaScriptContextRef;
                         object_arg: JavaScriptObjectRef;
                         value: JavaScriptValueRef): void {.cdecl,
    importc: "JSObjectSetPrototype".}
proc objectHasProperty*(context: JavaScriptContextRef;
                        object_arg: JavaScriptObjectRef;
                        propertyName: JavaScriptStringRef): bool {.cdecl,
    importc: "JSObjectHasProperty".}
proc objectGetProperty*(context: JavaScriptContextRef;
                        object_arg: JavaScriptObjectRef;
                        propertyName: JavaScriptStringRef;
                        exception: ptr JavaScriptValueRef): JavaScriptValueRef {.
    cdecl, importc: "JSObjectGetProperty".}
proc objectSetProperty*(context: JavaScriptContextRef;
                        object_arg: JavaScriptObjectRef;
                        propertyName: JavaScriptStringRef;
                        value: JavaScriptValueRef;
                        attributes: JavaScriptPropertyAttributes;
                        exception: ptr JavaScriptValueRef): void {.cdecl,
    importc: "JSObjectSetProperty".}
proc objectDeleteProperty*(context: JavaScriptContextRef;
                           object_arg: JavaScriptObjectRef;
                           propertyName: JavaScriptStringRef;
                           exception: ptr JavaScriptValueRef): bool {.cdecl,
    importc: "JSObjectDeleteProperty".}
proc objectHasPropertyForKey*(context: JavaScriptContextRef;
                              object_arg: JavaScriptObjectRef;
                              propertyKey: JavaScriptValueRef;
                              exception: ptr JavaScriptValueRef): bool {.cdecl,
    importc: "JSObjectHasPropertyForKey".}
proc objectGetPropertyForKey*(context: JavaScriptContextRef;
                              object_arg: JavaScriptObjectRef;
                              propertyKey: JavaScriptValueRef;
                              exception: ptr JavaScriptValueRef): JavaScriptValueRef {.
    cdecl, importc: "JSObjectGetPropertyForKey".}
proc objectSetPropertyForKey*(context: JavaScriptContextRef;
                              object_arg: JavaScriptObjectRef;
                              propertyKey: JavaScriptValueRef;
                              value: JavaScriptValueRef;
                              attributes: JavaScriptPropertyAttributes;
                              exception: ptr JavaScriptValueRef): void {.cdecl,
    importc: "JSObjectSetPropertyForKey".}
proc objectDeletePropertyForKey*(context: JavaScriptContextRef;
                                 object_arg: JavaScriptObjectRef;
                                 propertyKey: JavaScriptValueRef;
                                 exception: ptr JavaScriptValueRef): bool {.
    cdecl, importc: "JSObjectDeletePropertyForKey".}
proc objectGetPropertyAtIndex*(context: JavaScriptContextRef;
                               object_arg: JavaScriptObjectRef;
                               propertyIndex: cuint;
                               exception: ptr JavaScriptValueRef): JavaScriptValueRef {.
    cdecl, importc: "JSObjectGetPropertyAtIndex".}
proc objectSetPropertyAtIndex*(context: JavaScriptContextRef;
                               object_arg: JavaScriptObjectRef;
                               propertyIndex: cuint; value: JavaScriptValueRef;
                               exception: ptr JavaScriptValueRef): void {.cdecl,
    importc: "JSObjectSetPropertyAtIndex".}
proc objectGetPrivate*(object_arg: JavaScriptObjectRef): pointer {.cdecl,
    importc: "JSObjectGetPrivate".}
proc objectSetPrivate*(object_arg: JavaScriptObjectRef; data: pointer): bool {.
    cdecl, importc: "JSObjectSetPrivate".}
proc objectIsFunction*(context: JavaScriptContextRef;
                       object_arg: JavaScriptObjectRef): bool {.cdecl,
    importc: "JSObjectIsFunction".}
proc objectCallAsFunction*(context: JavaScriptContextRef;
                           object_arg: JavaScriptObjectRef;
                           thisObject: JavaScriptObjectRef;
                           argumentCount: csize_t;
                           arguments: ptr UncheckedArray[JavaScriptValueRef];
                           exception: ptr JavaScriptValueRef): JavaScriptValueRef {.
    cdecl, importc: "JSObjectCallAsFunction".}
proc objectIsConstructor*(context: JavaScriptContextRef;
                          object_arg: JavaScriptObjectRef): bool {.cdecl,
    importc: "JSObjectIsConstructor".}
proc objectCallAsConstructor*(context: JavaScriptContextRef;
                              object_arg: JavaScriptObjectRef;
                              argumentCount: csize_t; arguments: ptr UncheckedArray[
    JavaScriptValueRef]; exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.
    cdecl, importc: "JSObjectCallAsConstructor".}
proc objectCopyPropertyNames*(context: JavaScriptContextRef;
                              object_arg: JavaScriptObjectRef): JavaScriptPropertyNameArrayRef {.
    cdecl, importc: "JSObjectCopyPropertyNames".}
proc propertyNameArrayRetain*(array_arg: JavaScriptPropertyNameArrayRef): JavaScriptPropertyNameArrayRef {.
    cdecl, importc: "JSPropertyNameArrayRetain".}
proc propertyNameArrayRelease*(array_arg: JavaScriptPropertyNameArrayRef): void {.
    cdecl, importc: "JSPropertyNameArrayRelease".}
proc propertyNameArrayGetCount*(array_arg: JavaScriptPropertyNameArrayRef): csize_t {.
    cdecl, importc: "JSPropertyNameArrayGetCount".}
proc propertyNameArrayGetNameAtIndex*(array_arg: JavaScriptPropertyNameArrayRef;
                                      index: csize_t): JavaScriptStringRef {.
    cdecl, importc: "JSPropertyNameArrayGetNameAtIndex".}
proc propertyNameAccumulatorAddName*(accumulator: JavaScriptPropertyNameAccumulatorRef;
                                     propertyName: JavaScriptStringRef): void {.
    cdecl, importc: "JSPropertyNameAccumulatorAddName".}
proc contextGroupCreate*(): JavaScriptContextGroupRef {.cdecl,
    importc: "JSContextGroupCreate".}
proc contextGroupRetain*(group: JavaScriptContextGroupRef): JavaScriptContextGroupRef {.
    cdecl, importc: "JSContextGroupRetain".}
proc contextGroupRelease*(group: JavaScriptContextGroupRef): void {.cdecl,
    importc: "JSContextGroupRelease".}
proc globalContextCreate*(globalObjectClass: JavaScriptClassRef): JavaScriptGlobalContextRef {.
    cdecl, importc: "JSGlobalContextCreate".}
proc globalContextCreateInGroup*(group: JavaScriptContextGroupRef;
                                 globalObjectClass: JavaScriptClassRef): JavaScriptGlobalContextRef {.
    cdecl, importc: "JSGlobalContextCreateInGroup".}
proc globalContextRetain*(context: JavaScriptGlobalContextRef): JavaScriptGlobalContextRef {.
    cdecl, importc: "JSGlobalContextRetain".}
proc globalContextRelease*(context: JavaScriptGlobalContextRef): void {.cdecl,
    importc: "JSGlobalContextRelease".}
proc contextGetGlobalObject*(context: JavaScriptContextRef): JavaScriptObjectRef {.
    cdecl, importc: "JSContextGetGlobalObject".}
proc contextGetGroup*(context: JavaScriptContextRef): JavaScriptContextGroupRef {.
    cdecl, importc: "JSContextGetGroup".}
proc contextGetGlobalContext*(context: JavaScriptContextRef): JavaScriptGlobalContextRef {.
    cdecl, importc: "JSContextGetGlobalContext".}
proc globalContextCopyName*(context: JavaScriptGlobalContextRef): JavaScriptStringRef {.
    cdecl, importc: "JSGlobalContextCopyName".}
proc globalContextSetName*(context: JavaScriptGlobalContextRef;
                           name: JavaScriptStringRef): void {.cdecl,
    importc: "JSGlobalContextSetName".}
proc globalContextIsInspectable*(context: JavaScriptGlobalContextRef): bool {.
    cdecl, importc: "JSGlobalContextIsInspectable".}
proc globalContextSetInspectable*(context: JavaScriptGlobalContextRef;
                                  inspectable: bool): void {.cdecl,
    importc: "JSGlobalContextSetInspectable".}
proc stringCreateWithCharacters*(chars: ptr JavaScriptChar; numChars: csize_t): JavaScriptStringRef {.
    cdecl, importc: "JSStringCreateWithCharacters".}
proc stringCreateWithUTF8CString*(string_arg: cstring): JavaScriptStringRef {.
    cdecl, importc: "JSStringCreateWithUTF8CString".}
proc stringRetain*(string_arg: JavaScriptStringRef): JavaScriptStringRef {.
    cdecl, importc: "JSStringRetain".}
proc stringRelease*(string_arg: JavaScriptStringRef): void {.cdecl,
    importc: "JSStringRelease".}
proc stringGetLength*(string_arg: JavaScriptStringRef): csize_t {.cdecl,
    importc: "JSStringGetLength".}
proc stringGetCharactersPtr*(string_arg: JavaScriptStringRef): ptr JavaScriptChar {.
    cdecl, importc: "JSStringGetCharactersPtr".}
proc stringGetMaximumUTF8CStringSize*(string_arg: JavaScriptStringRef): csize_t {.
    cdecl, importc: "JSStringGetMaximumUTF8CStringSize".}
proc stringGetUTF8CString*(string_arg: JavaScriptStringRef; buffer: cstring;
                           bufferSize: csize_t): csize_t {.cdecl,
    importc: "JSStringGetUTF8CString".}
proc stringIsEqual*(a: JavaScriptStringRef; b: JavaScriptStringRef): bool {.
    cdecl, importc: "JSStringIsEqual".}
proc stringIsEqualToUTF8CString*(a: JavaScriptStringRef; b: cstring): bool {.
    cdecl, importc: "JSStringIsEqualToUTF8CString".}
proc objectMakeTypedArray*(context: JavaScriptContextRef;
                           arrayType: JavaScriptTypedArrayType; length: csize_t;
                           exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.
    cdecl, importc: "JSObjectMakeTypedArray".}
proc objectMakeTypedArrayWithBytesNoCopy*(context: JavaScriptContextRef;
    arrayType: JavaScriptTypedArrayType; bytes: pointer; byteLength: csize_t;
    bytesDeallocator: JavaScriptTypedArrayBytesDeallocator;
    deallocatorContext: pointer; exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.
    cdecl, importc: "JSObjectMakeTypedArrayWithBytesNoCopy".}
proc objectMakeTypedArrayWithArrayBuffer*(context: JavaScriptContextRef;
    arrayType: JavaScriptTypedArrayType; buffer: JavaScriptObjectRef;
    exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.cdecl,
    importc: "JSObjectMakeTypedArrayWithArrayBuffer".}
proc objectMakeTypedArrayWithArrayBufferAndOffset*(
    context: JavaScriptContextRef; arrayType: JavaScriptTypedArrayType;
    buffer: JavaScriptObjectRef; byteOffset: csize_t; length: csize_t;
    exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.cdecl,
    importc: "JSObjectMakeTypedArrayWithArrayBufferAndOffset".}
proc objectGetTypedArrayBytesPtr*(context: JavaScriptContextRef;
                                  object_arg: JavaScriptObjectRef;
                                  exception: ptr JavaScriptValueRef): pointer {.
    cdecl, importc: "JSObjectGetTypedArrayBytesPtr".}
proc objectGetTypedArrayLength*(context: JavaScriptContextRef;
                                object_arg: JavaScriptObjectRef;
                                exception: ptr JavaScriptValueRef): csize_t {.
    cdecl, importc: "JSObjectGetTypedArrayLength".}
proc objectGetTypedArrayByteLength*(context: JavaScriptContextRef;
                                    object_arg: JavaScriptObjectRef;
                                    exception: ptr JavaScriptValueRef): csize_t {.
    cdecl, importc: "JSObjectGetTypedArrayByteLength".}
proc objectGetTypedArrayByteOffset*(context: JavaScriptContextRef;
                                    object_arg: JavaScriptObjectRef;
                                    exception: ptr JavaScriptValueRef): csize_t {.
    cdecl, importc: "JSObjectGetTypedArrayByteOffset".}
proc objectGetTypedArrayBuffer*(context: JavaScriptContextRef;
                                object_arg: JavaScriptObjectRef;
                                exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.
    cdecl, importc: "JSObjectGetTypedArrayBuffer".}
proc objectMakeArrayBufferWithBytesNoCopy*(context: JavaScriptContextRef;
    bytes: pointer; byteLength: csize_t;
    bytesDeallocator: JavaScriptTypedArrayBytesDeallocator;
    deallocatorContext: pointer; exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.
    cdecl, importc: "JSObjectMakeArrayBufferWithBytesNoCopy".}
proc objectGetArrayBufferBytesPtr*(context: JavaScriptContextRef;
                                   object_arg: JavaScriptObjectRef;
                                   exception: ptr JavaScriptValueRef): pointer {.
    cdecl, importc: "JSObjectGetArrayBufferBytesPtr".}
proc objectGetArrayBufferByteLength*(context: JavaScriptContextRef;
                                     object_arg: JavaScriptObjectRef;
                                     exception: ptr JavaScriptValueRef): csize_t {.
    cdecl, importc: "JSObjectGetArrayBufferByteLength".}
proc versionString*(): cstring {.ultralightImport, importc: "ulVersionString".}
proc versionMajor*(): cuint {.ultralightImport, importc: "ulVersionMajor".}
proc versionMinor*(): cuint {.ultralightImport, importc: "ulVersionMinor".}
proc versionPatch*(): cuint {.ultralightImport, importc: "ulVersionPatch".}
proc webKitVersionString*(): cstring {.cdecl, importc: "ulWebKitVersionString".}
proc newUltralightEmptyBitmap*(): UltralightBitmap {.ultralightImport,
    importc: "ulCreateEmptyBitmap".}
proc newUltralightBitmap*(width: cuint; height: cuint;
                          format: UltralightBitmapFormat): UltralightBitmap {.
    ultralightImport, importc: "ulCreateBitmap".}
proc newUltralightBitmapFromPixels*(width: cuint; height: cuint;
                                    format: UltralightBitmapFormat;
                                    rowBytes: cuint; pixels: pointer;
                                    size: csize_t; shouldCopy: bool): UltralightBitmap {.
    ultralightImport, importc: "ulCreateBitmapFromPixels".}
proc newUltralightBitmapFromCopy*(existingBitmap: UltralightBitmap): UltralightBitmap {.
    ultralightImport, importc: "ulCreateBitmapFromCopy".}
proc destroy*(bitmap: UltralightBitmap): void {.ultralightImport,
    importc: "ulDestroyBitmap".}
proc width*(bitmap: UltralightBitmap): cuint {.ultralightImport,
    importc: "ulBitmapGetWidth".}
proc height*(bitmap: UltralightBitmap): cuint {.ultralightImport,
    importc: "ulBitmapGetHeight".}
proc format*(bitmap: UltralightBitmap): UltralightBitmapFormat {.ultralightImport,
    importc: "ulBitmapGetFormat".}
proc bpp*(bitmap: UltralightBitmap): cuint {.ultralightImport, importc: "ulBitmapGetBpp".}
proc rowBytes*(bitmap: UltralightBitmap): cuint {.ultralightImport,
    importc: "ulBitmapGetRowBytes".}
proc size*(bitmap: UltralightBitmap): csize_t {.ultralightImport,
    importc: "ulBitmapGetSize".}
proc ownsPixels*(bitmap: UltralightBitmap): bool {.ultralightImport,
    importc: "ulBitmapOwnsPixels".}
proc lockPixels*(bitmap: UltralightBitmap): pointer {.ultralightImport,
    importc: "ulBitmapLockPixels".}
proc unlockPixels*(bitmap: UltralightBitmap): void {.ultralightImport,
    importc: "ulBitmapUnlockPixels".}
proc rawPixels*(bitmap: UltralightBitmap): pointer {.ultralightImport,
    importc: "ulBitmapRawPixels".}
proc empty*(bitmap: UltralightBitmap): bool {.ultralightImport, importc: "ulBitmapIsEmpty".}
proc erase*(bitmap: UltralightBitmap): void {.ultralightImport, importc: "ulBitmapErase".}
proc writePNG*(bitmap: UltralightBitmap; path: cstring): bool {.ultralightImport,
    importc: "ulBitmapWritePNG".}
proc swapRedBlueChannels*(bitmap: UltralightBitmap): void {.ultralightImport,
    importc: "ulBitmapSwapRedBlueChannels".}
proc newUltralightBuffer*(data: pointer; size: csize_t; userData: pointer;
                          destructionCallback: ulDestroyBUfferCallback): UltralightBuffer {.
    ultralightImport, importc: "ulCreateBuffer".}
proc newUltralightBufferFromCopy*(data: pointer; size: csize_t): UltralightBuffer {.
    ultralightImport, importc: "ulCreateBufferFromCopy".}
proc destroy*(buffer: UltralightBuffer): void {.ultralightImport,
    importc: "ulDestroyBuffer".}
proc bufferGetData*(buffer: UltralightBuffer): pointer {.ultralightImport,
    importc: "ulBufferGetData".}
proc bufferGetSize*(buffer: UltralightBuffer): csize_t {.ultralightImport,
    importc: "ulBufferGetSize".}
proc bufferGetUserData*(buffer: UltralightBuffer): pointer {.ultralightImport,
    importc: "ulBufferGetUserData".}
proc bufferOwnsData*(buffer: UltralightBuffer): bool {.ultralightImport,
    importc: "ulBufferOwnsData".}
proc newUltralightConfig*(): UltralightConfig {.ultralightImport, importc: "ulCreateConfig".}
proc destroy*(config: UltralightConfig): void {.ultralightImport,
    importc: "ulDestroyConfig".}
proc `cachePath=`*(config: UltralightConfig; cachePath: UltralightString): void {.
    ultralightImport, importc: "ulConfigSetCachePath".}
proc `resourcePathPrefix=`*(config: UltralightConfig;
                            resourcePathPrefix: UltralightString): void {.ultralightImport,
    importc: "ulConfigSetResourcePathPrefix".}
proc `faceWinding=`*(config: UltralightConfig; winding: UltralightFaceWinding): void {.
    ultralightImport, importc: "ulConfigSetFaceWinding".}
proc `fontHinting=`*(config: UltralightConfig;
                     fontHinting: UltralightFontHinting): void {.ultralightImport,
    importc: "ulConfigSetFontHinting".}
proc `fontGamma=`*(config: UltralightConfig; fontGamma: cdouble): void {.ultralightImport,
    importc: "ulConfigSetFontGamma".}
proc `userStylesheet=`*(config: UltralightConfig; cssString: UltralightString): void {.
    ultralightImport, importc: "ulConfigSetUserStylesheet".}
proc `forceRepaint=`*(config: UltralightConfig; enabled: bool): void {.ultralightImport,
    importc: "ulConfigSetForceRepaint".}
proc `animationTimerDelay=`*(config: UltralightConfig; delay: cdouble): void {.
    ultralightImport, importc: "ulConfigSetAnimationTimerDelay".}
proc `scrollTimerDelay=`*(config: UltralightConfig; delay: cdouble): void {.
    ultralightImport, importc: "ulConfigSetScrollTimerDelay".}
proc `recycleDelay=`*(config: UltralightConfig; delay: cdouble): void {.ultralightImport,
    importc: "ulConfigSetRecycleDelay".}
proc `memoryCacheSize=`*(config: UltralightConfig; size: cuint): void {.ultralightImport,
    importc: "ulConfigSetMemoryCacheSize".}
proc `pageCacheSize=`*(config: UltralightConfig; size: cuint): void {.ultralightImport,
    importc: "ulConfigSetPageCacheSize".}
proc `overrideRAMSize=`*(config: UltralightConfig; size: cuint): void {.ultralightImport,
    importc: "ulConfigSetOverrideRAMSize".}
proc `minLargeHeapSize=`*(config: UltralightConfig; size: cuint): void {.ultralightImport,
    importc: "ulConfigSetMinLargeHeapSize".}
proc `minSmallHeapSize=`*(config: UltralightConfig; size: cuint): void {.ultralightImport,
    importc: "ulConfigSetMinSmallHeapSize".}
proc `numRendererThreads=`*(config: UltralightConfig; numRendererThreads: cuint): void {.
    ultralightImport, importc: "ulConfigSetNumRendererThreads".}
proc `maxUpdateTime=`*(config: UltralightConfig; maxUpdateTime: cdouble): void {.
    ultralightImport, importc: "ulConfigSetMaxUpdateTime".}
proc `bitmapAlignment=`*(config: UltralightConfig; bitmapAlignment: cuint): void {.
    ultralightImport, importc: "ulConfigSetBitmapAlignment".}
proc newUltralightString*(str: cstring): UltralightString {.ultralightImport,
    importc: "ulCreateString".}
proc newUltralightStringUTF8*(str: cstring; len: csize_t): UltralightString {.
    ultralightImport, importc: "ulCreateStringUTF8".}
proc newUltralightStringUTF16*(str: ptr UltralightChar16; len: csize_t): UltralightString {.
    ultralightImport, importc: "ulCreateStringUTF16".}
proc newUltralightStringFromCopy*(str: UltralightString): UltralightString {.
    ultralightImport, importc: "ulCreateStringFromCopy".}
proc destroy*(str: UltralightString): void {.ultralightImport, importc: "ulDestroyString".}
proc data*(str: UltralightString): cstring {.ultralightImport, importc: "ulStringGetData".}
proc length*(str: UltralightString): csize_t {.ultralightImport,
    importc: "ulStringGetLength".}
proc empty*(str: UltralightString): bool {.ultralightImport, importc: "ulStringIsEmpty".}
proc assignString*(str: UltralightString; newStr: UltralightString): void {.
    ultralightImport, importc: "ulStringAssignString".}
proc assignCString*(str: UltralightString; cStr: cstring): void {.ultralightImport,
    importc: "ulStringAssignCString".}
proc newUltralightFontFileFromFilePath*(filePath: UltralightString): UltralightFontFile {.
    ultralightImport, importc: "ulFontFileCreateFromFilePath".}
proc newUltralightFontFileFromBuffer*(buffer: UltralightBuffer): UltralightFontFile {.
    ultralightImport, importc: "ulFontFileCreateFromBuffer".}
proc destroy*(fontFile: UltralightFontFile): void {.ultralightImport,
    importc: "ulDestroyFontFile".}
proc rectIsEmpty*(rect: UltralightRect): bool {.ultralightImport, importc: "ulRectIsEmpty".}
proc rectMakeEmpty*(): UltralightRect {.ultralightImport, importc: "ulRectMakeEmpty".}
proc intRectIsEmpty*(rect: UltralightIntRect): bool {.ultralightImport,
    importc: "ulIntRectIsEmpty".}
proc intRectMakeEmpty*(): UltralightIntRect {.ultralightImport,
    importc: "ulIntRectMakeEmpty".}
proc applyProjection*(transform: UltralightMatrix4x4; viewportWidth: cfloat;
                      viewportHeight: cfloat; flipY: bool): UltralightMatrix4x4 {.
    ultralightImport, importc: "ulApplyProjection".}
proc newUltralightKeyEvent*(type_arg: UltralightKeyEventType; modifiers: cuint;
                            virtualKeyCode: cint; nativeKeyCode: cint;
                            text: UltralightString;
                            unmodifiedText: UltralightString; isKeypad: bool;
                            isAutoRepeat: bool; isSystemKey: bool): UltralightKeyEvent {.
    ultralightImport, importc: "ulCreateKeyEvent".}
proc newUltralightKeyEventWindows*(type_arg: UltralightKeyEventType;
                                   wparam: uintptrT; lparam: intptrT;
                                   isSystemKey: bool): UltralightKeyEvent {.
    ultralightImport, importc: "ulCreateKeyEventWindows".}
proc destroy*(evt: UltralightKeyEvent): void {.ultralightImport,
    importc: "ulDestroyKeyEvent".}
proc newUltralightMouseEvent*(type_arg: UltralightMouseEventType; x: cint;
                              y: cint; button: UltralightMouseButton): UltralightMouseEvent {.
    ultralightImport, importc: "ulCreateMouseEvent".}
proc destroy*(evt: UltralightMouseEvent): void {.ultralightImport,
    importc: "ulDestroyMouseEvent".}
proc width*(surface: UltralightSurface): cuint {.ultralightImport,
    importc: "ulSurfaceGetWidth".}
proc height*(surface: UltralightSurface): cuint {.ultralightImport,
    importc: "ulSurfaceGetHeight".}
proc rowBytes*(surface: UltralightSurface): cuint {.ultralightImport,
    importc: "ulSurfaceGetRowBytes".}
proc size*(surface: UltralightSurface): csize_t {.ultralightImport,
    importc: "ulSurfaceGetSize".}
proc lockPixels*(surface: UltralightSurface): pointer {.ultralightImport,
    importc: "ulSurfaceLockPixels".}
proc unlockPixels*(surface: UltralightSurface): void {.ultralightImport,
    importc: "ulSurfaceUnlockPixels".}
proc resize*(surface: UltralightSurface; width: cuint; height: cuint): void {.
    ultralightImport, importc: "ulSurfaceResize".}
proc `dirtyBounds=`*(surface: UltralightSurface; bounds: UltralightIntRect): void {.
    ultralightImport, importc: "ulSurfaceSetDirtyBounds".}
proc dirtyBounds*(surface: UltralightSurface): UltralightIntRect {.ultralightImport,
    importc: "ulSurfaceGetDirtyBounds".}
proc clearDirtyBounds*(surface: UltralightSurface): void {.ultralightImport,
    importc: "ulSurfaceClearDirtyBounds".}
proc userData*(surface: UltralightSurface): pointer {.ultralightImport,
    importc: "ulSurfaceGetUserData".}
proc bitmap*(surface: UltralightBitmapSurface): UltralightBitmap {.ultralightImport,
    importc: "ulBitmapSurfaceGetBitmap".}
proc `platformLogger=`*(logger: UltralightLogger): void {.ultralightImport,
    importc: "ulPlatformSetLogger".}
proc `platformFileSystem=`*(fileSystem: UltralightFileSystem): void {.ultralightImport,
    importc: "ulPlatformSetFileSystem".}
proc `platformFontLoader=`*(fontLoader: UltralightFontLoader): void {.ultralightImport,
    importc: "ulPlatformSetFontLoader".}
proc `platformSurfaceDefinition=`*(surfaceDefinition: UltralightSurfaceDefinition): void {.
    ultralightImport, importc: "ulPlatformSetSurfaceDefinition".}
proc `platformGPUDriver=`*(gpuDriver: UltralightGPUDriver): void {.ultralightImport,
    importc: "ulPlatformSetGPUDriver".}
proc `platformClipboard=`*(clipboard: UltralightClipboard): void {.ultralightImport,
    importc: "ulPlatformSetClipboard".}
proc newUltralightRenderer*(config: UltralightConfig): UltralightRenderer {.
    ultralightImport, importc: "ulCreateRenderer".}
proc destroy*(renderer: UltralightRenderer): void {.ultralightImport,
    importc: "ulDestroyRenderer".}
proc update*(renderer: UltralightRenderer): void {.ultralightImport, importc: "ulUpdate".}
proc refreshDisplay*(renderer: UltralightRenderer; displayId: cuint): void {.
    ultralightImport, importc: "ulRefreshDisplay".}
proc render*(renderer: UltralightRenderer): void {.ultralightImport, importc: "ulRender".}
proc purgeMemory*(renderer: UltralightRenderer): void {.ultralightImport,
    importc: "ulPurgeMemory".}
proc logMemoryUsage*(renderer: UltralightRenderer): void {.ultralightImport,
    importc: "ulLogMemoryUsage".}
proc startRemoteInspectorServer*(renderer: UltralightRenderer; address: cstring;
                                 port: cushort): bool {.ultralightImport,
    importc: "ulStartRemoteInspectorServer".}
proc `gamepadDetails=`*(renderer: UltralightRenderer; index: cuint;
                        id: UltralightString; axisCount: cuint;
                        buttonCount: cuint): void {.ultralightImport,
    importc: "ulSetGamepadDetails".}
proc fire*(renderer: UltralightRenderer; evt: UltralightGamepadEvent): void {.
    ultralightImport, importc: "ulFireGamepadEvent".}
proc fire*(renderer: UltralightRenderer; evt: UltralightGamepadAxisEvent): void {.
    ultralightImport, importc: "ulFireGamepadAxisEvent".}
proc fire*(renderer: UltralightRenderer; evt: UltralightGamepadButtonEvent): void {.
    ultralightImport, importc: "ulFireGamepadButtonEvent".}
proc newUltralightScrollEvent*(type_arg: UltralightScrollEventType;
                               deltaX: cint; deltaY: cint): UltralightScrollEvent {.
    ultralightImport, importc: "ulCreateScrollEvent".}
proc destroy*(evt: UltralightScrollEvent): void {.ultralightImport,
    importc: "ulDestroyScrollEvent".}
proc newUltralightGamepadEvent*(index: cuint;
                                type_arg: UltralightGamepadEventType): UltralightGamepadEvent {.
    ultralightImport, importc: "ulCreateGamepadEvent".}
proc destroy*(evt: UltralightGamepadEvent): void {.ultralightImport,
    importc: "ulDestroyGamepadEvent".}
proc newUltralightGamepadAxisEvent*(index: cuint; axisIndex: cuint;
                                    value: cdouble): UltralightGamepadAxisEvent {.
    ultralightImport, importc: "ulCreateGamepadAxisEvent".}
proc destroy*(evt: UltralightGamepadAxisEvent): void {.ultralightImport,
    importc: "ulDestroyGamepadAxisEvent".}
proc newUltralightGamepadButtonEvent*(index: cuint; buttonIndex: cuint;
                                      value: cdouble): UltralightGamepadButtonEvent {.
    ultralightImport, importc: "ulCreateGamepadButtonEvent".}
proc destroy*(evt: UltralightGamepadButtonEvent): void {.ultralightImport,
    importc: "ulDestroyGamepadButtonEvent".}
proc newUltralightSession*(renderer: UltralightRenderer; isPersistent: bool;
                           name: UltralightString): UltralightSession {.ultralightImport,
    importc: "ulCreateSession".}
proc destroy*(session: UltralightSession): void {.ultralightImport,
    importc: "ulDestroySession".}
proc defaultSession*(renderer: UltralightRenderer): UltralightSession {.ultralightImport,
    importc: "ulDefaultSession".}
proc persistent*(session: UltralightSession): bool {.ultralightImport,
    importc: "ulSessionIsPersistent".}
proc name*(session: UltralightSession): UltralightString {.ultralightImport,
    importc: "ulSessionGetName".}
proc id*(session: UltralightSession): culonglong {.ultralightImport,
    importc: "ulSessionGetId".}
proc diskPath*(session: UltralightSession): UltralightString {.ultralightImport,
    importc: "ulSessionGetDiskPath".}
proc newUltralightViewConfig*(): UltralightViewConfig {.ultralightImport,
    importc: "ulCreateViewConfig".}
proc destroy*(config: UltralightViewConfig): void {.ultralightImport,
    importc: "ulDestroyViewConfig".}
proc `displayId=`*(config: UltralightViewConfig; displayId: cuint): void {.
    ultralightImport, importc: "ulViewConfigSetDisplayId".}
proc `accelerated=`*(config: UltralightViewConfig; isAccelerated: bool): void {.
    ultralightImport, importc: "ulViewConfigSetIsAccelerated".}
proc `transparent=`*(config: UltralightViewConfig; isTransparent: bool): void {.
    ultralightImport, importc: "ulViewConfigSetIsTransparent".}
proc `initialDeviceScale=`*(config: UltralightViewConfig;
                            initialDeviceScale: cdouble): void {.ultralightImport,
    importc: "ulViewConfigSetInitialDeviceScale".}
proc `initialFocus=`*(config: UltralightViewConfig; isFocused: bool): void {.
    ultralightImport, importc: "ulViewConfigSetInitialFocus".}
proc `enableImages=`*(config: UltralightViewConfig; enabled: bool): void {.
    ultralightImport, importc: "ulViewConfigSetEnableImages".}
proc `enableJavaScript=`*(config: UltralightViewConfig; enabled: bool): void {.
    ultralightImport, importc: "ulViewConfigSetEnableJavaScript".}
proc `fontFamilyStandard=`*(config: UltralightViewConfig;
                            fontName: UltralightString): void {.ultralightImport,
    importc: "ulViewConfigSetFontFamilyStandard".}
proc `fontFamilyFixed=`*(config: UltralightViewConfig;
                         fontName: UltralightString): void {.ultralightImport,
    importc: "ulViewConfigSetFontFamilyFixed".}
proc `fontFamilySerif=`*(config: UltralightViewConfig;
                         fontName: UltralightString): void {.ultralightImport,
    importc: "ulViewConfigSetFontFamilySerif".}
proc `fontFamilySansSerif=`*(config: UltralightViewConfig;
                             fontName: UltralightString): void {.ultralightImport,
    importc: "ulViewConfigSetFontFamilySansSerif".}
proc `userAgent=`*(config: UltralightViewConfig; agentString: UltralightString): void {.
    ultralightImport, importc: "ulViewConfigSetUserAgent".}
proc newUltralightView*(renderer: UltralightRenderer; width: cuint;
                        height: cuint; viewConfig: UltralightViewConfig;
                        session: UltralightSession): UltralightView {.ultralightImport,
    importc: "ulCreateView".}
proc destroy*(view: UltralightView): void {.ultralightImport, importc: "ulDestroyView".}
proc URL*(view: UltralightView): UltralightString {.ultralightImport,
    importc: "ulViewGetURL".}
proc title*(view: UltralightView): UltralightString {.ultralightImport,
    importc: "ulViewGetTitle".}
proc width*(view: UltralightView): cuint {.ultralightImport, importc: "ulViewGetWidth".}
proc height*(view: UltralightView): cuint {.ultralightImport, importc: "ulViewGetHeight".}
proc displayId*(view: UltralightView): cuint {.ultralightImport,
    importc: "ulViewGetDisplayId".}
proc `displayId=`*(view: UltralightView; displayId: cuint): void {.ultralightImport,
    importc: "ulViewSetDisplayId".}
proc deviceScale*(view: UltralightView): cdouble {.ultralightImport,
    importc: "ulViewGetDeviceScale".}
proc `deviceScale=`*(view: UltralightView; scale: cdouble): void {.ultralightImport,
    importc: "ulViewSetDeviceScale".}
proc accelerated*(view: UltralightView): bool {.ultralightImport,
    importc: "ulViewIsAccelerated".}
proc transparent*(view: UltralightView): bool {.ultralightImport,
    importc: "ulViewIsTransparent".}
proc loading*(view: UltralightView): bool {.ultralightImport, importc: "ulViewIsLoading".}
proc renderTarget*(view: UltralightView): UltralightRenderTarget {.ultralightImport,
    importc: "ulViewGetRenderTarget".}
proc surface*(view: UltralightView): UltralightSurface {.ultralightImport,
    importc: "ulViewGetSurface".}
proc loadHTML*(view: UltralightView; htmlString: UltralightString): void {.
    ultralightImport, importc: "ulViewLoadHTML".}
proc loadURL*(view: UltralightView; urlString: UltralightString): void {.ultralightImport,
    importc: "ulViewLoadURL".}
proc resize*(view: UltralightView; width: cuint; height: cuint): void {.ultralightImport,
    importc: "ulViewResize".}
proc lockJavaScriptContext*(view: UltralightView): JavaScriptContextRef {.ultralightImport,
    importc: "ulViewLockJSContext".}
proc unlockJavaScriptContext*(view: UltralightView): void {.ultralightImport,
    importc: "ulViewUnlockJSContext".}
proc evaluateScript*(view: UltralightView; jsString: UltralightString;
                     exception: ptr UltralightString): UltralightString {.ultralightImport,
    importc: "ulViewEvaluateScript".}
proc canGoBack*(view: UltralightView): bool {.ultralightImport, importc: "ulViewCanGoBack".}
proc canGoForward*(view: UltralightView): bool {.ultralightImport,
    importc: "ulViewCanGoForward".}
proc goBack*(view: UltralightView): void {.ultralightImport, importc: "ulViewGoBack".}
proc goForward*(view: UltralightView): void {.ultralightImport, importc: "ulViewGoForward".}
proc goToHistoryOffset*(view: UltralightView; offset: cint): void {.ultralightImport,
    importc: "ulViewGoToHistoryOffset".}
proc reload*(view: UltralightView): void {.ultralightImport, importc: "ulViewReload".}
proc stop*(view: UltralightView): void {.ultralightImport, importc: "ulViewStop".}
proc focus*(view: UltralightView): void {.ultralightImport, importc: "ulViewFocus".}
proc unfocus*(view: UltralightView): void {.ultralightImport, importc: "ulViewUnfocus".}
proc focused*(view: UltralightView): bool {.ultralightImport, importc: "ulViewHasFocus".}
proc inputFocused*(view: UltralightView): bool {.ultralightImport,
    importc: "ulViewHasInputFocus".}
proc fire*(view: UltralightView; keyEvent: UltralightKeyEvent): void {.ultralightImport,
    importc: "ulViewFireKeyEvent".}
proc fire*(view: UltralightView; mouseEvent: UltralightMouseEvent): void {.
    ultralightImport, importc: "ulViewFireMouseEvent".}
proc fire*(view: UltralightView; scrollEvent: UltralightScrollEvent): void {.
    ultralightImport, importc: "ulViewFireScrollEvent".}
proc setChangeTitleCallback*(view: UltralightView;
                             callback: UltralightChangeTitleCallback;
                             userData: pointer): void {.ultralightImport,
    importc: "ulViewSetChangeTitleCallback".}
proc setChangeURLCallback*(view: UltralightView;
                           callback: UltralightChangeURLCallback;
                           userData: pointer): void {.ultralightImport,
    importc: "ulViewSetChangeURLCallback".}
proc setChangeTooltipCallback*(view: UltralightView;
                               callback: UltralightChangeTooltipCallback;
                               userData: pointer): void {.ultralightImport,
    importc: "ulViewSetChangeTooltipCallback".}
proc setChangeCursorCallback*(view: UltralightView;
                              callback: UltralightChangeCursorCallback;
                              userData: pointer): void {.ultralightImport,
    importc: "ulViewSetChangeCursorCallback".}
proc setAddConsoleMessageCallback*(view: UltralightView; callback: UltralightAddConsoleMessageCallback;
                                   userData: pointer): void {.ultralightImport,
    importc: "ulViewSetAddConsoleMessageCallback".}
proc setCreateChildViewCallback*(view: UltralightView;
                                 callback: UltralightCreateChildViewCallback;
                                 userData: pointer): void {.ultralightImport,
    importc: "ulViewSetCreateChildViewCallback".}
proc setCreateInspectorViewCallback*(view: UltralightView; callback: UltralightCreateInspectorViewCallback;
                                     userData: pointer): void {.ultralightImport,
    importc: "ulViewSetCreateInspectorViewCallback".}
proc setBeginLoadingCallback*(view: UltralightView;
                              callback: UltralightBeginLoadingCallback;
                              userData: pointer): void {.ultralightImport,
    importc: "ulViewSetBeginLoadingCallback".}
proc setFinishLoadingCallback*(view: UltralightView;
                               callback: UltralightFinishLoadingCallback;
                               userData: pointer): void {.ultralightImport,
    importc: "ulViewSetFinishLoadingCallback".}
proc setFailLoadingCallback*(view: UltralightView;
                             callback: UltralightFailLoadingCallback;
                             userData: pointer): void {.ultralightImport,
    importc: "ulViewSetFailLoadingCallback".}
proc setWindowObjectReadyCallback*(view: UltralightView; callback: UltralightWindowObjectReadyCallback;
                                   userData: pointer): void {.ultralightImport,
    importc: "ulViewSetWindowObjectReadyCallback".}
proc setDOMReadyCallback*(view: UltralightView;
                          callback: UltralightDOMReadyCallback;
                          userData: pointer): void {.ultralightImport,
    importc: "ulViewSetDOMReadyCallback".}
proc setUpdateHistoryCallback*(view: UltralightView;
                               callback: UltralightUpdateHistoryCallback;
                               userData: pointer): void {.ultralightImport,
    importc: "ulViewSetUpdateHistoryCallback".}
proc `needsPaint=`*(view: UltralightView; needsPaint: bool): void {.ultralightImport,
    importc: "ulViewSetNeedsPaint".}
proc needsPaint*(view: UltralightView): bool {.ultralightImport,
    importc: "ulViewGetNeedsPaint".}
proc newUltralightLocalInspectorView*(view: UltralightView): void {.ultralightImport,
    importc: "ulViewCreateLocalInspectorView".}
proc newUltralightSettings*(): UltralightSettings {.ultralightImport,
    importc: "ulCreateSettings".}
proc destroy*(settings: UltralightSettings): void {.ultralightImport,
    importc: "ulDestroySettings".}
proc `developerName=`*(settings: UltralightSettings; name: UltralightString): void {.
    ultralightImport, importc: "ulSettingsSetDeveloperName".}
proc `appName=`*(settings: UltralightSettings; name: UltralightString): void {.
    cdecl, importc: "ulSettingsSetAppName".}
proc `fileSystemPath=`*(settings: UltralightSettings; path: UltralightString): void {.
    cdecl, importc: "ulSettingsSetFileSystemPath".}
proc `loadShadersFromFileSystem=`*(settings: UltralightSettings; enabled: bool): void {.
    cdecl, importc: "ulSettingsSetLoadShadersFromFileSystem".}
proc `forceCPURenderer=`*(settings: UltralightSettings; forceCpu: bool): void {.
    cdecl, importc: "ulSettingsSetForceCPURenderer".}

proc newUltralightApp*(settings: UltralightSettings; config: UltralightConfig): UltralightApp {.appCoreImport, importc: "ulCreateApp".}
proc destroy*(app: UltralightApp): void {.appCoreImport, importc: "ulDestroyApp".}
proc setUpdateCallback*(app: UltralightApp; callback: UltralightUpdateCallback; userData: pointer): void {.appCoreImport, importc: "ulAppSetUpdateCallback".}
proc running*(app: UltralightApp): bool {.appCoreImport, importc: "ulAppIsRunning".}
proc mainMonitor*(app: UltralightApp): UltralightMonitor {.appCoreImport, importc: "ulAppGetMainMonitor".}
proc renderer*(app: UltralightApp): UltralightRenderer {.appCoreImport, importc: "ulAppGetRenderer".}
proc run*(app: UltralightApp): void {.appCoreImport, importc: "ulAppRun".}
proc quit*(app: UltralightApp): void {.appCoreImport, importc: "ulAppQuit".}

proc scale*(monitor: UltralightMonitor): cdouble {.appCoreImport, importc: "ulMonitorGetScale".}
proc width*(monitor: UltralightMonitor): cuint {.appCoreImport, importc: "ulMonitorGetWidth".}
proc height*(monitor: UltralightMonitor): cuint {.appCoreImport, importc: "ulMonitorGetHeight".}

proc newUltralightWindow*(monitor: UltralightMonitor; width: cuint; height: cuint; fullscreen: bool; windowFlags: cuint): UltralightWindow {.appCoreImport, importc: "ulCreateWindow".}
proc destroy*(window: UltralightWindow): void {.appCoreImport, importc: "ulDestroyWindow".}
proc setCloseCallback*(window: UltralightWindow; callback: UltralightCloseCallback; userData: pointer): void {.appCoreImport, importc: "ulWindowSetCloseCallback".}
proc setResizeCallback*(window: UltralightWindow; callback: UltralightResizeCallback; userData: pointer): void {.appCoreImport, importc: "ulWindowSetResizeCallback".}
proc screenWidth*(window: UltralightWindow): cuint {.appCoreImport, importc: "ulWindowGetScreenWidth".}
proc width*(window: UltralightWindow): cuint {.appCoreImport, importc: "ulWindowGetWidth".}
proc screenHeight*(window: UltralightWindow): cuint {.appCoreImport, importc: "ulWindowGetScreenHeight".}
proc height*(window: UltralightWindow): cuint {.appCoreImport, importc: "ulWindowGetHeight".}
proc moveTo*(window: UltralightWindow; x: cint; y: cint): void {.appCoreImport, importc: "ulWindowMoveTo".}
proc moveToCenter*(a0: UltralightWindow): void {.appCoreImport, importc: "ulWindowMoveToCenter".}
proc positionX*(window: UltralightWindow): cint {.appCoreImport, importc: "ulWindowGetPositionX".}
proc positionY*(window: UltralightWindow): cint {.appCoreImport, importc: "ulWindowGetPositionY".}
proc fullscreen*(window: UltralightWindow): bool {.appCoreImport, importc: "ulWindowIsFullscreen".}
proc scale*(window: UltralightWindow): cdouble {.appCoreImport, importc: "ulWindowGetScale".}
proc `title=`*(window: UltralightWindow; title: cstring): void {.appCoreImport, importc: "ulWindowSetTitle".}
proc `cursor=`*(window: UltralightWindow; cursor: UltralightCursor): void {.appCoreImport, importc: "ulWindowSetCursor".}
proc show*(window: UltralightWindow): void {.appCoreImport, importc: "ulWindowShow".}
proc hide*(window: UltralightWindow): void {.appCoreImport, importc: "ulWindowHide".}
proc visible*(window: UltralightWindow): bool {.appCoreImport, importc: "ulWindowIsVisible".}
proc close*(window: UltralightWindow): void {.appCoreImport, importc: "ulWindowClose".}
proc screenToPixels*(window: UltralightWindow; val: cint): cint {.appCoreImport, importc: "ulWindowScreenToPixels".}
proc pixelsToScreen*(window: UltralightWindow; val: cint): cint {.appCoreImport, importc: "ulWindowPixelsToScreen".}
proc nativeHandle*(window: UltralightWindow): pointer {.appCoreImport, importc: "ulWindowGetNativeHandle".}

proc newUltralightOverlay*(window: UltralightWindow; width: cuint; height: cuint; x: cint; y: cint): UltralightOverlay {.appCoreImport, importc: "ulCreateOverlay".}
proc newUltralightOverlayWithView*(window: UltralightWindow; view: UltralightView; x: cint; y: cint): UltralightOverlay {.appCoreImport, importc: "ulCreateOverlayWithView".}
proc destroy*(overlay: UltralightOverlay): void {.appCoreImport, importc: "ulDestroyOverlay".}
proc view*(overlay: UltralightOverlay): UltralightView {.appCoreImport, importc: "ulOverlayGetView".}
proc width*(overlay: UltralightOverlay): cuint {.appCoreImport, importc: "ulOverlayGetWidth".}
proc height*(overlay: UltralightOverlay): cuint {.appCoreImport, importc: "ulOverlayGetHeight".}
proc x*(overlay: UltralightOverlay): cint {.appCoreImport, importc: "ulOverlayGetX".}
proc y*(overlay: UltralightOverlay): cint {.appCoreImport, importc: "ulOverlayGetY".}
proc moveTo*(overlay: UltralightOverlay; x: cint; y: cint): void {.appCoreImport, importc: "ulOverlayMoveTo".}
proc resize*(overlay: UltralightOverlay; width: cuint; height: cuint): void {.appCoreImport, importc: "ulOverlayResize".}
proc hidden*(overlay: UltralightOverlay): bool {.appCoreImport, importc: "ulOverlayIsHidden".}
proc hide*(overlay: UltralightOverlay): void {.appCoreImport, importc: "ulOverlayHide".}
proc show*(overlay: UltralightOverlay): void {.appCoreImport, importc: "ulOverlayShow".}
proc focused*(overlay: UltralightOverlay): bool {.appCoreImport, importc: "ulOverlayHasFocus".}
proc focus*(overlay: UltralightOverlay): void {.appCoreImport, importc: "ulOverlayFocus".}
proc unfocus*(overlay: UltralightOverlay): void {.appCoreImport, importc: "ulOverlayUnfocus".}
proc enablePlatformFontLoader*(): void {.appCoreImport, importc: "ulEnablePlatformFontLoader".}
proc enablePlatformFileSystem*(baseDir: UltralightString): void {.appCoreImport, importc: "ulEnablePlatformFileSystem".}
proc enableDefaultLogger*(logPath: UltralightString): void {.appCoreImport, importc: "ulEnableDefaultLogger".}