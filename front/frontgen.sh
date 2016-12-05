mkdir bin
cd ./src
ghc -o ../bin/Home ./Home.hs
ghc -o ../bin/Catalog ./Catalog.hs
ghc -o ../bin/About ./About.hs
ghc -o ../bin/Login ./Login.hs
ghc -o ../bin/Register ./Register.hs
ghc -o ../bin/AddBook ./AddBook.hs
cd ..
./bin/Home > home.html
./bin/Catalog > catalog.html
./bin/About > about.html
./bin/Login > login.html
./bin/Register > register.html
./bin/AddBook > addbook.html
