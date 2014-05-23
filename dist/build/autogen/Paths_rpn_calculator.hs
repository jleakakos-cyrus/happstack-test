module Paths_rpn_calculator (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/jleakakos/.cabal/bin"
libdir     = "/Users/jleakakos/.cabal/lib/x86_64-osx-ghc-7.6.3/rpn-calculator-0.1.0.0"
datadir    = "/Users/jleakakos/.cabal/share/x86_64-osx-ghc-7.6.3/rpn-calculator-0.1.0.0"
libexecdir = "/Users/jleakakos/.cabal/libexec"
sysconfdir = "/Users/jleakakos/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "rpn_calculator_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "rpn_calculator_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "rpn_calculator_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "rpn_calculator_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "rpn_calculator_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
