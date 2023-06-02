{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_hakyll (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
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
version = Version [4,15,1,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/samahri/.cabal/store/ghc-8.10.1/hkyll-4.15.1.1-9743a62c/bin"
libdir     = "/Users/samahri/.cabal/store/ghc-8.10.1/hkyll-4.15.1.1-9743a62c/lib"
dynlibdir  = "/Users/samahri/.cabal/store/ghc-8.10.1/lib"
datadir    = "/Users/samahri/.cabal/store/ghc-8.10.1/hkyll-4.15.1.1-9743a62c/share"
libexecdir = "/Users/samahri/.cabal/store/ghc-8.10.1/hkyll-4.15.1.1-9743a62c/libexec"
sysconfdir = "/Users/samahri/.cabal/store/ghc-8.10.1/hkyll-4.15.1.1-9743a62c/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hakyll_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hakyll_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "hakyll_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "hakyll_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hakyll_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hakyll_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
