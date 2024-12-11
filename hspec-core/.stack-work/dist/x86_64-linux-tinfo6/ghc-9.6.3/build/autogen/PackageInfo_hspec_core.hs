{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_hspec_core (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "hspec_core"
version :: Version
version = Version [2,11,9] []

synopsis :: String
synopsis = "A Testing Framework for Haskell"
copyright :: String
copyright = "(c) 2011-2024 Simon Hengel,\n(c) 2011-2012 Trystan Spangler,\n(c) 2011 Greg Weber"
homepage :: String
homepage = "https://hspec.github.io/"
