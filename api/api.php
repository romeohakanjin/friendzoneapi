<?php

    try
    {
        /*$user = "id876389_admin";
        $pass = "adminfriendzone";
        $host = "server11.000webhost.com";
        $dbname = "id876389_friendzone";*/
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