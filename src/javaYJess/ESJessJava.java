package javaYJess;

import jess.JessException;
import jess.Rete;
import jess.Value;

//The inference engine
public class ESJessJava { 

	//******************************
	//ATRIBUTOS
	//******************************
	private static Rete _miRete;
	private static String _programaFuente; // Nombre del fichero que almacena el programa Jess

	
	
	//******************************
	//METODOS
	//******************************
	// Constructor. Crea un motor de inferencia y carga un programa Jess
	public ESJessJava() {
		_miRete = new Rete();
		_programaFuente = "prototipo.clp";
		System.out.println("...Cargando programa " + _programaFuente + "... ");
		System.out.println(".");
		System.out.println(".");
		System.out.println(".");
		cargaPrograma(_programaFuente);
	}

	public static Rete getRete() {
		return _miRete;
	}
	
	// Obtiene e imprime la lista de hechos
	public static void listaHechos() {
		java.util.Iterator iterador;
		iterador = _miRete.listFacts();
		while (iterador.hasNext()) {
			System.out.println(iterador.next());
		}
	}

	public static void halt() {
		try {
			_miRete.halt();
		} catch (JessException je3) {
			System.out.println("Error de parada ");
		}
	}

	public static void cargaPrograma(String nombre) {
		try {
			Value v = _miRete.batch(nombre);
			System.out.println("Carga exitosa ----> " + v);
		} catch (JessException je0) {
			System.out.println("Error de lectura en " + nombre);
			je0.printStackTrace();
		}
	}

	public static void reset() {
		try {
			_miRete.reset();
		} catch (JessException je2) {
			System.out.println("Error de reseteo ");

			je2.printStackTrace();
		}
	}

	public static void run() {
		try {
			_miRete.run();
		} catch (JessException je4) {
			System.out.println("Error de ejecución ");

			je4.printStackTrace();
		}
	}
}
