{-# LANGUAGE OverloadedStrings #-}

import Control.Monad.IO.Class
import Database.SQLite.Simple
import Web.Scotty
import Lucid
import Data.Text
import UlcoForum1
import TextShow

main :: IO ()
main = scotty 5000 $ do
  get "/" $ do
        html $ renderText $ do
            headerr
            p_ "All datas"
            p_ "This is the ulcooooooooforum !"

  get "/allDatas" $ do
      res <- liftIO $ withConnection "ulcoForum.db" dbSelectAllMessages
      html $ renderText $ do
          headerr
          p_ "All datas"
          mapM_ fmtMessages res

  get "/allThreads" $ do
       res <- liftIO $ withConnection "ulcoForum.db" dbSelectAllSubjects
       html $ renderText $ do
           headerr
           p_ "All datas"
           mapM_ fmtSubjects res


headerr :: Html ()
headerr = do 
    img_ [src_ "https://www.haskell.org/img/haskell-logo.svg"]
    span_ " - "
    a_ [href_ "/allDatas"] "AllData"
    span_ " - "
    a_ [href_ "/allThread"] "AllThread"


fmtMessages :: (Text, Text, Text) -> Html ()
fmtMessages (user, libelle, sujet) = 
    li_ $ do
        b_ $ toHtml sujet
        div_ [class_ "row"] $ do
            span_ $ toHtml user
            span_ " : "
            span_ $ toHtml sujet


fmtSubjects :: (Int, Text) -> Html ()
fmtSubjects (id, sujet) = 
    li_ $ do
        a_ [href_ ("/onethread/"<>showt id)] $ toHtml sujet