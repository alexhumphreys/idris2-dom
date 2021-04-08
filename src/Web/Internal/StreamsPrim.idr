module Web.Internal.StreamsPrim
 
import JS
import Web.Internal.Types
 

--------------------------------------------------------------------------------
--          Interfaces
--------------------------------------------------------------------------------

namespace ByteLengthQueuingStrategy
  
  export
  %foreign "browser:lambda:(a)=> new ByteLengthQueuingStrategy(a)"
  prim__new : QueuingStrategyInit -> PrimIO ByteLengthQueuingStrategy
  
  export
  %foreign "browser:lambda:x=>x.highWaterMark"
  prim__highWaterMark : ByteLengthQueuingStrategy -> PrimIO Double
  
  export
  %foreign "browser:lambda:x=>x.size"
  prim__size : ByteLengthQueuingStrategy -> PrimIO Function

namespace CountQueuingStrategy
  
  export
  %foreign "browser:lambda:(a)=> new CountQueuingStrategy(a)"
  prim__new : QueuingStrategyInit -> PrimIO CountQueuingStrategy
  
  export
  %foreign "browser:lambda:x=>x.highWaterMark"
  prim__highWaterMark : CountQueuingStrategy -> PrimIO Double
  
  export
  %foreign "browser:lambda:x=>x.size"
  prim__size : CountQueuingStrategy -> PrimIO Function

namespace ReadableByteStreamController
  
  export
  %foreign "browser:lambda:x=>x.byobRequest"
  prim__byobRequest :  ReadableByteStreamController
                    -> PrimIO (Nullable ReadableStreamBYOBRequest)
  
  export
  %foreign "browser:lambda:x=>x.desiredSize"
  prim__desiredSize : ReadableByteStreamController -> PrimIO (Nullable Double)
  
  export
  %foreign "browser:lambda:(x,a)=>x.close(a)"
  prim__close : ReadableByteStreamController -> PrimIO ()
  
  export
  %foreign "browser:lambda:(x,a,b)=>x.enqueue(a b)"
  prim__enqueue : ReadableByteStreamController -> ArrayBufferView -> PrimIO ()
  
  export
  %foreign "browser:lambda:(x,a,b)=>x.error(a b)"
  prim__error : ReadableByteStreamController -> UndefOr AnyPtr -> PrimIO ()

namespace ReadableStream
  
  export
  %foreign "browser:lambda:(a,b)=> new ReadableStream(a b)"
  prim__new : UndefOr Object -> UndefOr QueuingStrategy -> PrimIO ReadableStream
  
  export
  %foreign "browser:lambda:x=>x.locked"
  prim__locked : ReadableStream -> PrimIO Boolean
  
  export
  %foreign "browser:lambda:(x,a,b)=>x.cancel(a b)"
  prim__cancel : ReadableStream -> UndefOr AnyPtr -> PrimIO (Promise Undefined)
  
  export
  %foreign "browser:lambda:(x,a,b)=>x.getReader(a b)"
  prim__getReader :  ReadableStream
                  -> UndefOr ReadableStreamGetReaderOptions
                  -> PrimIO ReadableStreamReader
  
  export
  %foreign "browser:lambda:(x,a,b,c)=>x.pipeThrough(a b c)"
  prim__pipeThrough :  ReadableStream
                    -> ReadableWritablePair
                    -> UndefOr StreamPipeOptions
                    -> PrimIO ReadableStream
  
  export
  %foreign "browser:lambda:(x,a,b,c)=>x.pipeTo(a b c)"
  prim__pipeTo :  ReadableStream
               -> WritableStream
               -> UndefOr StreamPipeOptions
               -> PrimIO (Promise Undefined)
  
  export
  %foreign "browser:lambda:(x,a)=>x.tee(a)"
  prim__tee : ReadableStream -> PrimIO (Array ReadableStream)

namespace ReadableStreamBYOBReader
  
  export
  %foreign "browser:lambda:(a)=> new ReadableStreamBYOBReader(a)"
  prim__new : ReadableStream -> PrimIO ReadableStreamBYOBReader
  
  export
  %foreign "browser:lambda:(x,a,b)=>x.read(a b)"
  prim__read :  ReadableStreamBYOBReader
             -> ArrayBufferView
             -> PrimIO (Promise ReadableStreamBYOBReadResult)
  
  export
  %foreign "browser:lambda:(x,a)=>x.releaseLock(a)"
  prim__releaseLock : ReadableStreamBYOBReader -> PrimIO ()

