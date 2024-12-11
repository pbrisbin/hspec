{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_hspec_discover (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "hspec_discover"
version :: Version
version = Version [2,11,9] []

synopsis :: String
synopsis = "Automatically discover and run Hspec tests"
copyright :: String
copyright = "(c) 2012-2024 Simon Hengel"
homepage :: String
homepage = "https://hspec.github.io/"
