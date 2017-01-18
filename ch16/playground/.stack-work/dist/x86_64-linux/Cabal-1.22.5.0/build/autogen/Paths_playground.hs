module Paths_playground (
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
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/dwayne/sandbox/haskell-programming/ch16/playground/.stack-work/install/x86_64-linux/lts-5.17/7.10.3/bin"
libdir     = "/home/dwayne/sandbox/haskell-programming/ch16/playground/.stack-work/install/x86_64-linux/lts-5.17/7.10.3/lib/x86_64-linux-ghc-7.10.3/playground-0.1.0.0-C9tEiS98XIIIVMlMMC9TBa"
datadir    = "/home/dwayne/sandbox/haskell-programming/ch16/playground/.stack-work/install/x86_64-linux/lts-5.17/7.10.3/share/x86_64-linux-ghc-7.10.3/playground-0.1.0.0"
libexecdir = "/home/dwayne/sandbox/haskell-programming/ch16/playground/.stack-work/install/x86_64-linux/lts-5.17/7.10.3/libexec"
sysconfdir = "/home/dwayne/sandbox/haskell-programming/ch16/playground/.stack-work/install/x86_64-linux/lts-5.17/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "playground_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "playground_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "playground_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "playground_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "playground_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
