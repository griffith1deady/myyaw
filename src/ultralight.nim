
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
  PropertyAttributeNone* = cuint(0)
  PropertyAttributeReadOnly* = cuint(2)
  PropertyAttributeDontEnum* = cuint(4)
  PropertyAttributeDontDelete* = cuint(8)
  ClassAttributeNone* = cint(0)
  ClassAttributeNoAutomaticPrototype* = cint(2)

type
  JavaScriptType* {.size: sizeof(cint).} = enum
    Undefined = 0, Null = 1, Boolean = 2, Number = 3,
    String = 4, Object = 5, Symbol = 6
  JavaScriptTypedArrayType* {.size: sizeof(cint).} = enum
    Int8Array = 0, Int16Array = 1,
    Int32Array = 2, Uint8Array = 3,
    Uint8ClampedArray = 4, Uint16Array = 5,
    Uint32Array = 6, Float32Array = 7,
    Float64Array = 8, ArrayBuffer = 9,
    None = 10, BigInt64Array = 11,
    BigUint64Array = 12
  UltralightMessageSourceEnum* {.size: sizeof(cint).} = enum
    XML = 0, RceJavaScript = 1, Network = 2,
    ConsoleAPI = 3, Storage = 4,
    AppCache = 5, Rendering = 6, CSS = 7,
    Security = 8, ContentBlocker = 9,
    Other = 10
  UltralightMessageLevel* {.size: sizeof(cint).} = enum
    Log = 1, Warning = 2, Error = 3,
    Debug = 4, Info = 5
  UltralightCursor* {.size: sizeof(cint).} = enum
    Pointer = 0, Cross = 1, Hand = 2, IBeam = 3,
    Wait = 4, Help = 5, EastResize = 6, NorthResize = 7,
    NorthEastResize = 8, NorthWestResize = 9,
    SouthResize = 10, SouthEastResize = 11,
    SouthWestResize = 12, WestResize = 13,
    NorthSouthResize = 14, EastWestResize = 15,
    NorthEastSouthWestResize = 16, NorthWestSouthEastResize = 17,
    ColumnResize = 18, RowResize = 19, MiddlePanning = 20,
    EastPanning = 21, NorthPanning = 22,
    NorthEastPanning = 23, NorthWestPanning = 24,
    SouthPanning = 25, SouthEastPanning = 26,
    SouthWestPanning = 27, WestPanning = 28, Move = 29,
    VerticalText = 30, Cell = 31, ContextMenu = 32,
    Alias = 33, Progress = 34, NoDrop = 35, Copy = 36,
    None = 37, NotAllowed = 38, ZoomIn = 39,
    ZoomOut = 40, Grab = 41, Grabbing = 42, Custom = 43
  UltralightBitmapFormat* {.size: sizeof(cint).} = enum
    A8UNORM = 0, BGRA8UNORMSRGB = 1
  UltralightKeyEventType* {.size: sizeof(cint).} = enum
    KeyDown = 0, KeyUp = 1, RawKeyDown = 2,
    Char = 3
  UltralightMouseEventType* {.size: sizeof(cint).} = enum
    Moved = 0, Down = 1,
    Up = 2
  UltralightMouseButton* {.size: sizeof(cint).} = enum
    None = 0, Left = 1, Middle = 2,
    Right = 3
  UltralightScrollEventType* {.size: sizeof(cint).} = enum
    ByPixel = 0, ByPage = 1
  UltralightGamepadEventType* {.size: sizeof(cint).} = enum
    Connected = 0, Disconnected = 1
  UltralightFaceWinding* {.size: sizeof(cint).} = enum
    Clockwise = 0, CounterClockwise = 1
  UltralightFontHinting* {.size: sizeof(cint).} = enum
    Smooth = 0, Normal = 1, Monochrome = 2
  UltralightVertexBufferFormat* {.size: sizeof(cint).} = enum
    Format2f4ub2f = 0, Format2f4ub2f2f28f = 1
  UltralightShaderType* {.size: sizeof(cint).} = enum
    Fill = 0, FillPath = 1
  UltralightCommandType* {.size: sizeof(cint).} = enum
    ClearRenderBuffer = 0, DrawGeometry = 1
  UltralightLogLevel* {.size: sizeof(cint).} = enum
    Error = 0, Warning = 1, Info = 2
  UltralightWindowFlags* {.size: sizeof(cint).} = enum
    Borderless = 1, Titled = 2, Resizable = 4,
    Maximizable = 8, Hidden = 16

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
  JavaScriptException* = ptr JavaScriptValueRef
  JavaScriptObjectRef* = ptr OpaqueJavaScriptValueStruct
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
  JavaScriptError* = object of CatchableError
    orig: JavaScriptException # Store the original exception
  JavaScriptReferenceError* = object of JavaScriptError
  JavaScriptRangeError* = object of JavaScriptError
  JavaScriptSyntaxError* = object of JavaScriptError
  JavaScriptTypeError* = object of JavaScriptError
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
  UltralightUpdateCallback* = proc (a0: pointer): void {.cdecl.}
  UltralightCloseCallback* = proc (a0: pointer; a1: UltralightWindow): void {.cdecl.}
  UltralightResizeCallback* = proc (a0: pointer; a1: UltralightWindow; a2: cuint; a3: cuint): void {.cdecl.}

proc evaluateScript*(context: JavaScriptContextRef; script: JavaScriptStringRef; thisObject: JavaScriptObjectRef; sourceURL: JavaScriptStringRef; startingLineNumber: cint; exception: ptr JavaScriptValueRef): JavaScriptValueRef {.webkitImport, importc: "JSEvaluateScript".}
proc checkScriptSyntax*(context: JavaScriptContextRef; script: JavaScriptStringRef; sourceURL: JavaScriptStringRef; startingLineNumber: cint; exception: ptr JavaScriptValueRef): bool {.webkitImport, importc: "JSCheckScriptSyntax".}
proc garbageCollect*(context: JavaScriptContextRef): void {.webkitImport, importc: "JSGarbageCollect".}
proc valueGetType*(context: JavaScriptContextRef; value: JavaScriptValueRef): JavaScriptType {.webkitImport, importc: "JSValueGetType".}
proc valueIsUndefined*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.webkitImport, importc: "JSValueIsUndefined".}
proc valueIsNull*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.webkitImport, importc: "JSValueIsNull".}
proc valueIsBoolean*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.webkitImport, importc: "JSValueIsBoolean".}
proc valueIsNumber*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.webkitImport, importc: "JSValueIsNumber".}
proc valueIsString*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.webkitImport, importc: "JSValueIsString".}
proc valueIsSymbol*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.webkitImport, importc: "JSValueIsSymbol".}
proc valueIsObject*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.webkitImport, importc: "JSValueIsObject".}
proc valueIsObjectOfClass*(context: JavaScriptContextRef; value: JavaScriptValueRef; jsClass: JavaScriptClassRef): bool {.webkitImport, importc: "JSValueIsObjectOfClass".}
proc valueIsArray*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.webkitImport, importc: "JSValueIsArray".}
proc valueIsDate*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.webkitImport, importc: "JSValueIsDate".}
proc valueGetTypedArrayType*(context: JavaScriptContextRef; value: JavaScriptValueRef; exception: ptr JavaScriptValueRef): JavaScriptTypedArrayType {.webkitImport, importc: "JSValueGetTypedArrayType".}
proc valueIsEqual*(context: JavaScriptContextRef; a: JavaScriptValueRef; b: JavaScriptValueRef; exception: ptr JavaScriptValueRef): bool {.webkitImport, importc: "JSValueIsEqual".}
proc valueIsStrictEqual*(context: JavaScriptContextRef; a: JavaScriptValueRef; b: JavaScriptValueRef): bool {.webkitImport, importc: "JSValueIsStrictEqual".}
proc valueIsInstanceOfConstructor*(context: JavaScriptContextRef; value: JavaScriptValueRef; constructor: JavaScriptObjectRef; exception: ptr JavaScriptValueRef): bool {.webkitImport, importc: "JSValueIsInstanceOfConstructor".}
proc valueMakeUndefined*(context: JavaScriptContextRef): JavaScriptValueRef {.webkitImport, importc: "JSValueMakeUndefined".}
proc valueMakeNull*(context: JavaScriptContextRef): JavaScriptValueRef {.webkitImport, importc: "JSValueMakeNull".}
proc valueMakeBoolean*(context: JavaScriptContextRef; boolean: bool): JavaScriptValueRef {.webkitImport, importc: "JSValueMakeBoolean".}
proc valueMakeNumber*(context: JavaScriptContextRef; number: cdouble): JavaScriptValueRef {.webkitImport, importc: "JSValueMakeNumber".}
proc valueMakeString*(context: JavaScriptContextRef; string_arg: JavaScriptStringRef): JavaScriptValueRef {.webkitImport, importc: "JSValueMakeString".}
proc valueMakeSymbol*(context: JavaScriptContextRef; description: JavaScriptStringRef): JavaScriptValueRef {.webkitImport, importc: "JSValueMakeSymbol".}
proc valueMakeFromJavaScriptONString*(context: JavaScriptContextRef; string_arg: JavaScriptStringRef): JavaScriptValueRef {.webkitImport, importc: "JSValueMakeFromJSONString".}
proc valueCreateJavaScriptONString*(context: JavaScriptContextRef; value: JavaScriptValueRef; indent: cuint; exception: ptr JavaScriptValueRef): JavaScriptStringRef {.webkitImport, importc: "JSValueCreateJSONString".}
proc valueToBoolean*(context: JavaScriptContextRef; value: JavaScriptValueRef): bool {.webkitImport, importc: "JSValueToBoolean".}
proc valueToNumber*(context: JavaScriptContextRef; value: JavaScriptValueRef; exception: ptr JavaScriptValueRef): cdouble {.webkitImport, importc: "JSValueToNumber".}
proc valueToStringCopy*(context: JavaScriptContextRef; value: JavaScriptValueRef; exception: ptr JavaScriptValueRef): JavaScriptStringRef {.webkitImport, importc: "JSValueToStringCopy".}
proc valueToObject*(context: JavaScriptContextRef; value: JavaScriptValueRef; exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.webkitImport, importc: "JSValueToObject".}
proc valueProtect*(context: JavaScriptContextRef; value: JavaScriptValueRef): void {.webkitImport, importc: "JSValueProtect".}
proc valueUnprotect*(context: JavaScriptContextRef; value: JavaScriptValueRef): void {.webkitImport, importc: "JSValueUnprotect".}

