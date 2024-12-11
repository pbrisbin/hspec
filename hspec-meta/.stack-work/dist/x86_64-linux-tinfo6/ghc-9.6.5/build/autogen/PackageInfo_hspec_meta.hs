{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_hspec_meta (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "hspec_meta"
version :: Version
version = Version [2,11,9] []

synopsis :: String
synopsis = "A version of Hspec which is used to test Hspec itself"
copyright :: String
copyright = "(c) 2011-2024 Simon Hengel,\n(c) 2011-2012 Trystan Spangler,\n(c) 2011 Greg Weber"
homepage :: String
homepage = "https://hspec.github.io/"