namespace ReadableStreamBYOBRequest
  
  export
  %foreign "browser:lambda:x=>x.view"
  prim__view : ReadableStreamBYOBRequest -> PrimIO (Nullable ArrayBufferView)
  
  export
  %foreign "browser:lambda:(x,a,b)=>x.respond(a b)"
  prim__respond : ReadableStreamBYOBRequest -> UInt64 -> PrimIO ()
  
  export
  %foreign "browser:lambda:(x,a,b)=>x.respondWithNewView(a b)"
  prim__respondWithNewView :  ReadableStreamBYOBRequest
                           -> ArrayBufferView
                           -> PrimIO ()

namespace ReadableStreamDefaultController
  
  export
  %foreign "browser:lambda:x=>x.desiredSize"
  prim__desiredSize :  ReadableStreamDefaultController
                    -> PrimIO (Nullable Double)
  
  export
  %foreign "browser:lambda:(x,a)=>x.close(a)"
  prim__close : ReadableStreamDefaultController -> PrimIO ()
  
  export
  %foreign "browser:lambda:(x,a,b)=>x.enqueue(a b)"
  prim__enqueue : ReadableStreamDefaultController -> UndefOr AnyPtr -> PrimIO ()
  
  export
  %foreign "browser:lambda:(x,a,b)=>x.error(a b)"
  prim__error : ReadableStreamDefaultController -> UndefOr AnyPtr -> PrimIO ()

namespace ReadableStreamDefaultReader
  
  export
  %foreign "browser:lambda:(a)=> new ReadableStreamDefaultReader(a)"
  prim__new : ReadableStream -> PrimIO ReadableStreamDefaultReader
  
  export
  %foreign "browser:lambda:(x,a)=>x.read(a)"
  prim__read :  ReadableStreamDefaultReader
             -> PrimIO (Promise ReadableStreamDefaultReadResult)
  
  export
  %foreign "browser:lambda:(x,a)=>x.releaseLock(a)"
  prim__releaseLock : ReadableStreamDefaultReader -> PrimIO ()

namespace TransformStream
  
  export
  %foreign "browser:lambda:(a,b,c)=> new TransformStream(a b c)"
  prim__new :  UndefOr Object
            -> UndefOr QueuingStrategy
            -> UndefOr QueuingStrategy
            -> PrimIO TransformStream
  
  export
  %foreign "browser:lambda:x=>x.readable"
  prim__readable : TransformStream -> PrimIO ReadableStream
  
  export
  %foreign "browser:lambda:x=>x.writable"
  prim__writable : TransformStream -> PrimIO WritableStream

namespace TransformStreamDefaultController
  
  export
  %foreign "browser:lambda:x=>x.desiredSize"
  prim__desiredSize :  TransformStreamDefaultController
                    -> PrimIO (Nullable Double)
  
  export
  %foreign "browser:lambda:(x,a,b)=>x.enqueue(a b)"
  prim__enqueue :  TransformStreamDefaultController
                -> UndefOr AnyPtr
                -> PrimIO ()
  
  export
  %foreign "browser:lambda:(x,a,b)=>x.error(a b)"
  prim__error : TransformStreamDefaultController -> UndefOr AnyPtr -> PrimIO ()
  
  export
  %foreign "browser:lambda:(x,a)=>x.terminate(a)"
  prim__terminate : TransformStreamDefaultController -> PrimIO ()

namespace WritableStream
  
  export
  %foreign "browser:lambda:(a,b)=> new WritableStream(a b)"
  prim__new : UndefOr Object -> UndefOr QueuingStrategy -> PrimIO WritableStream
  
  export
  %foreign "browser:lambda:x=>x.locked"
  prim__locked : WritableStream -> PrimIO Boolean
  
  export
  %foreign "browser:lambda:(x,a,b)=>x.abort(a b)"
  prim__abort : WritableStream -> UndefOr AnyPtr -> PrimIO (Promise Undefined)
  
  export
  %foreign "browser:lambda:(x,a)=>x.close(a)"
  prim__close : WritableStream -> PrimIO (Promise Undefined)
  
  export
  %foreign "browser:lambda:(x,a)=>x.getWriter(a)"
  prim__getWriter : WritableStream -> PrimIO WritableStreamDefaultWriter