var kJavaScriptClassDefinitionEmpty* {.dynlib: libraryPrefix & "WebCore" & libraryFormat, importc: "kJSClassDefinitionEmpty".}: JavaScriptClassDefinition

proc classCreate*(definition: ptr JavaScriptClassDefinition): JavaScriptClassRef {.webkitImport, importc: "JSClassCreate".}
proc classRetain*(jsClass: JavaScriptClassRef): JavaScriptClassRef {.webkitImport, importc: "JSClassRetain".}
proc classRelease*(jsClass: JavaScriptClassRef): void {.webkitImport, importc: "JSClassRelease".}
proc objectMake*(context: JavaScriptContextRef; jsClass: JavaScriptClassRef; data: pointer): JavaScriptObjectRef {.webkitImport, importc: "JSObjectMake".}
proc objectMakeFunctionWithCallback*(context: JavaScriptContextRef; name: JavaScriptStringRef; callAsFunction: JavaScriptObjectCallAsFunctionCallback): JavaScriptObjectRef {.webkitImport, importc: "JSObjectMakeFunctionWithCallback".}
proc objectMakeConstructor*(context: JavaScriptContextRef; jsClass: JavaScriptClassRef; callAsConstructor: JavaScriptObjectCallAsConstructorCallback): JavaScriptObjectRef {.webkitImport, importc: "JSObjectMakeConstructor".}
proc objectMakeArray*(context: JavaScriptContextRef; argumentCount: csize_t; arguments: ptr UncheckedArray[JavaScriptValueRef]; exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.webkitImport, importc: "JSObjectMakeArray".}
proc objectMakeDate*(context: JavaScriptContextRef; argumentCount: csize_t; arguments: ptr UncheckedArray[JavaScriptValueRef]; exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.webkitImport, importc: "JSObjectMakeDate".}
proc objectMakeError*(context: JavaScriptContextRef; argumentCount: csize_t; arguments: ptr UncheckedArray[JavaScriptValueRef]; exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.webkitImport, importc: "JSObjectMakeError".}
proc objectMakeRegExp*(context: JavaScriptContextRef; argumentCount: csize_t; arguments: ptr UncheckedArray[JavaScriptValueRef]; exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.webkitImport, importc: "JSObjectMakeRegExp".}
proc objectMakeDeferredPromise*(context: JavaScriptContextRef; resolve: ptr JavaScriptObjectRef; reject: ptr JavaScriptObjectRef; exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.webkitImport, importc: "JSObjectMakeDeferredPromise".}
proc objectMakeFunction*(context: JavaScriptContextRef; name: JavaScriptStringRef; parameterCount: cuint; parameterNames: ptr UncheckedArray[JavaScriptStringRef]; body: JavaScriptStringRef; sourceURL: JavaScriptStringRef; startingLineNumber: cint; exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.webkitImport, importc: "JSObjectMakeFunction".}
proc objectGetPrototype*(context: JavaScriptContextRef; object_arg: JavaScriptObjectRef): JavaScriptValueRef {.webkitImport, importc: "JSObjectGetPrototype".}
proc objectSetPrototype*(context: JavaScriptContextRef; object_arg: JavaScriptObjectRef; value: JavaScriptValueRef): void {.webkitImport, importc: "JSObjectSetPrototype".}
proc objectHasProperty*(context: JavaScriptContextRef; object_arg: JavaScriptObjectRef; propertyName: JavaScriptStringRef): bool {.webkitImport, importc: "JSObjectHasProperty".}
proc objectGetProperty*(context: JavaScriptContextRef; object_arg: JavaScriptObjectRef; propertyName: JavaScriptStringRef; exception: ptr JavaScriptValueRef): JavaScriptValueRef {.webkitImport, importc: "JSObjectGetProperty".}
proc objectSetProperty*(context: JavaScriptContextRef; object_arg: JavaScriptObjectRef; propertyName: JavaScriptStringRef; value: JavaScriptValueRef; attributes: JavaScriptPropertyAttributes; exception: ptr JavaScriptValueRef): void {.webkitImport, importc: "JSObjectSetProperty".}
proc objectDeleteProperty*(context: JavaScriptContextRef; object_arg: JavaScriptObjectRef; propertyName: JavaScriptStringRef; exception: ptr JavaScriptValueRef): bool {.webkitImport, importc: "JSObjectDeleteProperty".}
proc objectHasPropertyForKey*(context: JavaScriptContextRef; object_arg: JavaScriptObjectRef; propertyKey: JavaScriptValueRef; exception: ptr JavaScriptValueRef): bool {.webkitImport, importc: "JSObjectHasPropertyForKey".}
proc objectGetPropertyForKey*(context: JavaScriptContextRef; object_arg: JavaScriptObjectRef; propertyKey: JavaScriptValueRef; exception: ptr JavaScriptValueRef): JavaScriptValueRef {.webkitImport, importc: "JSObjectGetPropertyForKey".}
proc objectSetPropertyForKey*(context: JavaScriptContextRef; object_arg: JavaScriptObjectRef; propertyKey: JavaScriptValueRef; value: JavaScriptValueRef; attributes: JavaScriptPropertyAttributes; exception: ptr JavaScriptValueRef): void {.webkitImport, importc: "JSObjectSetPropertyForKey".}
proc objectDeletePropertyForKey*(context: JavaScriptContextRef; object_arg: JavaScriptObjectRef; propertyKey: JavaScriptValueRef; exception: ptr JavaScriptValueRef): bool {.webkitImport, importc: "JSObjectDeletePropertyForKey".}
proc objectGetPropertyAtIndex*(context: JavaScriptContextRef; object_arg: JavaScriptObjectRef; propertyIndex: uint64; exception: ptr JavaScriptValueRef): JavaScriptValueRef {.webkitImport, importc: "JSObjectGetPropertyAtIndex".}
proc objectSetPropertyAtIndex*(context: JavaScriptContextRef; object_arg: JavaScriptObjectRef; propertyIndex: uint64; value: JavaScriptValueRef; exception: ptr JavaScriptValueRef): void {.webkitImport, importc: "JSObjectSetPropertyAtIndex".}
proc objectGetPrivate*(object_arg: JavaScriptObjectRef): pointer {.webkitImport, importc: "JSObjectGetPrivate".}
proc objectSetPrivate*(object_arg: JavaScriptObjectRef; data: pointer): bool {.webkitImport, importc: "JSObjectSetPrivate".}
proc objectIsFunction*(context: JavaScriptContextRef; object_arg: JavaScriptObjectRef): bool {.webkitImport, importc: "JSObjectIsFunction".}
proc objectCallAsFunction*(context: JavaScriptContextRef; object_arg: JavaScriptObjectRef; thisObject: JavaScriptObjectRef; argumentCount: uint64; arguments: ptr UncheckedArray[JavaScriptValueRef]; exception: ptr JavaScriptValueRef): JavaScriptValueRef {.webkitImport, importc: "JSObjectCallAsFunction".}
proc objectIsConstructor*(context: JavaScriptContextRef; object_arg: JavaScriptObjectRef): bool {.webkitImport, importc: "JSObjectIsConstructor".}
proc objectCallAsConstructor*(context: JavaScriptContextRef; object_arg: JavaScriptObjectRef; argumentCount: uint64; arguments: ptr UncheckedArray[JavaScriptValueRef]; exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.webkitImport, importc: "JSObjectCallAsConstructor".}
proc objectCopyPropertyNames*(context: JavaScriptContextRef; object_arg: JavaScriptObjectRef): JavaScriptPropertyNameArrayRef {.webkitImport, importc: "JSObjectCopyPropertyNames".}
proc propertyNameArrayRetain*(array_arg: JavaScriptPropertyNameArrayRef): JavaScriptPropertyNameArrayRef {.webkitImport, importc: "JSPropertyNameArrayRetain".}
proc propertyNameArrayRelease*(array_arg: JavaScriptPropertyNameArrayRef): void {.webkitImport, importc: "JSPropertyNameArrayRelease".}
proc propertyNameArrayGetCount*(array_arg: JavaScriptPropertyNameArrayRef): uint64 {.webkitImport, importc: "JSPropertyNameArrayGetCount".}
proc propertyNameArrayGetNameAtIndex*(array_arg: JavaScriptPropertyNameArrayRef; index: uint64): JavaScriptStringRef {.webkitImport, importc: "JSPropertyNameArrayGetNameAtIndex".}
proc propertyNameAccumulatorAddName*(accumulator: JavaScriptPropertyNameAccumulatorRef; propertyName: JavaScriptStringRef): void {.webkitImport, importc: "JSPropertyNameAccumulatorAddName".}
proc contextGroupCreate*(): JavaScriptContextGroupRef {.webkitImport, importc: "JSContextGroupCreate".}
proc contextGroupRetain*(group: JavaScriptContextGroupRef): JavaScriptContextGroupRef {.webkitImport, importc: "JSContextGroupRetain".}
proc contextGroupRelease*(group: JavaScriptContextGroupRef): void {.webkitImport, importc: "JSContextGroupRelease".}
proc globalContextCreate*(globalObjectClass: JavaScriptClassRef): JavaScriptGlobalContextRef {.webkitImport, importc: "JSGlobalContextCreate".}
proc globalContextCreateInGroup*(group: JavaScriptContextGroupRef; globalObjectClass: JavaScriptClassRef): JavaScriptGlobalContextRef {.webkitImport, importc: "JSGlobalContextCreateInGroup".}
proc globalContextRetain*(context: JavaScriptGlobalContextRef): JavaScriptGlobalContextRef {.webkitImport, importc: "JSGlobalContextRetain".}
proc globalContextRelease*(context: JavaScriptGlobalContextRef): void {.webkitImport, importc: "JSGlobalContextRelease".}
proc contextGetGlobalObject*(context: JavaScriptContextRef): JavaScriptObjectRef {.webkitImport, importc: "JSContextGetGlobalObject".}
proc contextGetGroup*(context: JavaScriptContextRef): JavaScriptContextGroupRef {.webkitImport, importc: "JSContextGetGroup".}
proc contextGetGlobalContext*(context: JavaScriptContextRef): JavaScriptGlobalContextRef {.webkitImport, importc: "JSContextGetGlobalContext".}
proc globalContextCopyName*(context: JavaScriptGlobalContextRef): JavaScriptStringRef {.webkitImport, importc: "JSGlobalContextCopyName".}
proc globalContextSetName*(context: JavaScriptGlobalContextRef; name: JavaScriptStringRef): void {.webkitImport, importc: "JSGlobalContextSetName".}
proc globalContextIsInspectable*(context: JavaScriptGlobalContextRef): bool {.webkitImport, importc: "JSGlobalContextIsInspectable".}
proc globalContextSetInspectable*(context: JavaScriptGlobalContextRef; inspectable: bool): void {.webkitImport, importc: "JSGlobalContextSetInspectable".}

