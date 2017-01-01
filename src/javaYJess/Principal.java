package javaYJess;

import jess.Deffacts;
import jess.Fact;
import jess.JessException;
import jess.RU;
import jess.Rete;
import jess.Value;

public class Principal {

	public static void main(String[] args) throws JessException {
		// Creamos el motor de inferencia
		ESJessJava esJJ = new ESJessJava();
		Rete miRete = ESJessJava.getRete();
		int op = 0;

		do {
			// leemos los datos
			SolicitaDatos solicita = new SolicitaDatos();
			String nombre = SolicitaDatos.pideNombre();
			int edad = SolicitaDatos.pideEdad();
			int altura = SolicitaDatos.pideAltura();
			int peso = SolicitaDatos.pidePeso();
			String sexo = SolicitaDatos.pideSexo();
			float actividad = SolicitaDatos.pideActividadFisica();
	
			// Pasamos los datos a JESS
			ESJessJava.reset();
			Deffacts deffacts = new Deffacts("DatosJava", null, miRete);
			Fact f = new Fact("usuario", miRete);
			f.setSlotValue("nombre", new Value(nombre, RU.SYMBOL));
			f.setSlotValue("edad", new Value(edad, RU.INTEGER));
			f.setSlotValue("altura", new Value(altura, RU.INTEGER));
			f.setSlotValue("peso", new Value(peso, RU.INTEGER));
			f.setSlotValue("sexo", new Value(sexo, RU.SYMBOL));
			f.setSlotValue("actividadFisica", new Value(actividad, RU.FLOAT));
			deffacts.addFact(f);
			miRete.addDeffacts(deffacts);
			ESJessJava.reset();
	
			// Establecemos el control de la ejecucion
			miRete.setFocus("asignaOtrasComidas");
			ESJessJava.run();
			miRete.setFocus("necesidades");
			ESJessJava.run();
			miRete.setFocus("recomendaciones");
			ESJessJava.run();
			miRete.setFocus("asignacion");
			ESJessJava.run();
			miRete.setFocus("impresionDatos");
			ESJessJava.run();
	
			// listamos los hechos
			 ESJessJava.listaHechos();
	
			// Montamos la salida de resultados
			SolicitaDatos.muestraResultados(miRete, nombre);
	
			// Para parar el motor de reglas
			ESJessJava.halt();
			
			op = SolicitaDatos.probarOtraVez();
			
			miRete.removeDeffacts("DatosJava");
		} while (op == 1);
		
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println("-----------------------------------------------------------------------------------------------------------------------");
		System.out.println("----------------------------------------------  FIN DE LA EJECUCION  --------------------------------------------------");
		System.out.println("-----------------------------------------------------------------------------------------------------------------------");
		System.out.println();
	}

}