namespace WritableStreamDefaultController
  
  export
  %foreign "browser:lambda:(x,a,b)=>x.error(a b)"
  prim__error : WritableStreamDefaultController -> UndefOr AnyPtr -> PrimIO ()

namespace WritableStreamDefaultWriter
  
  export
  %foreign "browser:lambda:(a)=> new WritableStreamDefaultWriter(a)"
  prim__new : WritableStream -> PrimIO WritableStreamDefaultWriter
  
  export
  %foreign "browser:lambda:x=>x.closed"
  prim__closed : WritableStreamDefaultWriter -> PrimIO (Promise Undefined)
  
  export
  %foreign "browser:lambda:x=>x.desiredSize"
  prim__desiredSize : WritableStreamDefaultWriter -> PrimIO (Nullable Double)
  
  export
  %foreign "browser:lambda:x=>x.ready"
  prim__ready : WritableStreamDefaultWriter -> PrimIO (Promise Undefined)
  
  export
  %foreign "browser:lambda:(x,a,b)=>x.abort(a b)"
  prim__abort :  WritableStreamDefaultWriter
              -> UndefOr AnyPtr
              -> PrimIO (Promise Undefined)
  
  export
  %foreign "browser:lambda:(x,a)=>x.close(a)"
  prim__close : WritableStreamDefaultWriter -> PrimIO (Promise Undefined)
  
  export
  %foreign "browser:lambda:(x,a)=>x.releaseLock(a)"
  prim__releaseLock : WritableStreamDefaultWriter -> PrimIO ()
  
  export
  %foreign "browser:lambda:(x,a,b)=>x.write(a b)"
  prim__write :  WritableStreamDefaultWriter
              -> UndefOr AnyPtr
              -> PrimIO (Promise Undefined)

--------------------------------------------------------------------------------
--          Mixins
--------------------------------------------------------------------------------

namespace GenericTransformStream
  
  export
  %foreign "browser:lambda:x=>x.readable"
  prim__readable : GenericTransformStream -> PrimIO ReadableStream
  
  export
  %foreign "browser:lambda:x=>x.writable"
  prim__writable : GenericTransformStream -> PrimIO WritableStream

namespace ReadableStreamGenericReader
  
  export
  %foreign "browser:lambda:x=>x.closed"
  prim__closed : ReadableStreamGenericReader -> PrimIO (Promise Undefined)
  
  export
  %foreign "browser:lambda:(x,a,b)=>x.cancel(a b)"
  prim__cancel :  ReadableStreamGenericReader
               -> UndefOr AnyPtr
               -> PrimIO (Promise Undefined)

--------------------------------------------------------------------------------
--          Dictionaries
--------------------------------------------------------------------------------

namespace QueuingStrategy
  
  export
  %foreign "browser:lambda:x=>x.highWaterMark"
  prim__highWaterMark : QueuingStrategy -> PrimIO (UndefOr Double)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.highWaterMark = v}"
  prim__setHighWaterMark : QueuingStrategy -> UndefOr Double -> PrimIO ()
  
  export
  %foreign "browser:lambda:x=>x.size"
  prim__size : QueuingStrategy -> PrimIO (UndefOr QueuingStrategySize)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.size = v}"
  prim__setSize : QueuingStrategy -> UndefOr QueuingStrategySize -> PrimIO ()

namespace QueuingStrategyInit
  
  export
  %foreign "browser:lambda:x=>x.highWaterMark"
  prim__highWaterMark : QueuingStrategyInit -> PrimIO Double
  
  export
  %foreign "browser:lambda:(x,v)=>{x.highWaterMark = v}"
  prim__setHighWaterMark : QueuingStrategyInit -> Double -> PrimIO ()

namespace ReadableStreamBYOBReadResult
  
  export
  %foreign "browser:lambda:x=>x.done"
  prim__done : ReadableStreamBYOBReadResult -> PrimIO (UndefOr Boolean)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.done = v}"
  prim__setDone : ReadableStreamBYOBReadResult -> UndefOr Boolean -> PrimIO ()
  
  export
  %foreign "browser:lambda:x=>x.value"
  prim__value : ReadableStreamBYOBReadResult -> PrimIO (UndefOr ArrayBufferView)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.value = v}"
  prim__setValue :  ReadableStreamBYOBReadResult
                 -> UndefOr ArrayBufferView
                 -> PrimIO ()