proc stringCreateWithCharacters*(chars: ptr JavaScriptChar; numChars: uint64): JavaScriptStringRef {.webkitImport, importc: "JSStringCreateWithCharacters".}
proc stringCreateWithUTF8CString*(string_arg: cstring): JavaScriptStringRef {.webkitImport, importc: "JSStringCreateWithUTF8CString".}
proc stringRetain*(string_arg: JavaScriptStringRef): JavaScriptStringRef {.webkitImport, importc: "JSStringRetain".}
proc stringRelease*(string_arg: JavaScriptStringRef): void {.webkitImport, importc: "JSStringRelease".}
proc stringGetLength*(string_arg: JavaScriptStringRef): uint64 {.webkitImport, importc: "JSStringGetLength".}
proc stringGetCharactersPtr*(string_arg: JavaScriptStringRef): ptr JavaScriptChar {.webkitImport, importc: "JSStringGetCharactersPtr".}
proc stringGetMaximumUTF8CStringSize*(string_arg: JavaScriptStringRef): uint64 {.webkitImport, importc: "JSStringGetMaximumUTF8CStringSize".}
proc stringGetUTF8CString*(string_arg: JavaScriptStringRef; buffer: cstring; bufferSize: uint64): uint64 {.webkitImport, importc: "JSStringGetUTF8CString".}
proc stringIsEqual*(a: JavaScriptStringRef; b: JavaScriptStringRef): bool {.webkitImport, importc: "JSStringIsEqual".}
proc stringIsEqualToUTF8CString*(a: JavaScriptStringRef; b: cstring): bool {.webkitImport, importc: "JSStringIsEqualToUTF8CString".}

proc objectMakeTypedArray*(context: JavaScriptContextRef; arrayType: JavaScriptTypedArrayType; length: uint64; exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.webkitImport, importc: "JSObjectMakeTypedArray".}
proc objectMakeTypedArrayWithBytesNoCopy*(context: JavaScriptContextRef; arrayType: JavaScriptTypedArrayType; bytes: pointer; byteLength: uint64; bytesDeallocator: JavaScriptTypedArrayBytesDeallocator; deallocatorContext: pointer; exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.webkitImport, importc: "JSObjectMakeTypedArrayWithBytesNoCopy".}
proc objectMakeTypedArrayWithArrayBuffer*(context: JavaScriptContextRef; arrayType: JavaScriptTypedArrayType; buffer: JavaScriptObjectRef; exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.webkitImport, importc: "JSObjectMakeTypedArrayWithArrayBuffer".}
proc objectMakeTypedArrayWithArrayBufferAndOffset*(context: JavaScriptContextRef; arrayType: JavaScriptTypedArrayType; buffer: JavaScriptObjectRef; byteOffset: uint64; length: uint64; exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.webkitImport, importc: "JSObjectMakeTypedArrayWithArrayBufferAndOffset".}
proc objectGetTypedArrayBytesPtr*(context: JavaScriptContextRef; objectArgument: JavaScriptObjectRef; exception: ptr JavaScriptValueRef): pointer {.webkitImport, importc: "JSObjectGetTypedArrayBytesPtr".}
proc objectGetTypedArrayLength*(context: JavaScriptContextRef; objectArgument: JavaScriptObjectRef; exception: ptr JavaScriptValueRef): uint64 {.webkitImport, importc: "JSObjectGetTypedArrayLength".}
proc objectGetTypedArrayByteLength*(context: JavaScriptContextRef; objectArgument: JavaScriptObjectRef; exception: ptr JavaScriptValueRef): uint64 {.webkitImport, importc: "JSObjectGetTypedArrayByteLength".}
proc objectGetTypedArrayByteOffset*(context: JavaScriptContextRef; objectArgument: JavaScriptObjectRef; exception: ptr JavaScriptValueRef): uint64 {.webkitImport, importc: "JSObjectGetTypedArrayByteOffset".}
proc objectGetTypedArrayBuffer*(context: JavaScriptContextRef; objectArgument: JavaScriptObjectRef; exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.webkitImport, importc: "JSObjectGetTypedArrayBuffer".}
proc objectMakeArrayBufferWithBytesNoCopy*(context: JavaScriptContextRef; bytes: pointer; byteLength: uint64; bytesDeallocator: JavaScriptTypedArrayBytesDeallocator; deallocatorContext: pointer; exception: ptr JavaScriptValueRef): JavaScriptObjectRef {.webkitImport, importc: "JSObjectMakeArrayBufferWithBytesNoCopy".}
proc objectGetArrayBufferBytesPtr*(context: JavaScriptContextRef; objectArgument: JavaScriptObjectRef; exception: ptr JavaScriptValueRef): pointer {.webkitImport, importc: "JSObjectGetArrayBufferBytesPtr".}
proc objectGetArrayBufferByteLength*(context: JavaScriptContextRef; objectArgument: JavaScriptObjectRef; exception: ptr JavaScriptValueRef): csize_t {.webkitImport, importc: "JSObjectGetArrayBufferByteLength".}

import std/macros, std/genasts, std/times

type
  ProcParameter* = object
    name*: string
    kind*, defaultValue*: NimNode

proc `$`*(param: ProcParameter): string =
  if param.kind.kind != nnkEmpty:
    result &= "(name: " & param.name & ", "
    result &= "kind: " & $param.kind & ", "
    result &= "default: " & $param.defaultValue.toStrLit() & ")"

proc extractName*(node: NimNode): NimNode =
  ## Extracts name that might be hidden in a postfix*
  if node.kind == nnkPostFix:
    result = node[1]
  else:
    result = node

proc parameters*(prc: NimNode): seq[ProcParameter] =
  ## Returns list of parameters (first one is return type which will only have type set)
  ## Also performs other nicities such as 
  ## * unpacking multiple params of the same type
  ## * expanding using statements
  ## If the name is an empty string then it is the return type
  prc.expectKind(RoutineNodes)
  var index = 0
  for identDef in prc[3]:
    if index == 0: # Return type
      result &= ProcParameter(
        name: "",
        kind: identDef
      )
      inc index
    else:
      var 
        kind = identDef[^2]
        defaultValue = identDef[^1]
      if kind.kind == nnkEmpty:
        if defaultValue.kind == nnkEmpty:
          # It is actually a using statement
          kind = identDef[0].getTypeInst()
        else:
          # It has a default value so we can get the type
          # from that
          kind = identDef[^1].getType()
          
      for name in identDef[0 ..< ^2]:
        result &= ProcParameter(
          name: $name,
          kind: kind,
          defaultValue: defaultValue
        )
        inc index

proc `$`*(str: JavaScriptStringRef): string =
  ## Converts a JSStringRef_ to a nim string
  let length = str.stringGetLength - 1
  var buf = newSeq[char](length)

  let bufLen = str.stringGetUTF8CString(addr buf[0], length) - 1 # -1 to ignore null terminator
  result = newString(bufLen)
  for i in 0..<bufLen:
    result[i] = buf[i]

proc toJSValue*(ctx: JavaScriptContextRef, val: string): JavaScriptValueRef
proc fromJSValue*[T: string](ctx: JavaScriptContextRef, val: JavaScriptValueRef, kind: typedesc[T]): T
proc getProperty*[T](ctx: JavaScriptContextRef, obj: JavaScriptObjectRef, propName: string, kind: typedesc[T]): T

proc setJSException*(ctx: JavaScriptContextRef, msg: string, exception: JavaScriptException) =
  ## Sets the exception pointer so that an exception is raised in the javascript context.
  ## Meant to be used when you have an exception pointer to set
  var jsMsg = ctx.toJSValue(msg)
  let err = ctx.objectMakeError(1, cast[ptr UncheckedArray[JavaScriptValueRef]](addr jsMsg), nil)
  exception[] = cast[JavaScriptValueRef](err)

