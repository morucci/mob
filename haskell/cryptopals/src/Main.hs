module Main where

import qualified Data.ByteString.Base64 as B64 (encodeBase64')
import qualified Data.ByteString.Char8 as B
import Data.Hex
import Prelude

main :: IO ()
main = pure ()

-- Begin - Set 1 / 1 --

hexData :: String
hexData = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"

-- >>> convert hexData
-- Right "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"
convert :: String -> Either String B.ByteString
convert inputData = B64.encodeBase64' . B.pack <$> unhex inputData

-- End - Set 1 / 1 --
