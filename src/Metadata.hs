{-

  Format the metadata part of xml.search.imos

  https://catalogue-portal.aodn.org.au/geonetwork/srv/eng/xml.search.imos?protocol=OGC%3AWMS-1.1.1-http-get-map%20or%20OGC%3AWMS-1.3.0-http-get-map%20or%20IMOS%3ANCWMS--proto&sortBy=popularity&from=1&to=10&fast=index&filters=collectionavailability

-}

{-# LANGUAGE OverloadedStrings #-}


module Metadata where


import Database.PostgreSQL.Simple as PG
import qualified Database.PostgreSQL.Simple as PG(query, connectPostgreSQL, Only(..))

import RecordGet as RecordGet(getRecord)
import Record


import qualified Data.Text.Lazy as LT(pack, empty, append)
import qualified Data.Text.Lazy.IO as LT(putStrLn)

import Data.Maybe

-- So we actually need to format the damn xml...
-- lazy string concat
myConcat lst = foldl LT.append LT.empty lst



maybeToString m = 
  LT.pack $ case m of
    Just uuid -> uuid
    Nothing -> ""




main :: IO ()
main = do
  conn <- PG.connectPostgreSQL "host='postgres.localnet' dbname='harvest' user='harvest' sslmode='require'"

  let record_id = 289

  record <- RecordGet.getRecord conn record_id

  (putStrLn.show.fromJust.uuid) $ record
  (putStrLn.show.title.fromJust.dataIdentification ) $ record
  (putStrLn.show) $ record

  let s = myConcat [
          "<metadata>",

          -- source - can we factor the Just destructuring?
          LT.pack "\n<source>", maybeToString $ uuid record , "</source>",

          -- data identification
          case dataIdentification record of
            Just di -> 
              myConcat [
                "\n",
                "<title>", LT.pack $ title di, LT.pack "</title>"
              ]
          ,

          -- LT.pack $ (title.fromJust.dataIdentification) $ record,

          "\n</metadata>"
        ]

  LT.putStrLn $ s