proc addToWindow*(ctx: JavaScriptContextRef, name: string, val: JavaScriptValueRef) =
  ## Adds a JSValueRef_ value to the global window object in the context so it can be 
  ## accessed from JS as if it was a global variable
  let name = stringCreateWithUTF8CString name.cstring
  ctx.objectSetProperty(ctx.contextGetGlobalObject, name, val, 0, nil)
  stringRelease name

proc addToWindow*(ctx: JavaScriptContextRef, vals: openArray[(string, JavaScriptValueRef)]) =
  ## Adds a key/value map of values to the window object
  for (name, val) in vals:
    ctx.addToWindow(name, val)

proc addToWindow*(ctx: JavaScriptContextRef, name: string, prc: JavaScriptObjectCallAsFunctionCallback) =
  ## Adds a function to the javascript context
  let cname = stringCreateWithUTF8CString name
  let jsFun = cast[JavaScriptValueRef](ctx.objectMakeFunctionWithCallback(cname, prc))
  ctx.addToWindow(name, jsFun)
  stringRelease cname

proc throwNim*(ctx: JavaScriptContextRef, exception: JavaScriptValueRef) =
  ## Throws a Nim exception from a `JSException` that has been returned from a proc
  assert not exception.isNil, "No exception has occured"
  # Stop showing off with "clever" code, make this less convoluted
  let 
    errMsg = ctx.getProperty(cast[JavaScriptObjectRef](exception), "message", string)
    errType = ctx.getProperty(cast[JavaScriptObjectRef](exception), "name", string)

  template doRaise(kind: untyped) = raise (ref kind)(msg: errMsg, orig: cast[JavaScriptException](unsafeAddr exception))  

  # Make the error be more refined
  case errType
  of "ReferenceError":
    doRaise(JavaScriptReferenceError)
  of "RangeError":
    doRaise(JavaScriptRangeError)
  of "SyntaxError":
    doRaise(JavaScriptSyntaxError)
  of "TypeError":
    doRaise(JavaScriptTypeError)
  else:
    doRaise(JavaScriptError)
    
proc getProperty*(ctx: JavaScriptContextRef, obj: JavaScriptObjectRef, propName: string): JavaScriptValueRef =
  ## See `getProperty <#getProperty%2CJSContextRef%2CJSObjectRef%2CJSStringRef%2Cptr.JSValueRef>`_.
  var exception: JavaScriptValueRef
  let jsName = stringCreateWithUTF8CString propName
  result = ctx.objectGetProperty(obj, jsName, addr exception)
  if not exception.isNil:
    ctx.throwNim exception
    
  stringRelease jsName
  
proc getProperty*[T](ctx: JavaScriptContextRef, obj: JavaScriptObjectRef, propName: string, kind: typedesc[T]): T =
  ## Runs `getProperty <#getProperty%2CJSContextRef%2CJSObjectRef%2CJSStringRef%2Cptr.JSValueRef>`_ and then converts the property to `T`
  let jsVal = ctx.getProperty(obj, propName)
  result = ctx.fromJSValue(jsVal, kind)

macro makeRaiser(prc: untyped) =
  ## Makes a version of a proc with the exception parameter removed and auto handles exceptions
  var
    exceptionIdent = ident"exception"
    newParams: seq[NimNode]
    inCall = nnkCall.newTree(prc.name) # Call to function that doesn't handle exception
  for i, param in prc.params:
    if i > 0:
      # If the parameter isn't the exception, then add it to the new procs parameters
      if not param[0].eqIdent("exception"):
        newParams &= param
        inCall &= ident $param[0]
      else:
        inCall &= nnkCommand.newTree(ident "unsafeAddr", exceptionIdent)
    else:
      # Add return type
      newParams &= param
    
  let body = quote do:
      var `exceptionIdent`: JavaScriptValueRef
      result = `inCall`
      if not `exceptionIdent`.isNil:
        ctx.throwNim `exceptionIdent`
        
  result = newStmtList(
    prc,
    newProc(
      prc[0],
      newParams,
      body
    )  
  )
  result[1][2] = prc[2] # Copy generic parameters

template expectType*(ctx: JavaScriptContextRef, val: JavaScriptValueRef, exception: JavaScriptException, kind: JavaScriptType, body: untyped) =
  ## Only runs body if **val** is of type **kind**.
  ## If it isn't then it raises a `ValueError` on the javascript side
  let valType = ctx.valueGetType(val)
  if valType == kind:
    body
  else:
    ctx.setJSException("ValueError: Expected " & $kind & " but got " & $valType, exception)

proc toJSValue*[T: SomeFloat | SomeInteger](ctx: JavaScriptContextRef, val: T): JavaScriptValueRef {.inline.} = 
  valueMakeNumber(ctx, val)

proc toJSValue*(ctx: JavaScriptContextRef, val: string): JavaScriptValueRef =
  let str = stringCreateWithUTF8CString(val)
  valueMakeString(ctx, str)

proc toJSValue*[T: object](ctx: JavaScriptContextRef, val: T, exception: JavaScriptException, jsClass: JavaScriptClassRef = nil, data: pointer = nil): JavaScriptValueRef {.makeRaiser.} = 
  ## Converts an object into a JS object
  ## 
  ## * **jsClass**: The class to assign to the object, is the default class by default
  ## * **data**: Private data for the object, can be accessed with getPrivate_ later 
  let tmp = ctx.makeObject(jsClass, data)
  for name, value in val.fieldPairs():
    let key = stringCreateWithUTF8CString(name)
    # TODO, make toJSValue use this procs exception pointer
    when compiles(ctx.toJSValue(value, exception)):
      let jsVal = ctx.toJSValue(value, exception)
      if exception[].isNil: return
    else:
      let jsVal = ctx.toJSValue(value)
      
    ctx.setProperty(tmp, key, jsVal, 0, exception)
    classRelease key
    if not exception[].isNil:
      return
  result = cast[JavaScriptValueRef](tmp)

proc toJSValue*[T: ref object](ctx: JavaScriptContextRef, val: T): JavaScriptValueRef =
  ## Converts a ref object into a JS value. You must have called makeTypeWrapper_ on your type before calling this.
  ## ref objects sent across can have there values edited from javascript
  GC_ref(val)
  mixin makeJSClass
  result = cast[JavaScriptValueRef](ctx.makeObject(makeJSClass(T), cast[pointer](val)))

proc toJSValue*[T: JavaScriptValueRef | JavaScriptObjectRef](ctx: JavaScriptContextRef, val: T): JavaScriptValueRef {.inline.} = cast[T](val)

proc toJSValue*(ctx: JavaScriptContextRef, val: bool): JavaScriptValueRef {.inline.} =
  ## Converts a `bool` into a JSValue
  valueMakeBoolean(ctx, val)


proc toJSValue*[T](ctx: JavaScriptContextRef, val: openArray[T], exception: JavaScriptException): JavaScriptValueRef {.makeRaiser.} =
  ## Converts items in a sequence into a JS array
  var items = newSeq[JavaScriptValueRef](val.len)
  for i, item in val:
    when compiles(ctx.toJSValue(item, exception)): 
      items[i] = ctx.toJSValue(item, exception)
      if not exception[].isNil:
        return
    else: 
      items[i] = ctx.toJSValue(item)

  result = cast[JavaScriptValueRef](ctx.makeArray(val.len.csize_t, addr items[0], exception))
  

proc toJSValue*(ctx: JavaScriptContextRef, val: DateTime, exception: JavaScriptException): JavaScriptValueRef {.makeRaiser.} =
  var dateStr = ctx.toJSValue($val)
  result = cast[JavaScriptValueRef](objectMakeDate(ctx, 1, cast[ptr UncheckedArray[JavaScriptValueRef]](addr dateStr), cast[ptr JavaScriptValueRef](exception)))

proc fromJSValue*(ctx: JavaScriptContextRef, val: JavaScriptValueRef, kind: typedesc[DateTime], exception: JavaScriptException): DateTime {.makeRaiser.} =
  ctx.expectType(val, exception, Object):
    let obj = cast[JavaScriptObjectRef](val)
    let jsName = stringCreateWithUTF8CString "toISOString"
    let isoFunc = cast[JavaScriptObjectRef](ctx.getProperty(obj, jsName, exception))
    stringRelease jsName
    if not exception[].isNil:
      return
    # Call the function
    let jsDateStr = ctx.callAsFunction(isoFunc, obj, 0, nil, exception)
    if not exception[].isNil:
      return
    let str = ctx.fromJSValue(jsDateStr, string, exception)
    result = str.parse("yyyy-MM-dd'T'hh:mm:ss'.'fff'Z'", tz=utc()).inZone(local())  

proc fromJSValue*[T: SomeInteger](ctx: JavaScriptContextRef, val: JavaScriptValueRef, kind: typedesc[T], exception: JavaScriptException): T {.makeRaiser.} =
  ctx.expectType(val, exception, Number):
    result = kind(ctx.toNumber(val, exception))
    
proc fromJSValue*[T: object](ctx: JavaScriptContextRef, val: JavaScriptValueRef, kind: typedesc[T], exception: JavaScriptException): T {.makeRaiser.} =
  ctx.expectType(val, exception, Object):
    let obj = ctx.toObject(val, exception)
    if not obj.isNil:
      for name, value in result.fieldPairs():
        let cName = stringCreateWithUTF8CString(name)
        let jsVal = ctx.getProperty(obj, cName, exception)
        if not exception[].isNil:
          return
        stringRelease cName
        value = ctx.fromJSValue(jsVal, typeof(value), exception)
        if not exception[].isNil:
          return
      
