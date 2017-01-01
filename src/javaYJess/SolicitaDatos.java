package javaYJess;

import java.util.Scanner;

import jess.Rete;
import jess.Value;

public class SolicitaDatos {
		
		//******************************
		//ATRIBUTOS
		//******************************
		private static Scanner _scaner;
		
		
		
		
		public SolicitaDatos(){
			_scaner = new Scanner(System.in);
		}

		private static void mostrarError(String error) {

			System.out.println(error);
		}
		
		public static String pideNombre() {

			String respuesta = "";
			boolean valido = false;

			while (!valido) {
				System.out.println();
				System.out.println();
				System.out.println();
				System.out.println("Introduce tu nombre, para referirnos a ti");
				respuesta = _scaner.nextLine();
				if (respuesta.length() <= 40)
					valido = true;
				else
					System.out.println("ERROR: Por favor introduce un nombre mas corto (max. 40 caracteres)");
			}

			return respuesta;
		}
		
		public static int pideEdad() {

			System.out.println("Introduce tu edad en años completos ");
			int datoTmp = 0;
			boolean esEntero = false;
			while ((!esEntero)){
				if (_scaner.hasNextInt()) {
					datoTmp = _scaner.nextInt();
					_scaner.nextLine();
					if ((datoTmp >= 1) && (datoTmp <= 100))
						esEntero = true;
					else
						System.out.println("ERROR: El valor introducido no es una edad válida (1 - 100 años)");
				} else {
					_scaner.next();
					_scaner.nextLine();
					System.out.println();
					mostrarError("ERROR: El valor introducido no es entero");
				}
			}

			return datoTmp;
		}
		
		public static int pideAltura() {

			System.out.println("Introduce tu estatura en centimetros ");
			int datoTmp = 0;
			boolean esEntero = false;
			while ((!esEntero)){
				if (_scaner.hasNextInt()) {
					datoTmp = _scaner.nextInt();
					_scaner.nextLine();
					if ((datoTmp >= 50) && (datoTmp <= 230))
						esEntero = true;
					else
						System.out.println("ERROR: El valor introducido no es una estatura válida (50 - 230 cm)");
				} else {
					_scaner.next();
					_scaner.nextLine();
					System.out.println();
					mostrarError("ERROR: El valor introducido no es entero");
				}
			}

			return datoTmp;
		}
		
		public static int pidePeso() {

			System.out.println("Introduce tu peso en kilogramos ");
			int datoTmp = 25;
			boolean esEntero = false;
			while ((!esEntero)){
				if (_scaner.hasNextInt()) {
					datoTmp = _scaner.nextInt();
					_scaner.nextLine();
					if((datoTmp >= 25) && (datoTmp <= 300))
						esEntero = true;
					else
						System.out.println("ERROR: El valor introducido no es un peso válido (25 - 300 Kg)");
				} else {
					_scaner.next();
					_scaner.nextLine();
					System.out.println();
					mostrarError("ERROR: El valor introducido no es entero");
				}
			}

			return datoTmp;
		}
		
		public static String pideSexo() {

			String respuesta = "";
			boolean valido = false;
			do {
				System.out.println("Introduce tu sexo: ");
				System.out.println("h = hombre");
				System.out.println("m = mujer"); 
				respuesta = _scaner.nextLine();
				respuesta = respuesta.toLowerCase(); // convertimos lo que leamos a minusculas
				if ((!respuesta.equals("h")) && (!respuesta.equals("m"))){
					System.out.println();
					System.out.println("ERROR: Valor introducido inesperado (\"h\" o \"m\")");
					System.out.println();
				}
				else
					valido = true;
			} while (!valido);

			return respuesta;
		}
		
		public static float pideActividadFisica() {

			System.out.println("Introduce tu actividad Física (1-5):  ");
			System.out.println("1.- Sedentario");
			System.out.println("2.- Actividad ligera (unos 2 días a la semana)");
			System.out.println("3.- Ejercicio moderado (4 días a la semana)");
			System.out.println("4.- Ejercicio constante (más de 6 días a la semana)");
			System.out.println("5.- Actividad extrema");
			int datoTmp = 0;
			boolean esEntero = false;
			while ((!esEntero)){
				if (_scaner.hasNextInt()) {
					datoTmp = _scaner.nextInt();
					_scaner.nextLine();
					if ((datoTmp >= 1) && (datoTmp <= 5))
						esEntero = true;
					else
						System.out.println("ERROR: El valor introducido no es una opcion válida (1 - 5)");
				} else {
					_scaner.next();
					_scaner.nextLine();
					System.out.println();
					mostrarError("ERROR: El valor introducido no es entero");
				}
			}

			return traduce(datoTmp);
		}

