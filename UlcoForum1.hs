{-# LANGUAGE OverloadedStrings #-}

module UlcoForum1 where

import Data.Text (Text)
import Database.SQLite.Simple

dbSelectAllMessages :: Connection -> IO [(Text,Text,Text)]
dbSelectAllMessages conn = query_ conn "SELECT message_user, message_libelle, sujet_title FROM sujet INNER JOIN message ON sujet_id = message_sujet"

dbSelectAllSubjects :: Connection -> IO [(Int, Text)]
dbSelectAllSubjects conn = query_ conn "SELECT sujet_id, sujet_title FROM sujet"

dbSelectAllMessagesFromSubjectId :: Int-> Connection -> IO [(Text, Text)]
dbSelectAllMessagesFromSubjectId p conn = query conn "SELECT message_libelle, message_user FROM message WHERE message_sujet=(?)" (Only p)

