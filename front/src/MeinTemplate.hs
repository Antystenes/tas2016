{-# LANGUAGE TemplateHaskell#-}
{-# LANGUAGE TemplateHaskellQuotes#-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}

module MeinTemplate  where

import Data.Text
import Text.Blaze.Html
import Text.Hamlet
import Text.Blaze.Html.Renderer.String
import Language.Haskell.TH

--genAlgDT :: String -> [String] -> Q Dec
--genAlgDT name xs =return  (DataD [] (mkName name ) []  Nothing (Prelude.map ((flip NormalC []) . mkName) xs) [] )

--genAlgDT "Page" pagelist


--pagelist :: [String]
--pagelist = ["Home",
--             "About",
--             "Catalog",
--             "Login"]

data Page = Home | About | Catalog | Login | Register | AddBook

mkUrls :: Page -> [(Text, Text)] -> Text
mkUrls Home   _ = "home.html"
mkUrls About  _ = "about.html"
mkUrls Catalog _ = "catalog.html"
mkUrls Login _ = "login.html"
mkUrls Register _ = "register.html"
mkUrls AddBook _ = "addbook.html"

webPage :: Text -> Text -> HtmlUrl Page
webPage title content = [hamlet|
<!DOCTYPE html>
<html lang="pl">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>#{title}

        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="css/shop-homepage.css" rel="stylesheet">

    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation
                        <span class="icon-bar">
                        <span class="icon-bar">
                        <span class="icon-bar">
                    <a class="navbar-brand" href=@{Home}>Strona Główna
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href=@{Catalog}>Księgarnia<span class="caret">
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">Fantastyka
                                <li>
                                    <a href="#">Kryminał
                                <li>
                                    <a href="#">Sensacja
                                <li>
                                    <a href="#">Horror
                                <li>
                                    <a href="#">Biografie
                                <li>
                                    <a href="#">Poradniki
                        <li id="addbook">
                            <a href=@{AddBook}>Dodaj książkę
                        <li id="loglink">
                            <a href=@{Login}>Zaloguj się
                        <li>
                            <a class="dropdown-toggle" data-toggle="dropdown"  href="#">O Nas<span class="caret">
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">Informacje
                                <li>
                                    <a href="#">Autorzy
                                <li>
                                    <a href="#">Kontakt
        <div class="container">
            <div class="row">

                <div class="col-md-3">
                    <p class="lead" style="font-size: 200%">#{title}
                    <div class="list-group">
                        <a href="#" class="list-group-item">PROMOCJE
                        <a href="#" class="list-group-item">BESTSELLERY
                        <a href="#" class="list-group-item">NOWOŚCI
                <div class="col-md-9">
                    #{preEscapedToMarkup content}

        <div class="container">
            <hr>
            <footer>
                <div class="row">
                    <div class="col-lg-12">
                        <p>Copyright &copy; Projekt TAS styczeń 2017
                        <p id="debug">

        <script src="js/jquery.js">
        <script src="js/mainscript.js">
        <script src="js/bootstrap.min.js">
|]
