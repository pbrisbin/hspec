{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_hspec_api (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "hspec_api"
version :: Version
version = Version [2,11,9] []

synopsis :: String
synopsis = "A Testing Framework for Haskell"
copyright :: String
copyright = "(c) 2022-2024 Simon Hengel"
homepage :: String
homepage = "https://hspec.github.io/"