proc fromJSValue*[T: ref object](ctx: JavaScriptContextRef, val: JavaScriptValueRef, kind: typedesc[T], exception: JavaScriptException): T {.makeRaiser.}=
  ctx.expectType(val, exception, Object):
    let priv = cast[JavaScriptObjectRef](val).getPrivate()
    if priv.isNil:
      ctx.setJSException("Objects private pointer is not set to a ref object", exception)
    result = cast[T](priv)
  
proc fromJSValue*[T: string](ctx: JavaScriptContextRef, val: JavaScriptValueRef, kind: typedesc[T], exception: JavaScriptException): T {.makeRaiser.} =
  ctx.expectType(val, exception, String):
    result = $ctx.valueToStringCopy(val, exception)
    
proc fromJSValue*(ctx: JavaScriptContextRef, val: JavaScriptValueRef, kind: typedesc[bool], 
                  exception: JavaScriptException): bool {.makeRaiser.}=
  ## Makes a `bool` from a JSValue_
  ctx.expectType(val, exception, Boolean):
    result = ctx.valueToBoolean(val)

template fromArrayLikeImpl(length: int) =
  ## Expects `exception` and `obj` to be declared in calling site
  for i in 0..<length:
    let jsVal = ctx.getPropertyAtIndex(obj, i.cuint, exception)
    if not exception[].isNil: return
    result[i] = ctx.fromJSValue(jsVal, T, exception)
    if not exception[].isNil: return

proc fromJSValue*[K: static[int], T](ctx: JavaScriptContextRef, val: JavaScriptValueRef, kind: typedesc[array[K, T]], exception: JavaScriptException): array[K, T] {.makeRaiser.} =
  ctx.expectType(val, exception, Object):
    let obj = ctx.toObject(val, exception)
    if not exception[].isNil: return
    fromArrayLikeImpl(K)

proc fromJSValue*[T](ctx: JavaScriptContextRef, val: JavaScriptValueRef, kind: typedesc[seq[T]], exception: JavaScriptException): seq[T] {.makeRaiser.} =
  ctx.expectType(val, exception, Object):
    let obj = ctx.toObject(val, exception)
    if not exception[].isNil: return
    
    let length = ctx.fromJSValue(ctx.getProperty(obj, "length"), int, exception)
    if not exception[].isNil: return
    
    result = newSeq[T](length)
    fromArrayLikeImpl(length)
    
type
  ClassParameter = object
    name, kind: NimNode
    attributes: JavaScriptPropertyAttributes
    getter, setter: NimNode

proc makeSignature(params: openArray[(string, string)], returnType = ""): seq[NimNode] =
  ## Makes a sequence of NimNodes that can be passed to newProc 
  if returnType != "":
    result &= ident returnType

  for (name, kind) in params:
    result &= nnkIdentDefs.newTree(
      ident name,
      parseExpr(kind), # Makes handling types like UncheckedArray[T] easier
      newEmptyNode()
    )

macro makeTypeWrapper*(typ: typedesc[ref object], procs: varargs[typed]) =
  ## Makes a wrapper around a ref object so that it can be shared directly between Nim/JS code i.e. changing
  ## its values on the JS side affects the Nim side.
  ##
  ## It is recommended to use this for big objects since this is quicker than converting the entire object
  # Change interface to allow for more options e.g. make a constructor, add getter procs
  # TODO: Check if it is actually quicker
  # TODO: Optimise operations
  # TODO: Support oop (i.e. object of Something), maybe support this via JSClass inheritance also?
  let 
    impl = typ.getImpl()
    name = $impl[0]
  var body = impl[2]

  case body[0].kind
  of nnkSym:
    body = body[0].getImpl()[2]
  of nnkObjectTy:
    body = body[0]
  else: discard

  var params: seq[ClassParameter]    

  # TODO: Make this for loop into a util proc, I do it often enough
  # Extract all the types out of the type defintion (Making sure to following if its an alias)
  # Property attributes are found by seeing what pragmas are attached to the property
  for identDef in body[2]:
    let kind = identDef[^2]
    for param in identDef[0 ..< ^2]:
      block paramSect:
        var classParam = ClassParameter(attributes: PropertyAttributeDontDelete, kind: kind, setter: newNilLit())
        if param.kind == nnkPragmaExpr:
          classParam.name = param[0].extractName
          # Add options that relate to certain pragmas
          for prag in param[1]:
            if prag.eqIdent("jsHide"):
              # Ignore the property
              break paramSect
            elif prag.eqIdent("jsReadOnly"):
              classParam.attributes = classParam.attributes or PropertyAttributeReadOnly
            elif prag.eqIdent("jsDontEnum"):
              classParam.attributes = classParam.attributes or PropertyAttributeDontEnum
        else:
          classParam.name = param.extractName
        params &= classParam

  let 
    pragmas = nnkPragma.newTree(ident "cdecl")
  result = newStmtList()
  
  # Forward declare the makeJSClass proc
  result.add: genAstOpt({kDirtyTemplate}, typ):
    proc makeJSClass*(obj: typedesc[typ]): JavaScriptClassRef

  # Create getters/setters
  var staticValues = nnkBracket.newTree()
  for parameter in params.mitems():
    # Idents need to be made every loop or I get capture errors
    # TODO: See if genasts will fix/help this
    let
      ctxIdent = ident "ctx"
      objIdent = ident "obj"
      exceptionIdent = ident "exception"
      valueIdent = ident "value"
      
      getterSig = makeSignature({
        $ctxIdent: "JavaScriptContextRef",
        $objIdent: "JavaScriptObjectRef",
        "propName": "JavaScriptStringRef",
        $exceptionIdent: "JavaScriptException"
      }, "JavaScriptValueRef")

      setterSig = makeSignature({
        $ctxIdent: "JavaScriptContextRef",
        $objIdent: "JavaScriptObjectRef",
        "propName": "JavaScriptStringRef",
        $valueIdent: "JavaScriptValueRef",
        $exceptionIdent: "JavaScriptException"
      }, "bool")
      
    let 
      getterName = genSym(nskProc, "get_" & $parameter.name)
      paramName = parameter.name
    # Create getter function
    let getterBody = quote do:
      var obje = cast[`typ`](`objIdent`.objectGetPrivate())
      when compiles(ctx.toJSValue(obje.`paramName`, `exceptionIdent`[])):
        return ctx.toJSValue(obje.`paramName`, `exceptionIdent`[])
      else:
        return ctx.toJSValue(obje.`paramName`)
        
    result &= newProc(
      getterName,
      getterSig,
      getterBody,
      pragmas = pragmas
    )
    
    parameter.getter = getterName
    # Create setter if it is not ready only
    if PropertyAttributeReadOnly mod parameter.attributes == 0:
      let 
        setterName = genSym(nskProc, "set_" & $parameter.name)
        paramType = parameter.kind
        
      let setterBody = quote do:
        var obj = cast[`typ`](objectGetPrivate `objIdent`)
        obj.`paramName` = ctx.fromJSValue(
                                `valueIdent`, 
                                typeof(obj.`paramName`),
                                `exceptionIdent`
                          )
        
        result = true

      result &= newProc(
        setterName,
        setterSig,
        setterBody,
        pragmas = pragmas
      )
      parameter.setter = setterName
      
    staticValues &= nnkObjConstr.newTree(
      ident "JavaScriptStaticValue",
      newColonExpr(ident "name", newLit $parameter.name),
      newColonExpr(ident "getProperty", parameter.getter),
      newColonExpr(ident "setProperty", parameter.setter),
      newColonExpr(ident "attributes", newLit parameter.attributes)
    )

    echo repr staticValues
    
  if staticValues.len > 0:
    # Static values need to end with a nil name
    staticValues &= nnkObjConstr.newTree(
      ident "JavaScriptStaticValue",
      newColonExpr(ident "name", newNilLit())
    )

  # Add all the functions that belong to the object
  var staticProcs = nnkBracket.newTree()
  for prc in procs:
    let impl = prc.getImpl()
    # if impl
    let name = $genSym(nskProc, $prc)
    let params = impl.parameters
    if not params[1].kind.eqIdent(typ):
      "First parameter must be the object for object procs".error(prc)
      
    staticProcs &= nnkObjConstr.newTree(
      ident "JavaScriptStaticFunction",
      newColonExpr(ident "name", newLit $name),
      newColonExpr(ident "callAsFunction", ident $name),
      newColonExpr(ident "attributes", newLit(PropertyAttributeReadOnly or PropertyAttributeDontDelete))
    )
    result.add quote do:
      makeProcWrapper(`name`, `prc`, isObjFunc = true)
      
  if staticProcs.len > 0:
    # Static functions need to end with a nil name
    staticProcs &= nnkObjConstr.newTree(
      ident "JavaScriptStaticFunction",
      newColonExpr(ident "name", newNilLit())
    )

  let
    hasValues = staticValues.len > 0
    hasProcs = staticProcs.len > 0
    
  # Create final procs
  # Reason a proc is used is so that later converter procs can easily know if
  # a class version of an object exists
  let 
    finalizerIdent = genSym(nskProc, "finalizer")
    makeClassIdent = ident "makeJSClass"
    
  # Insert is needed since makeJSClass might be needed if any procs return the class
  result.add: genAstOpt({kDirtyTemplate}, hasValues = staticValues.len > 0, hasProcs = staticProcs.len > 0,
                     finalizer = genSym(nskProc, "finalizer"), name = name, typ = typ,
                     staticVals = staticValues, staticPrcs = staticProcs):
    proc finalizer(obj: JavaScriptObjectRef) {.cdecl.} =
      # Mark the object for garbage collection
      let obj = cast[typ](objectGetPrivate obj)
      GC_unref(obj) # Or should I call `=destroy`?

    proc makeJSClass*(obj: typedesc[`typ`]): JavaScriptClassRef =
      var class {.global.}: JavaScriptClassRef
      once:
        var classDef = kJavaScriptClassDefinitionEmpty
        # We use when statements since Nim cant infer the array if they are empty
        when hasValues:
          let tmpVals = staticVals
          classDef.staticValues = unsafeAddr tmpVals[0]

        when hasProcs:
          let tmpFuncs = staticPrcs
          classDef.staticFunctions = unsafeAddr tmpFuncs[0]

        classDef.className = name
        classDef.finalize = finalizer
        class = classCreate(addr classDef)
        
      result = class

