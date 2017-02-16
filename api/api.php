<?php

    try
    {
        /*$user = "sql8148080";
        $pass = "Hw6WwvjJ2L";
        $host = "sql8.freemysqlhosting.net";
        $dbname = "sql8148080";*/
        $user = "root";
        $pass = "";
        $host = "localhost";
        $dbname = "friendzone";

        $bdd = new PDO('mysql:host='.$host.';dbname='.$dbname.'', $user, $pass, array(PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING));

    }
    catch(Exception $e)
    {
        die('Erreur : '.$e->getMessage());
    }


    if(isset($_GET['fichier'])){
        $fichier= $_GET['fichier'];

        if(isset($_GET['action']) and isset($_GET['values'])) {
            $action = $_GET['action'];
            $values = $_GET['values'];
            include('function/' . $fichier . '.php');
        }
        else if(isset($_GET['action']) && $_GET['action'] == "users_liste"){
            include('function/' . $fichier . '.php');
        }
    }

?>