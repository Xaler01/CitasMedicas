<?php

class ConexionBD{

	public function cBD(){

	try{
		$bd = new PDO("mysql:host=localhost;dbname=clinica", "root", "");
		}
		catch(PDOException $e) {
			echo $e->getMessage();
		}

		$bd -> exec("set names utf8");

		return $bd;

	}

}