proc evalScript*(ctx: JavaScriptContextRef, script: string): JavaScriptValueRef = 
  ## Runs a script in the context and returns the result
  let scriptStr = stringCreateWithUTF8CString script
  var exception: JavaScriptValueRef
  result = ctx.evaluateScript(scriptStr, nil, nil, 1, addr exception)
  stringRelease scriptStr
  if not exception.isNil:
    ctx.throwNim exception

proc evalScript*[T](ctx: JavaScriptContextRef, script: string, retType: typedesc[T]): T = 
  ## Runs script and convert return value to a Nim type
  result = ctx.fromJSValue(ctx.evalScript(script), retType) 

proc versionString*(): cstring {.ultralightImport, importc: "ulVersionString".}
proc versionMajor*(): uint32 {.ultralightImport, importc: "ulVersionMajor".}
proc versionMinor*(): uint32 {.ultralightImport, importc: "ulVersionMinor".}
proc versionPatch*(): uint32 {.ultralightImport, importc: "ulVersionPatch".}
proc webKitVersionString*(): cstring {.cdecl, importc: "ulWebKitVersionString".}

proc newUltralightEmptyBitmap*(): UltralightBitmap {.ultralightImport, importc: "ulCreateEmptyBitmap".}
proc newUltralightBitmap*(width: uint32; height: uint32; format: UltralightBitmapFormat): UltralightBitmap {.ultralightImport, importc: "ulCreateBitmap".}
proc newUltralightBitmapFromPixels*(width: uint32; height: uint32; format: UltralightBitmapFormat; rowBytes: uint32; pixels: pointer; size: uint64; shouldCopy: bool): UltralightBitmap {.ultralightImport, importc: "ulCreateBitmapFromPixels".}
proc newUltralightBitmapFromCopy*(existingBitmap: UltralightBitmap): UltralightBitmap {.ultralightImport, importc: "ulCreateBitmapFromCopy".}
proc destroy*(bitmap: UltralightBitmap): void {.ultralightImport, importc: "ulDestroyBitmap".}
proc width*(bitmap: UltralightBitmap): cuint {.ultralightImport, importc: "ulBitmapGetWidth".}
proc height*(bitmap: UltralightBitmap): cuint {.ultralightImport, importc: "ulBitmapGetHeight".}
proc format*(bitmap: UltralightBitmap): UltralightBitmapFormat {.ultralightImport, importc: "ulBitmapGetFormat".}
proc bpp*(bitmap: UltralightBitmap): cuint {.ultralightImport, importc: "ulBitmapGetBpp".}
proc rowBytes*(bitmap: UltralightBitmap): cuint {.ultralightImport, importc: "ulBitmapGetRowBytes".}
proc size*(bitmap: UltralightBitmap): csize_t {.ultralightImport, importc: "ulBitmapGetSize".}
proc ownsPixels*(bitmap: UltralightBitmap): bool {.ultralightImport, importc: "ulBitmapOwnsPixels".}
proc lockPixels*(bitmap: UltralightBitmap): pointer {.ultralightImport, importc: "ulBitmapLockPixels".}
proc unlockPixels*(bitmap: UltralightBitmap): void {.ultralightImport, importc: "ulBitmapUnlockPixels".}
proc rawPixels*(bitmap: UltralightBitmap): pointer {.ultralightImport, importc: "ulBitmapRawPixels".}
proc empty*(bitmap: UltralightBitmap): bool {.ultralightImport, importc: "ulBitmapIsEmpty".}
proc erase*(bitmap: UltralightBitmap): void {.ultralightImport, importc: "ulBitmapErase".}
proc writePNG*(bitmap: UltralightBitmap; path: cstring): bool {.ultralightImport, importc: "ulBitmapWritePNG".}
proc swapRedBlueChannels*(bitmap: UltralightBitmap): void {.ultralightImport, importc: "ulBitmapSwapRedBlueChannels".}

proc newUltralightBuffer*(data: pointer; size: csize_t; userData: pointer; destructionCallback: ulDestroyBUfferCallback): UltralightBuffer {.ultralightImport, importc: "ulCreateBuffer".}
proc newUltralightBufferFromCopy*(data: pointer; size: csize_t): UltralightBuffer {.ultralightImport, importc: "ulCreateBufferFromCopy".}
proc destroy*(buffer: UltralightBuffer): void {.ultralightImport, importc: "ulDestroyBuffer".}
proc bufferGetData*(buffer: UltralightBuffer): pointer {.ultralightImport, importc: "ulBufferGetData".}
proc bufferGetSize*(buffer: UltralightBuffer): csize_t {.ultralightImport, importc: "ulBufferGetSize".}
proc bufferGetUserData*(buffer: UltralightBuffer): pointer {.ultralightImport, importc: "ulBufferGetUserData".}
proc bufferOwnsData*(buffer: UltralightBuffer): bool {.ultralightImport, importc: "ulBufferOwnsData".}

proc newUltralightConfig*(): UltralightConfig {.ultralightImport, importc: "ulCreateConfig".}
proc destroy*(config: UltralightConfig): void {.ultralightImport, importc: "ulDestroyConfig".}
proc `cachePath=`*(config: UltralightConfig; cachePath: UltralightString): void {.ultralightImport, importc: "ulConfigSetCachePath".}
proc `resourcePathPrefix=`*(config: UltralightConfig; resourcePathPrefix: UltralightString): void {.ultralightImport, importc: "ulConfigSetResourcePathPrefix".}
proc `faceWinding=`*(config: UltralightConfig; winding: UltralightFaceWinding): void {.ultralightImport, importc: "ulConfigSetFaceWinding".}
proc `fontHinting=`*(config: UltralightConfig; fontHinting: UltralightFontHinting): void {.ultralightImport, importc: "ulConfigSetFontHinting".}
proc `fontGamma=`*(config: UltralightConfig; fontGamma: cdouble): void {.ultralightImport, importc: "ulConfigSetFontGamma".}
proc `userStylesheet=`*(config: UltralightConfig; cssString: UltralightString): void {.ultralightImport, importc: "ulConfigSetUserStylesheet".}
proc `forceRepaint=`*(config: UltralightConfig; enabled: bool): void {.ultralightImport, importc: "ulConfigSetForceRepaint".}
proc `animationTimerDelay=`*(config: UltralightConfig; delay: cdouble): void {.ultralightImport, importc: "ulConfigSetAnimationTimerDelay".}
proc `scrollTimerDelay=`*(config: UltralightConfig; delay: cdouble): void {.ultralightImport, importc: "ulConfigSetScrollTimerDelay".}
proc `recycleDelay=`*(config: UltralightConfig; delay: cdouble): void {.ultralightImport, importc: "ulConfigSetRecycleDelay".}
proc `memoryCacheSize=`*(config: UltralightConfig; size: cuint): void {.ultralightImport, importc: "ulConfigSetMemoryCacheSize".}
proc `pageCacheSize=`*(config: UltralightConfig; size: cuint): void {.ultralightImport, importc: "ulConfigSetPageCacheSize".}
proc `overrideRAMSize=`*(config: UltralightConfig; size: cuint): void {.ultralightImport, importc: "ulConfigSetOverrideRAMSize".}
proc `minLargeHeapSize=`*(config: UltralightConfig; size: cuint): void {.ultralightImport, importc: "ulConfigSetMinLargeHeapSize".}
proc `minSmallHeapSize=`*(config: UltralightConfig; size: cuint): void {.ultralightImport, importc: "ulConfigSetMinSmallHeapSize".}
proc `numRendererThreads=`*(config: UltralightConfig; numRendererThreads: cuint): void {.ultralightImport, importc: "ulConfigSetNumRendererThreads".}
proc `maxUpdateTime=`*(config: UltralightConfig; maxUpdateTime: cdouble): void {.ultralightImport, importc: "ulConfigSetMaxUpdateTime".}
proc `bitmapAlignment=`*(config: UltralightConfig; bitmapAlignment: cuint): void {.ultralightImport, importc: "ulConfigSetBitmapAlignment".}

proc newUltralightString*(str: cstring): UltralightString {.ultralightImport, importc: "ulCreateString".}
proc newUltralightStringUTF8*(str: cstring; len: csize_t): UltralightString {.ultralightImport, importc: "ulCreateStringUTF8".}
proc newUltralightStringUTF16*(str: ptr UltralightChar16; len: csize_t): UltralightString {.ultralightImport, importc: "ulCreateStringUTF16".}
proc newUltralightStringFromCopy*(str: UltralightString): UltralightString {.ultralightImport, importc: "ulCreateStringFromCopy".}
proc destroy*(str: UltralightString): void {.ultralightImport, importc: "ulDestroyString".}
proc data*(str: UltralightString): cstring {.ultralightImport, importc: "ulStringGetData".}
proc length*(str: UltralightString): csize_t {.ultralightImport, importc: "ulStringGetLength".}
proc empty*(str: UltralightString): bool {.ultralightImport, importc: "ulStringIsEmpty".}
proc assignString*(str: UltralightString; newStr: UltralightString): void {.ultralightImport, importc: "ulStringAssignString".}
proc assignCString*(str: UltralightString; cStr: cstring): void {.ultralightImport, importc: "ulStringAssignCString".}

