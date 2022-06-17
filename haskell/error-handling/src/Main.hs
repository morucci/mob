module Main (main, errNoHanling, errHTry, errHEither) where

import Control.Exception (SomeException, try)

main :: IO ()
main = pure ()

type Resource = String

maxResource :: Int
maxResource = 10

----------

createResources :: Int -> IO Resource
createResources c =
  if c > maxResource
    then error "Unable to allocate resource"
    else pure "New resource"

errNoHanling :: IO Resource
errNoHanling = createResources 12

errHTry :: IO ()
errHTry = do
  resources <- cResources 12
  case resources of
    Left errMessage -> print $ "The resource creation failed due to: " <> show errMessage
    Right s -> putStrLn $ "Resources created:" <> s
  where
    cResources :: Int -> IO (Either SomeException Resource)
    cResources c = try $ createResources c

------

data ResourceErr = NotEnoughResource | NegativResource deriving (Show)

createResourcesE :: Int -> Either ResourceErr Resource
createResourcesE c
  | c < 1 = Left NegativResource
  | c > maxResource = Left NotEnoughResource
  | otherwise = Right "New resource"

errHEither :: IO ()
errHEither = do
  let resources = createResourcesE 12
  case resources of
    Left rErr -> print $ "The resource creation failed due to: " <> show rErr
    Right s -> putStrLn $ "Resources created:" <> s
