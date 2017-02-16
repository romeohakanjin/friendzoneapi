<?php

    if(isset($_GET['action']) and isset($_GET['values'])){
        /* Connexion d'un membre */
        if($_GET['action'] == 'connexion'){
            $req = $bdd->prepare('SELECT * FROM users WHERE mail = :mail AND mdp = :mdp');

            $req->execute(array(
                'mail' => $_GET['values']['mail'],
                'mdp' =>  md5($_GET['values']['mdp'])));

            $req_fetch = $req->fetch();

            if ($req_fetch){
                echo "ok";

            }

            $req->closeCursor();

            return null;

        }
        /* Ajouter un membre */
        else if($_GET['action'] == 'inscription'){
            $req =$bdd->prepare("SELECT * FROM users WHERE mail= :name");
            $req->bindParam(':name', $_GET['values']['mail'], PDO::PARAM_STR);
            $req->execute();
            $a = $req->fetchAll();

            if (!empty($a)) {
                echo "error_mail";
                return null;
            }

            $req = $bdd->prepare('INSERT INTO users(nom, prenom, tel, pseudo, mdp, mail, pos_x, pos_y, pos_z, longi, lat) VALUES (:nom, :prenom, :tel, :pseudo, :mdp, :mail, :pos_x , :pos_y , :pos_z, :longi, :lat)');

            $req->bindParam(':nom', $_GET['values']['nom'], PDO::PARAM_STR);
            $req->bindParam(':prenom', $_GET['values']['prenom'], PDO::PARAM_STR);
            $req->bindParam(':tel', $_GET['values']['tel'], PDO::PARAM_INT);
            $req->bindParam(':pseudo', $_GET['values']['pseudo'], PDO::PARAM_STR);
            $req->bindParam(':mdp', md5($_GET['values']['mdp']), PDO::PARAM_STR);
            $req->bindParam(':mail', $_GET['values']['mail'], PDO::PARAM_STR);
            $req->bindParam(':pos_x', $_GET['values']['pos_x'], PDO::PARAM_INT);
            $req->bindParam(':pos_y', $_GET['values']['pos_y'], PDO::PARAM_INT);
            $req->bindParam(':pos_z', $_GET['values']['pos_z'], PDO::PARAM_INT);
            $req->bindParam(':longi', $_GET['values']['longi'], PDO::PARAM_INT);
            $req->bindParam(':lat', $_GET['values']['lat'], PDO::PARAM_INT);

            $bool = $req->execute();
            var_dump($bool);


            if ($bool){

                echo'ok';

            }else{

                echo 'error';
            }

            $req->closeCursor(); 
        }
        /* Afficher la liste des amis */
        else if($_GET['action'] == 'amis_liste'){
            $req = $bdd->prepare('SELECT a.id_user, a.id_ami, u.nom, u.prenom, u.pseudo 
                FROM amis AS a, users AS u 
                WHERE a.id_user = u.id 
                AND a.id_user = :id_user');

            $req->bindParam(':id_user', $_GET['values']['id'], PDO::PARAM_INT);
            $req->execute();
            $a = $req->fetchAll();
            

            
            $i=0;
            $result = array();
            foreach ($a as $data ){
               $arr[$i] = array(
                'id_user'  => $data["id_user"],
                'id_ami' =>$data["id_ami"],
                'nom_user' =>$data["pseudo"].", ".$data["nom"]."".$data["prenom"]
              );
              $i++;
            }

            $req->closeCursor(); 

            //Retour en json
            echo $json_data = json_encode(array('result'=>$arr));
            return $json_data; 
        }
        /* Supprimer un de ces amis */
        else if($_GET['action'] == 'delete_amis'){
            $req = $bdd->prepare('DELETE FROM amis 
                WHERE id_user = :id_user
                AND id_ami = :id_ami');

            $req->bindParam(':id_user', $_GET['values']['id_user'], PDO::PARAM_INT);
            $req->bindParam(':id_ami', $_GET['values']['id_ami'], PDO::PARAM_INT);
            $req->execute();
            $req->closeCursor();
        }
        /* Passer la position d'un contact en partager ou en non partager */
        else if($_GET['action'] == 'partage_position'){
            $req = $bdd->prepare('UPDATE amis 
                SET partage_position = :partage_pos 
                WHERE id_user = :id_user
                AND id_ami = :id_ami');

            $req->bindParam(':partage_pos', $_GET['values']['partage_pos'], PDO::PARAM_INT);
            $req->bindParam(':id_user', $_GET['values']['id_user'], PDO::PARAM_INT);
            $req->bindParam(':id_ami', $_GET['values']['id_ami'], PDO::PARAM_INT);
            $req->execute();
            $req->closeCursor();
        }
    }

    /*Afficher la liste des utilisateurs*/
    if($_GET['action'] == 'users_liste'){
        $req = $bdd->query("SELECT * FROM users ");
        $req->setFetchMode(PDO::FETCH_ASSOC);

        $i=0;
        $result = array();
        while($data = $req->fetch()){
           $arr[$i] = array(
            'id'  => $data["id"],
            'nom' =>$data["nom"],
            'pseudo' =>$data["pseudo"],
            'tel' =>$data["tel"]
          );
          $i++;
        }
        $req->closeCursor();

        //Retour en json
        echo $json_data = json_encode(array('result'=>$arr)); 

        return $json_data;    
    }

?>