proc newUltralightFontFileFromFilePath*(filePath: UltralightString): UltralightFontFile {.ultralightImport, importc: "ulFontFileCreateFromFilePath".}
proc newUltralightFontFileFromBuffer*(buffer: UltralightBuffer): UltralightFontFile {.ultralightImport, importc: "ulFontFileCreateFromBuffer".}
proc destroy*(fontFile: UltralightFontFile): void {.ultralightImport, importc: "ulDestroyFontFile".}

proc rectIsEmpty*(rect: UltralightRect): bool {.ultralightImport, importc: "ulRectIsEmpty".}
proc rectMakeEmpty*(): UltralightRect {.ultralightImport, importc: "ulRectMakeEmpty".}
proc intRectIsEmpty*(rect: UltralightIntRect): bool {.ultralightImport, importc: "ulIntRectIsEmpty".}
proc intRectMakeEmpty*(): UltralightIntRect {.ultralightImport, importc: "ulIntRectMakeEmpty".}
proc applyProjection*(transform: UltralightMatrix4x4; viewportWidth: float32; viewportHeight: float32; flipY: bool): UltralightMatrix4x4 {.ultralightImport, importc: "ulApplyProjection".}

proc newUltralightKeyEvent*(typeArgument: UltralightKeyEventType; modifiers: uint32; virtualKeyCode: int32; nativeKeyCode: int32; text: UltralightString; unmodifiedText: UltralightString; isKeypad: bool; isAutoRepeat: bool; isSystemKey: bool): UltralightKeyEvent {.ultralightImport, importc: "ulCreateKeyEvent".}
proc newUltralightKeyEventWindows*(type_arg: UltralightKeyEventType; wparam: uintptrT; lparam: intptrT; isSystemKey: bool): UltralightKeyEvent {.ultralightImport, importc: "ulCreateKeyEventWindows".}
proc destroy*(evt: UltralightKeyEvent): void {.ultralightImport, importc: "ulDestroyKeyEvent".}
proc newUltralightMouseEvent*(typeArgument: UltralightMouseEventType; x: int32; y: int32; button: UltralightMouseButton): UltralightMouseEvent {.ultralightImport, importc: "ulCreateMouseEvent".}
proc destroy*(evt: UltralightMouseEvent): void {.ultralightImport, importc: "ulDestroyMouseEvent".}

proc width*(surface: UltralightSurface): cuint {.ultralightImport, importc: "ulSurfaceGetWidth".}
proc height*(surface: UltralightSurface): cuint {.ultralightImport, importc: "ulSurfaceGetHeight".}
proc rowBytes*(surface: UltralightSurface): cuint {.ultralightImport, importc: "ulSurfaceGetRowBytes".}
proc size*(surface: UltralightSurface): csize_t {.ultralightImport, importc: "ulSurfaceGetSize".}
proc lockPixels*(surface: UltralightSurface): pointer {.ultralightImport, importc: "ulSurfaceLockPixels".}
proc unlockPixels*(surface: UltralightSurface): void {.ultralightImport, importc: "ulSurfaceUnlockPixels".}
proc resize*(surface: UltralightSurface; width: cuint; height: cuint): void {.ultralightImport, importc: "ulSurfaceResize".}
proc `dirtyBounds=`*(surface: UltralightSurface; bounds: UltralightIntRect): void {.ultralightImport, importc: "ulSurfaceSetDirtyBounds".}
proc dirtyBounds*(surface: UltralightSurface): UltralightIntRect {.ultralightImport, importc: "ulSurfaceGetDirtyBounds".}
proc clearDirtyBounds*(surface: UltralightSurface): void {.ultralightImport, importc: "ulSurfaceClearDirtyBounds".}
proc userData*(surface: UltralightSurface): pointer {.ultralightImport, importc: "ulSurfaceGetUserData".}
proc bitmap*(surface: UltralightBitmapSurface): UltralightBitmap {.ultralightImport, importc: "ulBitmapSurfaceGetBitmap".}

proc `platformLogger=`*(logger: UltralightLogger): void {.ultralightImport, importc: "ulPlatformSetLogger".}
proc `platformFileSystem=`*(fileSystem: UltralightFileSystem): void {.ultralightImport, importc: "ulPlatformSetFileSystem".}
proc `platformFontLoader=`*(fontLoader: UltralightFontLoader): void {.ultralightImport, importc: "ulPlatformSetFontLoader".}
proc `platformSurfaceDefinition=`*(surfaceDefinition: UltralightSurfaceDefinition): void {.ultralightImport, importc: "ulPlatformSetSurfaceDefinition".}
proc `platformGPUDriver=`*(gpuDriver: UltralightGPUDriver): void {.ultralightImport, importc: "ulPlatformSetGPUDriver".}
proc `platformClipboard=`*(clipboard: UltralightClipboard): void {.ultralightImport, importc: "ulPlatformSetClipboard".}

proc newUltralightRenderer*(config: UltralightConfig): UltralightRenderer {.ultralightImport, importc: "ulCreateRenderer".}
proc destroy*(renderer: UltralightRenderer): void {.ultralightImport, importc: "ulDestroyRenderer".}
proc update*(renderer: UltralightRenderer): void {.ultralightImport, importc: "ulUpdate".}
proc refreshDisplay*(renderer: UltralightRenderer; displayId: cuint): void {.ultralightImport, importc: "ulRefreshDisplay".}
proc render*(renderer: UltralightRenderer): void {.ultralightImport, importc: "ulRender".}
proc purgeMemory*(renderer: UltralightRenderer): void {.ultralightImport, importc: "ulPurgeMemory".}
proc logMemoryUsage*(renderer: UltralightRenderer): void {.ultralightImport, importc: "ulLogMemoryUsage".}
proc startRemoteInspectorServer*(renderer: UltralightRenderer; address: cstring; port: uint16): bool {.ultralightImport, importc: "ulStartRemoteInspectorServer".}
proc `gamepadDetails=`*(renderer: UltralightRenderer; index: uint32; id: UltralightString; axisCount: uint32; buttonCount: uint32): void {.ultralightImport, importc: "ulSetGamepadDetails".}
proc fire*(renderer: UltralightRenderer; evt: UltralightGamepadEvent): void {.ultralightImport, importc: "ulFireGamepadEvent".}
proc fire*(renderer: UltralightRenderer; evt: UltralightGamepadAxisEvent): void {.ultralightImport, importc: "ulFireGamepadAxisEvent".}
proc fire*(renderer: UltralightRenderer; evt: UltralightGamepadButtonEvent): void {.ultralightImport, importc: "ulFireGamepadButtonEvent".}

proc newUltralightScrollEvent*(typeArgument: UltralightScrollEventType; deltaX: int32; deltaY: int32): UltralightScrollEvent {.ultralightImport, importc: "ulCreateScrollEvent".}
proc destroy*(evt: UltralightScrollEvent): void {.ultralightImport, importc: "ulDestroyScrollEvent".}
proc newUltralightGamepadEvent*(index: uint32; typeArgument: UltralightGamepadEventType): UltralightGamepadEvent {.ultralightImport, importc: "ulCreateGamepadEvent".}
proc destroy*(evt: UltralightGamepadEvent): void {.ultralightImport, importc: "ulDestroyGamepadEvent".}
proc newUltralightGamepadAxisEvent*(index: uint32; axisIndex: uint32; value: float64): UltralightGamepadAxisEvent {.ultralightImport, importc: "ulCreateGamepadAxisEvent".}
proc destroy*(evt: UltralightGamepadAxisEvent): void {.ultralightImport, importc: "ulDestroyGamepadAxisEvent".}
proc newUltralightGamepadButtonEvent*(index: uint32; buttonIndex: uint32; value: float64): UltralightGamepadButtonEvent {.ultralightImport, importc: "ulCreateGamepadButtonEvent".}
proc destroy*(evt: UltralightGamepadButtonEvent): void {.ultralightImport, importc: "ulDestroyGamepadButtonEvent".}

proc newUltralightSession*(renderer: UltralightRenderer; isPersistent: bool; name: UltralightString): UltralightSession {.ultralightImport, importc: "ulCreateSession".}
proc destroy*(session: UltralightSession): void {.ultralightImport, importc: "ulDestroySession".}
proc defaultSession*(renderer: UltralightRenderer): UltralightSession {.ultralightImport, importc: "ulDefaultSession".}
proc persistent*(session: UltralightSession): bool {.ultralightImport, importc: "ulSessionIsPersistent".}
proc name*(session: UltralightSession): UltralightString {.ultralightImport, importc: "ulSessionGetName".}
proc id*(session: UltralightSession): culonglong {.ultralightImport, importc: "ulSessionGetId".}
proc diskPath*(session: UltralightSession): UltralightString {.ultralightImport, importc: "ulSessionGetDiskPath".}