namespace ReadableStreamDefaultReadResult
  
  export
  %foreign "browser:lambda:x=>x.done"
  prim__done : ReadableStreamDefaultReadResult -> PrimIO (UndefOr Boolean)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.done = v}"
  prim__setDone :  ReadableStreamDefaultReadResult
                -> UndefOr Boolean
                -> PrimIO ()
  
  export
  %foreign "browser:lambda:x=>x.value"
  prim__value : ReadableStreamDefaultReadResult -> PrimIO (UndefOr AnyPtr)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.value = v}"
  prim__setValue :  ReadableStreamDefaultReadResult
                 -> UndefOr AnyPtr
                 -> PrimIO ()

namespace ReadableStreamGetReaderOptions
  
  export
  %foreign "browser:lambda:x=>x.mode"
  prim__mode :  ReadableStreamGetReaderOptions
             -> PrimIO (UndefOr ReadableStreamReaderMode)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.mode = v}"
  prim__setMode :  ReadableStreamGetReaderOptions
                -> UndefOr ReadableStreamReaderMode
                -> PrimIO ()

namespace ReadableStreamIteratorOptions
  
  export
  %foreign "browser:lambda:x=>x.preventCancel"
  prim__preventCancel :  ReadableStreamIteratorOptions
                      -> PrimIO (UndefOr Boolean)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.preventCancel = v}"
  prim__setPreventCancel :  ReadableStreamIteratorOptions
                         -> UndefOr Boolean
                         -> PrimIO ()

namespace ReadableWritablePair
  
  export
  %foreign "browser:lambda:x=>x.readable"
  prim__readable : ReadableWritablePair -> PrimIO ReadableStream
  
  export
  %foreign "browser:lambda:(x,v)=>{x.readable = v}"
  prim__setReadable : ReadableWritablePair -> ReadableStream -> PrimIO ()
  
  export
  %foreign "browser:lambda:x=>x.writable"
  prim__writable : ReadableWritablePair -> PrimIO WritableStream
  
  export
  %foreign "browser:lambda:(x,v)=>{x.writable = v}"
  prim__setWritable : ReadableWritablePair -> WritableStream -> PrimIO ()

namespace StreamPipeOptions
  
  export
  %foreign "browser:lambda:x=>x.preventAbort"
  prim__preventAbort : StreamPipeOptions -> PrimIO (UndefOr Boolean)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.preventAbort = v}"
  prim__setPreventAbort : StreamPipeOptions -> UndefOr Boolean -> PrimIO ()
  
  export
  %foreign "browser:lambda:x=>x.preventCancel"
  prim__preventCancel : StreamPipeOptions -> PrimIO (UndefOr Boolean)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.preventCancel = v}"
  prim__setPreventCancel : StreamPipeOptions -> UndefOr Boolean -> PrimIO ()
  
  export
  %foreign "browser:lambda:x=>x.preventClose"
  prim__preventClose : StreamPipeOptions -> PrimIO (UndefOr Boolean)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.preventClose = v}"
  prim__setPreventClose : StreamPipeOptions -> UndefOr Boolean -> PrimIO ()
  
  export
  %foreign "browser:lambda:x=>x.signal"
  prim__signal : StreamPipeOptions -> PrimIO (UndefOr AbortSignal)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.signal = v}"
  prim__setSignal : StreamPipeOptions -> UndefOr AbortSignal -> PrimIO ()

