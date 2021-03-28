module JS.Marshall

import Control.Monad.Either
import Data.SOP
import JS.Inheritance
import JS.Util

--------------------------------------------------------------------------------
--          Marshalling from and to JS
--------------------------------------------------------------------------------

||| Interface supporting the use of a value as an
||| argument in a foreign function call.
|||
||| Implementations for primitives and external type should be
||| done using `believe_me`, as they are alredy in the correct
||| representation. Idris2 types should be converted to primitives
||| or external constants first.
public export
interface ToJS a where
  toJS : a -> AnyPtr

export
ToJS AnyPtr where
  toJS = id

export
ToJS Bits8 where
  toJS = believe_me

export
ToJS Bits16 where
  toJS = believe_me

export
ToJS Bits32 where
  toJS = believe_me

export
ToJS Bits64 where
  toJS = believe_me

export
ToJS Int where
  toJS = believe_me

export
ToJS Integer where
  toJS = believe_me

export
ToJS Double where
  toJS = believe_me

export
ToJS String where
  toJS = believe_me

export
ToJS JSObject where
  toJS = believe_me

export
ToJS DataView where
  toJS = believe_me

export
ToJS ArrayBuffer where
  toJS = believe_me

||| Interface supporting the use of a value as a
||| return type in a foreign function call.
|||
||| Implementations for primitives and external types should in
||| in general be based on `safeCast`, while Idris2 types should
||| actually inspect the pointer first by means of foreign
||| function calls.
public export
interface FromJS a where
  fromJS : AnyPtr -> Maybe a

export
primToJSIO : FromJS a => (function : String) -> PrimIO AnyPtr -> JSIO a
primToJSIO fun prim = MkEitherT $ map foo (fromPrim prim) 
  where foo : AnyPtr -> Either JSErr a
        foo ptr = case fromJS ptr of
                       Nothing => Left $ CastErr fun ptr
                       Just v  => Right v

export
FromJS AnyPtr where
  fromJS = Just

export
FromJS Bits8 where
  fromJS = safeCast

export
FromJS Bits16 where
  fromJS = safeCast

export
FromJS Bits32 where
  fromJS = safeCast

export
FromJS Bits64 where
  fromJS = safeCast

export
FromJS Int where
  fromJS = safeCast

export
FromJS Integer where
  fromJS = safeCast

export
FromJS Double where
  fromJS = safeCast

export
FromJS String where
  fromJS = safeCast

export
FromJS JSObject where
  fromJS = safeCast

export
FromJS Any where
  fromJS = Just . MkAny

export
FromJS () where
  fromJS _ = Just ()

--------------------------------------------------------------------------------
--          Bool
--------------------------------------------------------------------------------

%foreign "javascript:lambda:()=>true"
prim__true : AnyPtr

%foreign "javascript:lambda:()=>false"
prim__false : AnyPtr

export
ToJS Bool where
  toJS True  = prim__true
  toJS False = prim__false

export
FromJS Bool where
  fromJS v = if eqv prim__true v then Just True
             else if eqv prim__false v then Just False
             else Nothing

--------------------------------------------------------------------------------
--          Null and Maybe
--------------------------------------------------------------------------------

%foreign "javascript:lambda:x=>x === null || x === undefined?1:0"
prim__isNullOrUndefined : AnyPtr -> Double

||| Converts a `Maybe a` to a pointer. In case of `Nothing`
||| a pointer corresponding to `null` in javascript is returned.
export
ToJS a => ToJS (Maybe a) where
  toJS = maybe null toJS

||| Converts a pointer to a `Maybe a`.
||| If the pointer is either `null` or `undefined`, this returns
||| `Nothing`.
export
FromJS a => FromJS (Maybe a) where
  fromJS ptr = if prim__isNullOrUndefined ptr == 0
                  then Just <$> fromJS ptr
                  else Just Nothing

--------------------------------------------------------------------------------
--          Either
--------------------------------------------------------------------------------

export
(ToJS a, ToJS b) => ToJS (Either a b) where
  toJS = either toJS toJS

export
(FromJS a, FromJS b) => FromJS (Either a b) where
  fromJS ptr = map Left (fromJS ptr) <|> map Right (fromJS ptr)

--------------------------------------------------------------------------------
--          n-ary sums
--------------------------------------------------------------------------------

export
NP (ToJS . f) ks => ToJS (NS f ks) where
  toJS = collapseNS . hcmap (ToJS . f) toJS

export
(np : NP (FromJS . f) ks) => FromJS (NS f ks) where
  fromJS ptr = hchoice $ mapNP (htraverse fromP) (apInjsNP_ np)
    where fromP : forall a . FromJS (f a) -> Maybe (f a)
          fromP _ = fromJS {a = f a} ptr