proc newUltralightViewConfig*(): UltralightViewConfig {.ultralightImport, importc: "ulCreateViewConfig".}
proc destroy*(config: UltralightViewConfig): void {.ultralightImport, importc: "ulDestroyViewConfig".}
proc `displayId=`*(config: UltralightViewConfig; displayId: cuint): void {.ultralightImport, importc: "ulViewConfigSetDisplayId".}
proc `accelerated=`*(config: UltralightViewConfig; isAccelerated: bool): void {.ultralightImport, importc: "ulViewConfigSetIsAccelerated".}
proc `transparent=`*(config: UltralightViewConfig; isTransparent: bool): void {.ultralightImport, importc: "ulViewConfigSetIsTransparent".}
proc `initialDeviceScale=`*(config: UltralightViewConfig; initialDeviceScale: float64): void {.ultralightImport, importc: "ulViewConfigSetInitialDeviceScale".}
proc `initialFocus=`*(config: UltralightViewConfig; isFocused: bool): void {.ultralightImport, importc: "ulViewConfigSetInitialFocus".}
proc `enableImages=`*(config: UltralightViewConfig; enabled: bool): void {.ultralightImport, importc: "ulViewConfigSetEnableImages".}
proc `enableJavaScript=`*(config: UltralightViewConfig; enabled: bool): void {.ultralightImport, importc: "ulViewConfigSetEnableJavaScript".}
proc `fontFamilyStandard=`*(config: UltralightViewConfig; fontName: UltralightString): void {.ultralightImport, importc: "ulViewConfigSetFontFamilyStandard".}
proc `fontFamilyFixed=`*(config: UltralightViewConfig; fontName: UltralightString): void {.ultralightImport, importc: "ulViewConfigSetFontFamilyFixed".}
proc `fontFamilySerif=`*(config: UltralightViewConfig; fontName: UltralightString): void {.ultralightImport, importc: "ulViewConfigSetFontFamilySerif".}
proc `fontFamilySansSerif=`*(config: UltralightViewConfig; fontName: UltralightString): void {.ultralightImport, importc: "ulViewConfigSetFontFamilySansSerif".}
proc `userAgent=`*(config: UltralightViewConfig; agentString: UltralightString): void {.ultralightImport, importc: "ulViewConfigSetUserAgent".}

proc newUltralightView*(renderer: UltralightRenderer; width: uint32; height: uint32; viewConfig: UltralightViewConfig; session: UltralightSession): UltralightView {.ultralightImport, importc: "ulCreateView".}
proc destroy*(view: UltralightView): void {.ultralightImport, importc: "ulDestroyView".}
proc URL*(view: UltralightView): UltralightString {.ultralightImport, importc: "ulViewGetURL".}
proc title*(view: UltralightView): UltralightString {.ultralightImport, importc: "ulViewGetTitle".}
proc width*(view: UltralightView): cuint {.ultralightImport, importc: "ulViewGetWidth".}
proc height*(view: UltralightView): cuint {.ultralightImport, importc: "ulViewGetHeight".}
proc displayId*(view: UltralightView): cuint {.ultralightImport, importc: "ulViewGetDisplayId".}
proc `displayId=`*(view: UltralightView; displayId: cuint): void {.ultralightImport, importc: "ulViewSetDisplayId".}
proc deviceScale*(view: UltralightView): cdouble {.ultralightImport, importc: "ulViewGetDeviceScale".}
proc `deviceScale=`*(view: UltralightView; scale: cdouble): void {.ultralightImport, importc: "ulViewSetDeviceScale".}
proc accelerated*(view: UltralightView): bool {.ultralightImport, importc: "ulViewIsAccelerated".}
proc transparent*(view: UltralightView): bool {.ultralightImport, importc: "ulViewIsTransparent".}
proc loading*(view: UltralightView): bool {.ultralightImport, importc: "ulViewIsLoading".}
proc renderTarget*(view: UltralightView): UltralightRenderTarget {.ultralightImport, importc: "ulViewGetRenderTarget".}
proc surface*(view: UltralightView): UltralightSurface {.ultralightImport, importc: "ulViewGetSurface".}
proc loadHTML*(view: UltralightView; htmlString: UltralightString): void {.ultralightImport, importc: "ulViewLoadHTML".}
proc loadURL*(view: UltralightView; urlString: UltralightString): void {.ultralightImport, importc: "ulViewLoadURL".}
proc resize*(view: UltralightView; width: cuint; height: cuint): void {.ultralightImport, importc: "ulViewResize".}
proc lockJavaScriptContext*(view: UltralightView): JavaScriptContextRef {.ultralightImport, importc: "ulViewLockJSContext".}
proc unlockJavaScriptContext*(view: UltralightView): void {.ultralightImport, importc: "ulViewUnlockJSContext".}
proc evaluateScript*(view: UltralightView; jsString: UltralightString; exception: ptr UltralightString): UltralightString {.ultralightImport, importc: "ulViewEvaluateScript".}
proc canGoBack*(view: UltralightView): bool {.ultralightImport, importc: "ulViewCanGoBack".}
proc canGoForward*(view: UltralightView): bool {.ultralightImport, importc: "ulViewCanGoForward".}
proc goBack*(view: UltralightView): void {.ultralightImport, importc: "ulViewGoBack".}
proc goForward*(view: UltralightView): void {.ultralightImport, importc: "ulViewGoForward".}
proc goToHistoryOffset*(view: UltralightView; offset: cint): void {.ultralightImport, importc: "ulViewGoToHistoryOffset".}
proc reload*(view: UltralightView): void {.ultralightImport, importc: "ulViewReload".}
proc stop*(view: UltralightView): void {.ultralightImport, importc: "ulViewStop".}
proc focus*(view: UltralightView): void {.ultralightImport, importc: "ulViewFocus".}
proc unfocus*(view: UltralightView): void {.ultralightImport, importc: "ulViewUnfocus".}
proc focused*(view: UltralightView): bool {.ultralightImport, importc: "ulViewHasFocus".}
proc inputFocused*(view: UltralightView): bool {.ultralightImport, importc: "ulViewHasInputFocus".}
proc fire*(view: UltralightView; keyEvent: UltralightKeyEvent): void {.ultralightImport, importc: "ulViewFireKeyEvent".}
proc fire*(view: UltralightView; mouseEvent: UltralightMouseEvent): void {.ultralightImport, importc: "ulViewFireMouseEvent".}
proc fire*(view: UltralightView; scrollEvent: UltralightScrollEvent): void {.ultralightImport, importc: "ulViewFireScrollEvent".}
proc setChangeTitleCallback*(view: UltralightView; callback: UltralightChangeTitleCallback; userData: pointer): void {.ultralightImport, importc: "ulViewSetChangeTitleCallback".}
proc setChangeURLCallback*(view: UltralightView; callback: UltralightChangeURLCallback; userData: pointer): void {.ultralightImport, importc: "ulViewSetChangeURLCallback".}
proc setChangeTooltipCallback*(view: UltralightView; callback: UltralightChangeTooltipCallback; userData: pointer): void {.ultralightImport, importc: "ulViewSetChangeTooltipCallback".}
proc setChangeCursorCallback*(view: UltralightView; callback: UltralightChangeCursorCallback; userData: pointer): void {.ultralightImport, importc: "ulViewSetChangeCursorCallback".}
proc setAddConsoleMessageCallback*(view: UltralightView; callback: UltralightAddConsoleMessageCallback; userData: pointer): void {.ultralightImport, importc: "ulViewSetAddConsoleMessageCallback".}
proc setCreateChildViewCallback*(view: UltralightView; callback: UltralightCreateChildViewCallback; userData: pointer): void {.ultralightImport, importc: "ulViewSetCreateChildViewCallback".}
proc setCreateInspectorViewCallback*(view: UltralightView; callback: UltralightCreateInspectorViewCallback; userData: pointer): void {.ultralightImport, importc: "ulViewSetCreateInspectorViewCallback".}
proc setBeginLoadingCallback*(view: UltralightView; callback: UltralightBeginLoadingCallback; userData: pointer): void {.ultralightImport, importc: "ulViewSetBeginLoadingCallback".}
proc setFinishLoadingCallback*(view: UltralightView; callback: UltralightFinishLoadingCallback; userData: pointer): void {.ultralightImport, importc: "ulViewSetFinishLoadingCallback".}
proc setFailLoadingCallback*(view: UltralightView; callback: UltralightFailLoadingCallback; userData: pointer): void {.ultralightImport, importc: "ulViewSetFailLoadingCallback".}
proc setWindowObjectReadyCallback*(view: UltralightView; callback: UltralightWindowObjectReadyCallback; userData: pointer): void {.ultralightImport, importc: "ulViewSetWindowObjectReadyCallback".}
proc setDOMReadyCallback*(view: UltralightView; callback: UltralightDOMReadyCallback; userData: pointer): void {.ultralightImport, importc: "ulViewSetDOMReadyCallback".}
proc setUpdateHistoryCallback*(view: UltralightView; callback: UltralightUpdateHistoryCallback; userData: pointer): void {.ultralightImport, importc: "ulViewSetUpdateHistoryCallback".}
proc `needsPaint=`*(view: UltralightView; needsPaint: bool): void {.ultralightImport, importc: "ulViewSetNeedsPaint".}
proc needsPaint*(view: UltralightView): bool {.ultralightImport, importc: "ulViewGetNeedsPaint".}
proc newUltralightLocalInspectorView*(view: UltralightView): void {.ultralightImport, importc: "ulViewCreateLocalInspectorView".}

proc newUltralightSettings*(): UltralightSettings {.ultralightImport, importc: "ulCreateSettings".}
proc destroy*(settings: UltralightSettings): void {.ultralightImport, importc: "ulDestroySettings".}
proc `developerName=`*(settings: UltralightSettings; name: UltralightString): void {.ultralightImport, importc: "ulSettingsSetDeveloperName".}
proc `appName=`*(settings: UltralightSettings; name: UltralightString): void {.ultralightImport, importc: "ulSettingsSetAppName".}
proc `fileSystemPath=`*(settings: UltralightSettings; path: UltralightString): void {.ultralightImport, importc: "ulSettingsSetFileSystemPath".}
proc `loadShadersFromFileSystem=`*(settings: UltralightSettings; enabled: bool): void {.ultralightImport, importc: "ulSettingsSetLoadShadersFromFileSystem".}
proc `forceCPURenderer=`*(settings: UltralightSettings; forceCpu: bool): void {.ultralightImport, importc: "ulSettingsSetForceCPURenderer".}

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