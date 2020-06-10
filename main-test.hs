import Database.SQLite.Simple (open, close)

import Movie1
import Movie2

main :: IO ()
main = do
    conn <- open "movie.db"

    putStrLn "\nMovie1.dbSelectAllMovies"
    dbSelectAllMovies conn >>= mapM_ print

    putStrLn "\nMovie1.dbSelectAllProds"
    dbSelectAllProds conn >>= mapM_ print

    putStrLn "\nMovie1.dbSelectAllMoviesFromPersonId"
    dbSelectAllMoviesFromPersonId conn 1 >>= mapM_ print

    close conn