		private static float traduce(int datoTmp) {

			float coeficiente = 0;
			
			switch (datoTmp) {
				case 1: coeficiente = (float) 1.2;
						break;
				case 2: coeficiente = (float) 1.375;
						break;
				case 3: coeficiente = (float) 1.5;
						break;
				case 4: coeficiente = (float) 1.7;
						break;
				case 5: coeficiente = (float) 2.0;
						break;
			}
			
			return coeficiente;
		}
		
		public static void muestraResultados(Rete miRete, String nombre) {
			
			//Comprobamos si hay error
			Value error = miRete.fetch("error");
			if (error != null) {
				System.out.println();
				System.out.println();
				System.out.println();
				System.out.println("*************************************************¡¡¡¡¡ATENCION!!!!!**************************************************************");
				System.out.println("*********************************************************************************************************************************");
				System.out.println("No podemos recomendar un menú óptimo acorde a sus cualidades. Para un seguimiento mas especializado, por favor, acuda a su médico");
				System.out.println("*********************************************************************************************************************************");
			}
			else{
				System.out.println();
				System.out.println();
				System.out.println("-----------------------------------------------------------------------------------------------------------------------");
				System.out.println("--------------------------------------------------  RESULTADOS  -------------------------------------------------------");
				System.out.println("-----------------------------------------------------------------------------------------------------------------------");
				
				//Mostramos el usuario
				System.out.println();
				System.out.println();
				System.out.println("USUARIO: \"" + nombre + "\"");
				System.out.println();
				System.out.println();
				
				//Mostramos las calorias recomendadas
				Value caloriasRecomendadas = miRete.fetch("caloriasRecomendadas");
				System.out.println();
				System.out.println("Las calorias recomendadas para ti son " + caloriasRecomendadas);
				
				//Mostramos el IMC
				Value imc = miRete.fetch("imc");
				System.out.println("Tu IMC es de " + imc);
				
				//Mostramos desayuno
				Value desayuno = miRete.fetch("desayuno");
				System.out.println();
				System.out.println("El desayuno recomendado consiste en " + desayuno);
				
				//Mostramos la comida
				Value primero = miRete.fetch("primero");
				Value segundo = miRete.fetch("segundo");
				Value postre = miRete.fetch("postre");
				System.out.println("El menú para la comida consta de " + primero + " de primero, " + segundo + " de segundo, y " + postre + " de postre");
				
				//Mostramos la cena
				Value cena = miRete.fetch("cena");
				Value postreCena = miRete.fetch("postreCena");
				System.out.println("La cena recomendada se compone de " + cena + " y " + postreCena + " de postre");
				System.out.println();
				
				//Mostramos las calorias consumidas
				Value caloriasConsumidas = miRete.fetch("caloriasConsumidas");
				System.out.println("Con las recomendaciones hechas consumirás unas " + caloriasConsumidas + " calorías aproximadamente.");
				
				System.out.println();
				System.out.println();
				System.out.println();
				System.out.println("¡Que aproveche!");
				System.out.println("-----------------------------------------------------------------------------------------------------------------------");
			}
		}
		
		public static int probarOtraVez() {
			System.out.println();
			System.out.println();
			System.out.println();
			System.out.println("¿Quieres probar otra vez? (1 ó 2)");
			System.out.println("1.- Si, vamos a intentarlo.");
			System.out.println("2.- No, mejor lo dejamos.");
			int datoTmp = 0;
			boolean esEntero = false;
			while ((!esEntero)){
				if (_scaner.hasNextInt()) {
					datoTmp = _scaner.nextInt();
					_scaner.nextLine();
					if((datoTmp == 1) || (datoTmp == 2))
						esEntero = true;
					else
						System.out.println("El valor introducido no es una opcion válida (1 ó 2)");
				} else {
					_scaner.next();
					_scaner.nextLine();
					System.out.println();
					mostrarError("ERROR: El valor introducido no es entero");
				}
			}

			return datoTmp;
		}
}
