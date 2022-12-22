<?php

class DoctoresC{

	//Crear Doctores
	public function CrearDoctorC(){

		if(isset($_POST["rolD"])){
			
			$tablaBD = "doctores";
			$datosC = array("rol"=>$_POST["rolD"], "apellido"=>$_POST["apellido"], "nombre"=>$_POST["nombre"], "sexo"=>$_POST["sexo"],  "id_consultorio"=>$_POST["consultorio"], "usuario"=>$_POST["usuario"], "clave"=>$_POST["clave"]);
			echo'<script type="text/javascript">  alert("Leyo datos de entrada"); </script>';	
			$resultado = DoctoresM::CrearDoctorM($tablaBD, $datosC);
			echo'<script type="text/javascript">  alert("Salio de consulta a BD"); </script>';	

			if($resultado == true){
				echo'<script type="text/javascript">  alert("Se creo correctamente el Doctor"); </script>';	
				echo '<script>

				window.location = "doctores";
				</script>';

			}echo'<script type="text/javascript">  alert("NO se creo correctamente el Doctor"); </script>';	


		}

	}


	//Mostrar Doctores
	static public function VerDoctoresC($columna, $valor){

		$tablaBD = "doctores";

		$resultado = DoctoresM::VerDoctoresM($tablaBD, $columna, $valor);

		return $resultado;

	}


	//Editar Doctor
	static public function DoctorC($columna, $valor){

		$tablaBD = "doctores";

		$resultado = DoctoresM::DoctorM($tablaBD, $columna, $valor);

		return $resultado;

	}


	//Actualizar Doctor
	public function ActualizarDoctorC(){

		if(isset($_POST["Did"])){

			$tablaBD = "doctores";

			$datosC = array("id"=>$_POST["Did"], "apellido"=>$_POST["apellidoE"], "nombre"=>$_POST["nombreE"], "sexo"=>$_POST["sexoE"], "usuario"=>$_POST["usuarioE"], "clave"=>$_POST["claveE"]);

			$resultado = DoctoresM::ActualizarDoctorM($tablaBD, $datosC);

			if($resultado == true){
				echo'<script type="text/javascript">  alert("Se Actualizo correctamente el doctor"); </script>';	

				echo '<script>

				window.location = "doctores";
				</script>';

			}

		}

	}




	//Borrar Doctor
	public function BorrarDoctorC(){

		if(isset($_GET["Did"])){

			$tablaBD = "doctores";

			$id = $_GET["Did"];

			if($_GET["imgD"] != ""){

				unlink($_GET["imgD"]);

			}

			$resultado = DoctoresM::BorrarDoctorM($tablaBD, $id);

			if($resultado == true){

				echo '<script>

				window.location = "doctores";
				</script>';

			}

		}

	}



}