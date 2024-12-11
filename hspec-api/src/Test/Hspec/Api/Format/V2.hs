{-# LANGUAGE ViewPatterns #-}
-- |
-- Stability: stable
module Test.Hspec.Api.Format.V2 (
  Format
, FormatConfig(..)
, defaultFormatConfig
, Event(..)
, Progress
, Path
, Location(..)
, Seconds(..)
, Item(..)
, Result(..)
, FailureReason(..)
, monadic

-- * Register a formatter
, registerFormatter
, useFormatter
, addFormatter
, liftFormatter

-- * Re-exports
, SpecWith
, Config
, modifyConfig
) where

import           Test.Hspec.Core.Runner (Config(..))
import           Test.Hspec.Core.Spec (modifyConfig, SpecWith)
import           Test.Hspec.Core.Format hiding (FormatConfig(..), defaultFormatConfig)
import qualified Test.Hspec.Core.Format as Latest

import           Test.Hspec.Api.Format.V2.Config

-- |
-- Make a formatter available for use with @--format@.
registerFormatter :: (String, FormatConfig -> IO Format) -> Config -> Config
registerFormatter = registerFormatter_ . liftFormatter

-- |
-- Make a formatter available for use with @--format@ and use it by default.
useFormatter :: (String, FormatConfig -> IO Format) -> Config -> Config
useFormatter (liftFormatter -> formatter@(_, format)) config = (registerFormatter_ formatter config) { configFormat = Just format }

addFormatter :: (String, FormatConfig -> IO Format) -> Config -> Config
addFormatter (liftFormatter -> formatter@(_, format)) config = (registerFormatter_ formatter config) { configFormat = configFormat' }
 where
  configFormat' = Just
    $ maybe format (`addFormat` format)
    $ configFormat config

  addFormat
    :: (Latest.FormatConfig -> IO Format)
    -> (Latest.FormatConfig -> IO Format)
    -> Latest.FormatConfig -> IO Format
  addFormat f1 f2 fc = do
    formatEvent1 <- f1 fc
    formatEvent2 <- f2 fc
    pure $ \event -> do
      formatEvent1 event
      formatEvent2 event

-- copy of Test.Hspec.Core.Runner.registerFormatter
registerFormatter_ :: (String, Latest.FormatConfig -> IO Latest.Format) -> Config -> Config
registerFormatter_ formatter config = config { configAvailableFormatters = formatter : configAvailableFormatters config }

-- | Make a formatter compatible with types from "Test.Hspec.Core.Format".
liftFormatter :: (String, FormatConfig -> IO Format) -> (String, Latest.FormatConfig -> IO Format)
liftFormatter = fmap liftFormat
  where
    liftFormat :: (FormatConfig -> IO Format) -> Latest.FormatConfig -> IO Format
    liftFormat format = format . unliftFormatConfig
