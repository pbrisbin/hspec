{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_hspec (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [2,11,9] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/patrick/code/freckle/faktory_worker_haskell/.stack-work/install/x86_64-linux-tinfo6/e66017c15f51bea4ac3fcb16b2bb53b4f5b869f8c309bb662a2372c54d345a7b/9.6.3/bin"
libdir     = "/home/patrick/code/freckle/faktory_worker_haskell/.stack-work/install/x86_64-linux-tinfo6/e66017c15f51bea4ac3fcb16b2bb53b4f5b869f8c309bb662a2372c54d345a7b/9.6.3/lib/x86_64-linux-ghc-9.6.3/hspec-2.11.9-F6eUkFEa60kLHliHhIE2Me"
dynlibdir  = "/home/patrick/code/freckle/faktory_worker_haskell/.stack-work/install/x86_64-linux-tinfo6/e66017c15f51bea4ac3fcb16b2bb53b4f5b869f8c309bb662a2372c54d345a7b/9.6.3/lib/x86_64-linux-ghc-9.6.3"
datadir    = "/home/patrick/code/freckle/faktory_worker_haskell/.stack-work/install/x86_64-linux-tinfo6/e66017c15f51bea4ac3fcb16b2bb53b4f5b869f8c309bb662a2372c54d345a7b/9.6.3/share/x86_64-linux-ghc-9.6.3/hspec-2.11.9"
libexecdir = "/home/patrick/code/freckle/faktory_worker_haskell/.stack-work/install/x86_64-linux-tinfo6/e66017c15f51bea4ac3fcb16b2bb53b4f5b869f8c309bb662a2372c54d345a7b/9.6.3/libexec/x86_64-linux-ghc-9.6.3/hspec-2.11.9"
sysconfdir = "/home/patrick/code/freckle/faktory_worker_haskell/.stack-work/install/x86_64-linux-tinfo6/e66017c15f51bea4ac3fcb16b2bb53b4f5b869f8c309bb662a2372c54d345a7b/9.6.3/etc"

getBinDir     = catchIO (getEnv "hspec_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "hspec_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "hspec_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "hspec_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hspec_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hspec_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
