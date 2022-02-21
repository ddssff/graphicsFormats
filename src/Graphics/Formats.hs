module Graphics.Formats (Renderable,render,displayListR) where

import Graphics.Rendering.OpenGL

class Renderable a where
  {- |
     Perform the relevant OpenGL calls to render your object.
     This function should leave the graphics state identical.
  -}
  render :: a -> IO ()

instance Renderable DisplayList where
  render x = callList x

displayListR :: Renderable a => a -> IO DisplayList
displayListR = defineNewList Compile . render
