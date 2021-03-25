||| Javascript utilities. If these prove to be useful in
||| applications, they should eventually go into their
||| own package.
module JS.Util

import Data.Maybe
import public JS.Marshall
import public JS.Number

--------------------------------------------------------------------------------
--          JS Primitives
--------------------------------------------------------------------------------

doubleToBool : Double -> Bool
doubleToBool d = d /= 0.0

--          Undefined
export
data Undefined : Type where [external]

export
Eq Undefined where
  _ == _ = True

export
Show Undefined where
  show _ = "undefined"

%foreign "javascript:lambda:x=>x === undefined?1:0"
prim__isUndefined : AnyPtr -> Double

%foreign "javascript:lambda:()=>undefined"
prim__undefined : Undefined

export
undefined : Undefined
undefined = prim__undefined

||| Tests, whether a value of questionable origin is undefined
export
isUndefined : a -> Bool
isUndefined v = doubleToBool $ prim__isUndefined (believe_me v)

||| Converts a value of questionable origin to `Nothing`
||| if it actually is undefined.
export
checkUndefined : a -> Maybe a
checkUndefined v = toMaybe (not $ isUndefined v) v


--          null

%foreign "javascript:lambda:x=>x === null?1:0"
prim__isNull : AnyPtr -> Double

%foreign "javascript:lambda:()=>null"
prim__null : AnyPtr

export
null : AnyPtr
null = prim__null

||| Tests, whether a value of questionable origin is null
export
isNull : a -> Bool
isNull v = doubleToBool $ prim__isNull (believe_me v)

||| Converts a value of questionable origin to `Nothing`
||| if it actually is null.
export
checkNull : a -> Maybe a
checkNull v = toMaybe (not $ isNull v) v

-- The dummies below are primitive JS types that need proper
-- implementations (my todo)

export
data JSAny : Type where [external]

export
Cast a JSAny where
  cast = believe_me

export
data JSObject : Type where [external]

export
data JSArray : Type -> Type where [external]

export
data Int32Array : Type where [external]

export
data Uint32Array : Type where [external]

export
data Float32Array : Type where [external]

export
data Float64Array : Type where [external]

export
data JSPromise : Type -> Type where [external]

export
data JSRecord : Type -> Type -> Type where [external]

export
data DataView : Type where [external]

export
data Uint16Array : Type where [external]

export
data Int16Array : Type where [external]

export
data Int8Array : Type where [external]

export
data Uint8Array : Type where [external]

export
data ArrayBuffer : Type where [external]

export
data Uint8ClampedArray : Type where [external]

||| See [spec](https://html.spec.whatwg.org/#windowproxy)
export
data WindowProxy : Type where [external]

-- TODO: How to handle vararg functions
export
data VarArg : Type -> Type where [external]
--------------------------------------------------------------------------------
--          Aliases
--------------------------------------------------------------------------------

||| A String alias used in some CSS functions.
public export
0 CSSOMString : Type
CSSOMString = String
