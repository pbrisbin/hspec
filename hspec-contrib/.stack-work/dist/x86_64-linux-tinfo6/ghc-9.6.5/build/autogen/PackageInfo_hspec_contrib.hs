{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_hspec_contrib (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "hspec_contrib"
version :: Version
version = Version [0,5,2] []

synopsis :: String
synopsis = "Contributed functionality for Hspec"
copyright :: String
copyright = "(c) 2011-2024 Simon Hengel,\n(c) 2014 Junji Hashimoto"
homepage :: String
homepage = "https://hspec.github.io/"