namespace Transformer
  
  export
  %foreign "browser:lambda:x=>x.flush"
  prim__flush : Transformer -> PrimIO (UndefOr TransformerFlushCallback)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.flush = v}"
  prim__setFlush : Transformer -> UndefOr TransformerFlushCallback -> PrimIO ()
  
  export
  %foreign "browser:lambda:x=>x.readableType"
  prim__readableType : Transformer -> PrimIO (UndefOr AnyPtr)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.readableType = v}"
  prim__setReadableType : Transformer -> UndefOr AnyPtr -> PrimIO ()
  
  export
  %foreign "browser:lambda:x=>x.start"
  prim__start : Transformer -> PrimIO (UndefOr TransformerStartCallback)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.start = v}"
  prim__setStart : Transformer -> UndefOr TransformerStartCallback -> PrimIO ()
  
  export
  %foreign "browser:lambda:x=>x.transform"
  prim__transform : Transformer -> PrimIO (UndefOr TransformerTransformCallback)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.transform = v}"
  prim__setTransform :  Transformer
                     -> UndefOr TransformerTransformCallback
                     -> PrimIO ()
  
  export
  %foreign "browser:lambda:x=>x.writableType"
  prim__writableType : Transformer -> PrimIO (UndefOr AnyPtr)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.writableType = v}"
  prim__setWritableType : Transformer -> UndefOr AnyPtr -> PrimIO ()

namespace UnderlyingSink
  
  export
  %foreign "browser:lambda:x=>x.abort"
  prim__abort : UnderlyingSink -> PrimIO (UndefOr UnderlyingSinkAbortCallback)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.abort = v}"
  prim__setAbort :  UnderlyingSink
                 -> UndefOr UnderlyingSinkAbortCallback
                 -> PrimIO ()
  
  export
  %foreign "browser:lambda:x=>x.close"
  prim__close : UnderlyingSink -> PrimIO (UndefOr UnderlyingSinkCloseCallback)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.close = v}"
  prim__setClose :  UnderlyingSink
                 -> UndefOr UnderlyingSinkCloseCallback
                 -> PrimIO ()
  
  export
  %foreign "browser:lambda:x=>x.start"
  prim__start : UnderlyingSink -> PrimIO (UndefOr UnderlyingSinkStartCallback)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.start = v}"
  prim__setStart :  UnderlyingSink
                 -> UndefOr UnderlyingSinkStartCallback
                 -> PrimIO ()
  
  export
  %foreign "browser:lambda:x=>x.type"
  prim__type : UnderlyingSink -> PrimIO (UndefOr AnyPtr)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.type = v}"
  prim__setType : UnderlyingSink -> UndefOr AnyPtr -> PrimIO ()
  
  export
  %foreign "browser:lambda:x=>x.write"
  prim__write : UnderlyingSink -> PrimIO (UndefOr UnderlyingSinkWriteCallback)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.write = v}"
  prim__setWrite :  UnderlyingSink
                 -> UndefOr UnderlyingSinkWriteCallback
                 -> PrimIO ()

namespace UnderlyingSource
  
  export
  %foreign "browser:lambda:x=>x.autoAllocateChunkSize"
  prim__autoAllocateChunkSize : UnderlyingSource -> PrimIO (UndefOr UInt64)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.autoAllocateChunkSize = v}"
  prim__setAutoAllocateChunkSize :  UnderlyingSource
                                 -> UndefOr UInt64
                                 -> PrimIO ()
  
  export
  %foreign "browser:lambda:x=>x.cancel"
  prim__cancel :  UnderlyingSource
               -> PrimIO (UndefOr UnderlyingSourceCancelCallback)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.cancel = v}"
  prim__setCancel :  UnderlyingSource
                  -> UndefOr UnderlyingSourceCancelCallback
                  -> PrimIO ()
  
  export
  %foreign "browser:lambda:x=>x.pull"
  prim__pull : UnderlyingSource -> PrimIO (UndefOr UnderlyingSourcePullCallback)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.pull = v}"
  prim__setPull :  UnderlyingSource
                -> UndefOr UnderlyingSourcePullCallback
                -> PrimIO ()
  
  export
  %foreign "browser:lambda:x=>x.start"
  prim__start :  UnderlyingSource
              -> PrimIO (UndefOr UnderlyingSourceStartCallback)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.start = v}"
  prim__setStart :  UnderlyingSource
                 -> UndefOr UnderlyingSourceStartCallback
                 -> PrimIO ()
  
  export
  %foreign "browser:lambda:x=>x.type"
  prim__type : UnderlyingSource -> PrimIO (UndefOr ReadableStreamType)
  
  export
  %foreign "browser:lambda:(x,v)=>{x.type = v}"
  prim__setType : UnderlyingSource -> UndefOr ReadableStreamType -> PrimIO ()