;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Alumnos:
;- Jéssica Martín Jabón
;- Javier Martín Moreno-Manzanaro
;Grupo 04
;Ingeniería del Conocimiento (4º)
;Grado en Ingeniería de Software
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defglobal ?*numCandidatos* = 0)

(deffunction aleatorio (?numPlatos)
  (return (+ (mod (random) ?numPlatos) 1))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;PLANTILLAS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deftemplate plato "Datos sobre los platos"
	(slot nombre)
    (slot tipoPlato)
    (slot calorias)
    (slot proteinas)
    (slot hidratos)
    (slot grasas)
)

(deftemplate platoDes "Datos sobre los platos"
	(slot nombre)
    (slot tipoPlato)
    (slot calorias)
    (slot proteinas)
    (slot hidratos)
    (slot grasas)
    (slot id)
)

(deftemplate usuario "Datos sobre el usuario"
    (slot nombre)
	(slot edad)
    (slot sexo)
    (slot altura)
    (slot peso)
    (slot imc (default 0))
    (slot actividadFisica)
    ;coeficientes de actividad fisica:
    ;Sedentario = 1.2
	;Actividad ligera (unos 2 días a la semana) = 1.375
	;Ejercicio moderado (4 días a la semana) = 1.5
	;Ejercicio constante (más de 6 días a la semana) = 1.7
	;Actividad extrema = 2.0
)

(deftemplate desayuno " datos para el desayuno"
	(slot plato)
    (slot calorias)
    (slot proteinas)
    (slot hidratos)
    (slot grasas)
    (slot contado)
    (slot asignado)
)

(deftemplate comida "datos para la comida"
	(slot primero)
    (slot segundo)
    (slot postre)
    (slot calorias)
    (slot id)
)

(deftemplate menu "datos para los menus candidatos"
	(slot primero)
    (slot segundo)
    (slot postre)
    (slot id)
)

(deftemplate menuCena "datos para la cena"
	(slot plato)
    (slot postre)
    (slot calorias)
    (slot proteinas)
    (slot hidratos)
    (slot grasas)
    (slot id)
)

(deftemplate cena "datos para la cena"
	(slot plato)
    (slot postre)
    (slot calorias)
    (slot proteinas)
    (slot hidratos)
    (slot grasas)
    (slot contado)
    (slot asignado)
)

(deftemplate dieta "datos RESTANTES de la dieta"
	(slot calRestantes)
    (slot proteinas)
    (slot hidratos)
    (slot grasas)
)

(deftemplate necesidadesUsuario "datos de las necesidades del usuario"
	(slot calorias)
    (slot proteinas)
    (slot hidratos)
    (slot grasas)
)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;HECHOS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(deffacts Dieta
    (dieta (calRestantes 0) (proteinas 0) (hidratos 0) (grasas 0))
    ;con este hecho vamos almacenando las calorias, proteinas, hidratos y grasas que faltan por asignar
    ;con respecto a las necesidades recomendadas
)

(deffacts desayunos
    (platoDes (nombre "chocolate con churros") (calorias 479) (proteinas 9.5) (hidratos 50.9) (grasas 26.0) (id 1) )
    (platoDes (nombre "colacao y cereales con leche") (calorias 338) (proteinas 14.4) (hidratos 50.5) (grasas 8.3) (id 2))
    (platoDes (nombre "huevos revueltos con bacon y zumo de naranja") (calorias 447) (proteinas 17.1) (hidratos 30.1) (grasas 28.2) (id 3))
    (platoDes (nombre "bollería variada (croissant y donut) con cafe") (calorias 529) (proteinas 9.3) (hidratos 60.9) (grasas 26.9) (id 4))
    (platoDes (nombre "pan tostado con mantequilla y mermelada, acompañado con zumo de naranja y descafeinado con leche") (calorias 462) (proteinas 12.4) (hidratos 66.7) (grasas 15.2) (id 5))
	(platoDes (nombre "pan con tomate y aceite acompañado con cafe con leche") (calorias 374) (proteinas 12.4) (hidratos 48.5) (grasas 14.1) (id 6))
	(platoDes (nombre "sandwich mixto con zumo de naranja") (calorias 434) (proteinas 18.2) (hidratos 61.5) (grasas 11.9) (id 7))
	(platoDes (nombre "cafe con leche entera y galletas") (calorias 423) (proteinas 10.4) (hidratos 55.9) (grasas 17.1) (id 8))	
	(platoDes (nombre "yogur azucarado con muesli y melocoton") (calorias 329) (proteinas 8.9) (hidratos 53.5) (grasas 7.6) (id 9))
	(platoDes (nombre "crepes con caramelo y colacao") (calorias 414) (proteinas 14.1) (hidratos 67.7) (grasas 9.1) (id 10))
	(platoDes (nombre "copos de avena con colacao") (calorias 328) (proteinas 13.6) (hidratos 52.3) (grasas 7.2) (id 11))
    (platoDes (nombre "gofre con chocolate y nata") (calorias 456) (proteinas 7.8) (hidratos 53.1) (grasas 23.4) (id 12))
	(platoDes (nombre "brazo gitano con leche de soja") (calorias 408) (proteinas 7) (hidratos 57) (grasas 16.4) (id 13))
    (platoDes (nombre "galletas de calabaza y vainilla con zumo de melocotón") (calorias 477) (proteinas 3) (hidratos 114.4) (grasas 0.73) (id 14))
)

(deffacts cenas
    (menuCena (plato "puré de patata reconstituyente") (postre "fresas con nata") (calorias 493) (proteinas 10.8) (hidratos 81.2) (grasas 12.4) (id 1))
    (menuCena (plato "lasaña de carne con bechamel") (postre "pera") (calorias 471) (proteinas 19.4) (hidratos 42.5) (grasas 23.8) (id 2))
    (menuCena (plato "empanada de carne") (postre "piña") (calorias 466) (proteinas 33) (hidratos 21.6) (grasas 27.3) (id 3))
    (menuCena (plato "menestra de verduras con trocitos de pavo") (postre "cuajada con mermelada de frambuesa") (calorias 333) (proteinas 12.6) (hidratos 33.2) (grasas 15.9) (id 4))
    (menuCena (plato "judias verdes con taquitos de jamon, cebolla y aceite") (postre "queso de burgos con miel y nueces") (calorias 431) (proteinas 17.5) (hidratos 19.2) (grasas 30.6) (id 5))
	(menuCena (plato "coliflor gratinada con bechamel y queso") (postre "natillas de chocolate con galleta") (calorias 430) (proteinas 17.4) (hidratos 40.8) (grasas 21) (id 6))
	(menuCena (plato "ensaladilla rusa") (postre "mango") (calorias 358) (proteinas 8.8) (hidratos 18.1) (grasas 27.2) (id 7))
	(menuCena (plato "crema de calabaza patata y zanahoria") (postre "milhoja de nata y crema ") (calorias 387) (proteinas 7.9) (hidratos 47.7) (grasas 17.2) (id 8))
	(menuCena (plato "bocadillo de calamares y mahonesa") (postre "mandarina") (calorias 446) (proteinas 11.8) (hidratos 48.4) (grasas 21.9) (id 9))
	(menuCena (plato "dorada al horno") (postre "brocheta de kiwi, manzana y fresa con chocolate") (calorias 463) (proteinas 22.7) (hidratos 20.8) (grasas 31.8) (id 10))
	(menuCena (plato "sashimi de salmón,atún y dorada con ensalada de algas") (postre "strudel de cereza") (calorias 441) (proteinas 27.3) (hidratos 31.5) (grasas 23.1) (id 11))
    (menuCena (plato "salmón ahumado relleno de queso para untar, con ensalada de pimientos y pan tostado") (postre "gelatina de piña") (calorias 392) (proteinas 18.4) (hidratos 18.79) (grasas 20.3) (id 12))
    (menuCena (plato "pincho de tortilla") (postre "pan tostado con requeson") (calorias 411.6) (proteinas 9.2) (hidratos 45.3) (grasas 23.5) (id 13))
)

(deffacts platos "Alimentos y sus propiedades para una ración."
    /*PRIMEROS PLATOS*/
    ;altos en calorias
    (plato (nombre "migas") (tipoPlato primero) (calorias 474) (proteinas 11) (hidratos 28.5) (grasas 34.7) )  
    (plato (nombre "mariscada de (ostras, mejillones, gambas, buey y sepia con mahonesa)") (tipoPlato primero) (calorias 477.9) (proteinas 58.53) (hidratos 16.18) (grasas 18.3) )  
    (plato (nombre "Pulpo a la gallega") (tipoPlato primero) (calorias 467.9) (proteinas 60.7) (hidratos 20.5) (grasas 14.3) )
    (plato (nombre "cocido") (tipoPlato primero) (calorias 460) (proteinas 27.5) (hidratos 46.1) (grasas 14.9) )    
    (plato (nombre "arroz con(tortilla, jamon york, bacon, maiz, coco rallado y pasas)") (tipoPlato primero) (calorias 474) (proteinas 14.3) (hidratos 40.7) (grasas 27.3) )
	(plato (nombre "fritura variada (croquetas, empanadillas, san jacobos)") (tipoPlato primero) (calorias 441) (proteinas 6.7) (hidratos 41.1) (grasas 26.3) )
    (plato (nombre "embutido variado (salami, chorizo, longaniza, jamón serrano y queso semicurado)") (tipoPlato primero) (calorias 496) (proteinas 34.7) (hidratos 1.2) (grasas 39.1) )   
    (plato (nombre "aguacate relleno de gambas, atun, lechuga y mahonesa") (tipoPlato primero) (calorias 446) (proteinas 10.4) (hidratos 2.5) (grasas 42.7) )
    ;medios en calorias   
    (plato (nombre "macarrones a la boloñesa") (tipoPlato primero) (calorias 296) (proteinas 11.3) (hidratos 50.7) (grasas 4.4) )
    (plato (nombre "espinaca a la crema") (tipoPlato primero) (calorias 301) (proteinas 6.4) (hidratos 12.7) (grasas 24.2) )
    (plato (nombre "sopa castellana") (tipoPlato primero) (calorias 372) (proteinas 18.5) (hidratos 28.8) (grasas 19.8) )    (plato (nombre "pisto con huevo y pan") (tipoPlato primero) (calorias 324) (proteinas 12.4) (hidratos 38.5) (grasas 14.3) )
    (plato (nombre "lentejas") (tipoPlato primero) (calorias 375) (proteinas 19.2) (hidratos 30.5) (grasas 17.1) )
    (plato (nombre "ensalada de cuscus") (tipoPlato primero) (calorias 316) (proteinas 1.2) (hidratos 55) (grasas 11) )
    (plato (nombre "pudin de escalibada") (tipoPlato primero) (calorias 325) (proteinas 5.8) (hidratos 43.2) (grasas 14.3) )
    (plato (nombre "espirales de calabacin con pate de champiñones") (tipoPlato primero) (calorias 319) (proteinas 6.6) (hidratos 28) (grasas 18.7) )
  	;bajos en calorias
    (plato (nombre "guisantes con jamon") (tipoPlato primero) (calorias 246) (proteinas 21.3) (hidratos 24.8) (grasas 4.6) )         
    (plato (nombre "sopa de pollo con fideos") (tipoPlato primero) (calorias 243.8) (proteinas 16.) (hidratos 17.4) (grasas 19.12) )  
    (plato (nombre "ensalada de lechuga, tomate, atun y maiz") (tipoPlato primero) (calorias 143) (proteinas 8.9) (hidratos 5.3) (grasas 9.2) )
    (plato (nombre "gazpacho andaluz") (tipoPlato primero) (calorias 110) (proteinas 2.0) (hidratos 10.9) (grasas 6.0) )
    (plato (nombre "musaka") (tipoPlato primero) (calorias 226.7) (proteinas 6.4) (hidratos 38.9) (grasas 4.9) )  
    (plato (nombre "timbal de queso con confitura de setas") (tipoPlato primero) (calorias 217) (proteinas 1.61) (hidratos 20) (grasas 15.6) )
    (plato (nombre "pimientos rojos rellenos de verdura") (tipoPlato primero) (calorias 152.77) (proteinas 1.99) (hidratos 16.7) (grasas 9.27) )   
    (plato (nombre "parrillada de verduras") (tipoPlato primero) (calorias 105.25) (proteinas 2.4) (hidratos 10.8) (grasas 6.8) )  


    
    /*SEGUNDOS PLATOS*/
    ;altos en calorias
    (plato (nombre "muslos de pavo rellenos de mandarinas y ciruelas pasas") (tipoPlato segundo) (calorias 530) (proteinas 43.2) (hidratos 36.88) (grasas 24.4) )
    (plato (nombre "albondigas en salsa con pan") (tipoPlato segundo) (calorias 433) (proteinas 18.4) (hidratos 38.9) (grasas 20) )
    (plato (nombre "calamares en su tinta con pan") (tipoPlato segundo) (calorias 437) (proteinas 50) (hidratos 29.9) (grasas 12.55) )              
    (plato (nombre "huevos fritos con patatas, ketchup y mahonesa") (tipoPlato segundo) (calorias 421) (proteinas 16.3) (hidratos 26.3) (grasas 33) )
    (plato (nombre "Lenguado frito con lombarda frita") (tipoPlato segundo) (calorias 372) (proteinas 41.8) (hidratos 7.1) (grasas 18.9) )
    (plato (nombre "pizza margarita") (tipoPlato segundo) (calorias 390) (proteinas 16.4) (hidratos 44.4) (grasas 15.6) )
    (plato (nombre "cabrito con patatas y ensalada") (tipoPlato segundo) (calorias 425) (proteinas 24.7) (hidratos 17.4) (grasas 27.8) )
    ;medios en calorias 
    (plato (nombre "hamburguesa clásica") (tipoPlato segundo) (calorias 334) (proteinas 22.1) (hidratos 12.2) (grasas 21.6) )          
    (plato (nombre "atún con salteado de setas") (tipoPlato segundo) (calorias 353) (proteinas 25.8) (hidratos 0.43) (grasas 27.1) )
    (plato (nombre "filete de ternera con lechuga y tomate") (tipoPlato segundo) (calorias 304) (proteinas 28.8) (hidratos 2.2) (grasas 19.7) )
	(plato (nombre "carpaccio de ternera con copos de queso") (tipoPlato segundo) (calorias 290) (proteinas 41.1) (hidratos 0.15) (grasas 14) )
    (plato (nombre "berenjenas rellenas") (tipoPlato segundo) (calorias 356) (proteinas 6.2) (hidratos 33.5) (grasas 22) )
    (plato (nombre "lenguado empanado con salsa de yogur") (calorias 377) (proteinas 17.7) (hidratos 14.9) (grasas 27) )    
    (plato (nombre "rodaballo con patatas panaderas") (tipoPlato segundo) (calorias 296) (proteinas 17.2) (hidratos 6.6) (grasas 21.9) )
    ;bajos en calorias
    (plato (nombre "merluza con salteado de esparragos y gambas") (tipoPlato segundo) (calorias 233) (proteinas 25.6) (hidratos 1.8) (grasas 13.5) )
    (plato (nombre "pechuga de pollo al curry") (tipoPlato segundo) (calorias 180) (proteinas 24.4) (hidratos 2) (grasas 8.2) )
    (plato (nombre "emperador con ensalada") (tipoPlato segundo) (calorias 171) (proteinas 22.1) (hidratos 0.72) (grasas 8.8) )
    (plato (nombre "pierna de cordero con patatas fritas") (tipoPlato segundo) (calorias 376) (proteinas 21.8) (hidratos 7.1) (grasas 28.7) )
    (plato (nombre "quiche de calabacin") (tipoPlato segundo) (calorias 210.8) (proteinas 7.6) (hidratos 22.6) (grasas 10.2) )
    (plato (nombre "rollo de carne y verduras") (tipoPlato segundo) (calorias 196) (proteinas 29.6) (hidratos 13.4) (grasas 2.7) )
    (plato (nombre "espárragos empanados") (tipoPlato segundo) (calorias 109.1) (proteinas 1.9) (hidratos 21.9) (grasas 1.5) )   
    
    
    
    /*POSTRES*/
    ;altos en calorias
    (plato (nombre "bizcocho") (tipoPlato postre) (calorias 280) (proteinas 3.6) (hidratos 30.4) (grasas 15.8) )
    (plato (nombre "buñuelos de manzana") (calorias 360) (proteinas 0.7) (hidratos 67) (grasas 13) )
    (plato (nombre "pastel de manzana con hojaldre") (calorias 349) (proteinas 3.2) (hidratos 48.4) (grasas 16.2) )
    (plato (nombre "flan patissier") (calorias 443) (proteinas 9) (hidratos 68) (grasas 14.4) )   
    (plato (nombre "pudding de mandarina") (calorias 600) (proteinas 1.27) (hidratos 93.3) (grasas 25.55) )
    (plato (nombre "torrijas") (calorias 406) (proteinas 2.48) (hidratos 58.3) (grasas 17.9) )
    (plato (nombre "bolas de zanahoria y coco") (calorias 550) (proteinas 4.7) (hidratos 62.3) (grasas 31.4) )
    ;medios en calorias
    (plato (nombre "puding de pasas") (tipoPlato postre) (calorias 181) (proteinas 2.8) (hidratos 28.3) (grasas 5.8) )
    (plato (nombre "pastel de chocolate") (tipoPlato postre) (calorias 266) (proteinas 3.1) (hidratos 25.1) (grasas 16.7) )
    (plato (nombre "batido de fresa con nata montada") (calorias 226) (proteinas 6.3) (hidratos 23.4) (grasas 11.5) )
    (plato (nombre "milhoja de membrillo y manzana") (calorias 192.53) (proteinas 0.6) (hidratos 43.28) (grasas 3.3) )
    (plato (nombre "crema catalana") (calorias 206) (proteinas 7.4) (hidratos 31) (grasas 5.8) )
    (plato (nombre "pastel de queso y fresa") (calorias 167) (proteinas 8.3) (hidratos 15.9) (grasas 7.9) ) 
    (plato (nombre "yogur helado con sabor a cacao") (calorias 224.22) (proteinas 4.96) (hidratos 38.02) (grasas 6.54) )   
    (plato (nombre "crema blanca confruta del tiempo") (calorias 255.9) (proteinas 1.3) (hidratos 55.7) (grasas 3.1) )
    ;bajos en calorias
    (plato (nombre "plátano") (tipoPlato postre) (calorias 125) (proteinas 1.4) (hidratos 27.5) (grasas 0.36) )
    (plato (nombre "flan de vainilla") (tipoPlato postre) (calorias 122) (proteinas 3) (hidratos 23.9) (grasas 1.6) )
	(plato (nombre "manzana") (tipoPlato postre) (calorias 96.3) (proteinas 0.56) (hidratos 20.3) (grasas 0.64) )
    (plato (nombre "naranja") (tipoPlato postre) (calorias 63.7) (proteinas 1.2) (hidratos 12.5) (grasas 0.28) )  
    (plato (nombre "arroz con leche") (calorias 129) (proteinas 3) (hidratos 25.6) (grasas 1) )
    (plato (nombre "helado") (tipoPlato postre) (calorias 106) (proteinas 2.4) (hidratos 12.6) (grasas 5.2) )      
    (plato (nombre "macedonia de frutas en almíbar") (tipoPlato postre) (calorias 61.7) (proteinas 0.56) (hidratos 14.2) (grasas 0.09) )
    (plato (nombre "yogur de sabores") (tipoPlato postre) (calorias 91.2) (proteinas 4.3) (hidratos 12.5) (grasas 2.7) )     
)

(deffacts comidas "Cena fija. Los valores son para una racion."
	(desayuno (plato no) (calorias 0) (proteinas 0) (hidratos 0) (grasas 0) (contado no) (asignado no))
    (comida (primero no) (segundo no) (postre no) (calorias 0) (id 0))
    (cena (plato no) (postre no) (calorias 0) (proteinas 0) (hidratos 0) (grasas no) (contado no) (asignado no))
)

(deffacts Usuario "Datos del usuario"
    (necesidadesUsuario (calorias 0) (proteinas 0) (hidratos 0) (grasas 0))
    ;con este hecho guardamos los valores necesarios (recomendados) de calorias y nutrientes para el usuario
)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;MODULO QUE ASIGNA EL DESAYUNO Y LA CENA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmodule asignaOtrasComidas)


(defrule eligeAleatorios "inicializa la elección"
	=>
    (assert (desayunoAleatorio (aleatorio 10)))
    (assert (cenaAleatoria (aleatorio 10)))
)

(defrule eligeDesayuno 
    ?desayuno <- (desayuno (contado no) (asignado no))
    (platoDes (nombre ?nombre) (calorias ?calorias) (proteinas ?proteinas) (hidratos ?hidratos) (grasas ?grasas) (id ?id))
    (desayunoAleatorio ?num)
    (test (eq ?num ?id))
	=>    
    (modify ?desayuno (plato ?nombre) (calorias ?calorias) (proteinas ?proteinas) (hidratos ?hidratos) (grasas ?grasas) (asignado si))
)

(defrule eligeCena
    ?cena <- (cena (contado no) (asignado no))
    (menuCena (plato ?nombre) (postre ?postre) (calorias ?calorias) (proteinas ?proteinas) (hidratos ?hidratos) (grasas ?grasas) (id ?id))
    (cenaAleatoria ?num)
    (test (eq ?num ?id))
	=>    
    (modify ?cena (plato ?nombre) (postre ?postre) (calorias ?calorias) (proteinas ?proteinas) (hidratos ?hidratos) (grasas ?grasas) (asignado si))
)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;MODULO QUE CALCULA LAS CALORIAS NECESARIAS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmodule necesidades)


(deffunction calculaCalorias (?peso ?altura ?edad ?sexo ?actividadFisica)
	(if (= ?sexo h) then (bind ?resultado (* (- (+ 66 (* 13.7 ?peso) (* 5 ?altura)) (* 6.8 ?edad)) ?actividadFisica))
	else (bind ?resultado (* (- (+ 665 (* 9.6 ?peso) (* 1.8 ?altura)) (* 4.7 ?edad)) ?actividadFisica)))
	(return ?resultado)        
    ;ecuación Harris-Benedict
)

(deffunction calculaIMC (?peso ?altura)
	(bind ?resultado (/ ?peso (** (/ ?altura 100) 2) )  )
	(return ?resultado)
    ;ecuación Harris-Benedict
)

(deffunction calculaProteinas (?calorias)
	(return (/ (* ?calorias 0.3) 4))       
    ;Las proteínas ocupan el 30% de las calorias y
    ;cada gramo de proteina son 4 calorias.
)

(deffunction calculaHidratos (?calorias)
	(return (/ (* ?calorias 0.4) 4))       
    ;Los hidratos ocupan el 40% de las calorias y
    ;cada gramo de hidratos son 4 calorias.
)

(deffunction calculaGrasas (?calorias)
	(return (/ (* ?calorias 0.3) 9))       
    ;Las grasas ocupan el 30% de las calorias y
    ;cada gramo de grasa son 9 calorias.
)

(defrule consideraComidasFijas "Resta a las calorias y nutrientes recomendadas las calorias y nutrientes del desayuno y la cena, que son fijas"
    ?desayuno <- (desayuno (plato ?platoDesayuno) (calorias ?calDesayuno) (proteinas ?proDesayuno) (hidratos ?hidraDesayuno) (grasas ?graDesayuno) (contado no))
    ?cena <- (cena (plato ?platoCena) (calorias ?calCena) (proteinas ?proCena) (hidratos ?hidraCena) (grasas ?graCena) (contado no))
    ?Restantes <- (dieta (calRestantes ?calRestantes) (proteinas ?proteinas) (hidratos ?hidratos) (grasas ?grasas))
	=>  
    (modify ?Restantes (calRestantes (- ?calRestantes (+ ?calDesayuno ?calCena))) 
        						(proteinas (round (- ?proteinas (+ ?proCena ?proDesayuno)))) 
        						(hidratos (round (- ?hidratos (+ ?hidraCena ?hidraDesayuno)))) 
        						(grasas (round(- ?grasas (+ ?graCena ?graDesayuno)))) )
    (modify ?desayuno (contado si))
    (modify ?cena (contado si))
    
)

(defrule caloriasRecomendadas "Mostrar el calculo de calorias y calcular los valores de nutrientes"
    ?usuario <- (usuario (edad ?edad) (sexo ?sexo) (altura ?altura) (peso ?peso) (actividadFisica ?actividadFisica))
    ?necesidades <- (necesidadesUsuario (calorias ?calorias) (proteinas 0) (hidratos 0) (grasas 0))
    ?caloriasRestantes <- (dieta (calRestantes ?calRestantes))
    (not (usada reglaDiarias))
    =>
    (bind ?calRestantes (round (calculaCalorias ?peso ?altura ?edad ?sexo ?actividadFisica)))
    (modify ?caloriasRestantes (calRestantes ?calRestantes) (proteinas (round (calculaProteinas ?calRestantes))) (hidratos (round(calculaHidratos ?calRestantes))) (grasas (round (calculaGrasas ?calRestantes))))
    (modify ?necesidades (calorias ?calRestantes) (proteinas (round (calculaProteinas ?calRestantes))) (hidratos (round (calculaHidratos ?calRestantes))) (grasas (round(calculaGrasas ?calRestantes))))
    (bind ?imc (round (calculaIMC ?peso ?altura)))
    (modify ?usuario (imc ?imc))
    (store caloriasRecomendadas ?calRestantes)
    (store imc ?imc)
    (assert (usada reglaDiarias))
)





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;MODULO QUE RECOMIENDA PLATOS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmodule recomendaciones)


(defrule candidatosMenu "Regla que busca menus candidatos"
    ?menu <- (comida (primero no) (segundo no) (postre no) (calorias ?calComida) (id ?id))
    (usuario  (peso ?peso)(imc ?imc))
    (desayuno (calorias ?calDesayuno) (proteinas ?proDesayuno) (hidratos ?hidraDesayuno) (grasas ?graDesayuno))
    (cena (calorias ?calCena) (proteinas ?proCena) (hidratos ?hidraCena) (grasas ?graCena))
    (necesidadesUsuario (calorias ?calNecesarias) (proteinas ?proNecesarias) (hidratos ?hidraNecesarios) (grasas ?graNecesarias))
    (plato (nombre ?nombrePlato1) (tipoPlato primero) (calorias ?calPlato1) (proteinas ?proteinas1) (hidratos ?hidratos1) (grasas ?grasas1) )
    (plato (nombre ?nombrePlato2) (tipoPlato segundo) (calorias ?calPlato2) (proteinas ?proteinas2) (hidratos ?hidratos2) (grasas ?grasas2) )
    (plato (nombre ?nombrePlato3) (tipoPlato postre) (calorias ?calPlato3) (proteinas ?proteinas3) (hidratos ?hidratos3) (grasas ?grasas3) )
    ?caloriasRestantes <- (dieta (calRestantes ?calRestantes) (proteinas ?proteinasRestantes) (hidratos ?hidratosRestantes) (grasas ?grasasRestantes))
    (test (< (+ ?calPlato1 ?calPlato2 ?calPlato3 ?calCena ?calDesayuno) (* ?calNecesarias 1.10)))
    (test (> (+ ?calPlato1 ?calPlato2 ?calPlato3 ?calCena ?calDesayuno) (* ?calNecesarias 0.90)))
    (test (> (+ ?proteinas1 ?proteinas2 ?proteinas3 ?proCena ?proDesayuno) (* ?peso 0.75)))
    (test (> (+ ?hidratos1 ?hidratos2 ?hidratos3 ?hidraCena ?hidraDesayuno) (* ?hidraNecesarios 0.7)))
    (test (< (+ ?grasas1 ?grasas2 ?grasas3 ?graCena ?graDesayuno) (* ?graNecesarias 1.3)))
    =>
    (bind ?*numCandidatos* (+ ?*numCandidatos* 1))
    (assert (menu (primero ?nombrePlato1) (segundo ?nombrePlato2) (postre ?nombrePlato3) (id ?*numCandidatos*)))
)

(defrule IMCBajo "Regla que comprueba si el IMC está por debajo de lo normal"
    (usuario (imc ?imc))
    (test (< ?imc 18.5))
    ?calorias <- (necesidadesUsuario (calorias ?cal))
    (not (usada imcbajo))
	=>
    (modify ?calorias (calorias (* ?cal 1.15)))
    (assert (usada imcbajo))
)

(defrule IMCAlto "Regla que comprueba si el IMC está por debajo de lo normal"
    (usuario (imc ?imc))
    (test (> ?imc 23))
    ?calorias <- (necesidadesUsuario (calorias ?cal))
    (not (usada imcalto))
	=>
    (modify ?calorias (calorias (* ?cal 0.85)))
    (assert (usada imcalto))
)

(defrule fin
    =>
    (assert (numMenus ?*numCandidatos*))
)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;MODULO QUE ASIGNA A LA COMIDA UN MENU DE LOS CANDIDATOS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmodule asignacion) 


(deffunction aleatorio (?numPlatos)
  (return (+ (mod (random) ?numPlatos) 1))
)

(defrule comienza "inicializa la elección"
    (recomendaciones::numMenus ?n)
    (test (> ?n 0))
	=>
    (assert (numaleatorio (aleatorio ?*numCandidatos*))))

(defrule asignaMenu "Regla que asigna un menu de entre los posibles candidatos"
    ?comida <- (comida (primero no) (segundo no) (postre no) (calorias ?calComida) (id ?idComida))
    (plato (nombre ?nombrePlato1) (tipoPlato primero) (calorias ?calPlato1) (proteinas ?proteinas1) (hidratos ?hidratos1) (grasas ?grasas1) )
    (plato (nombre ?nombrePlato2) (tipoPlato segundo) (calorias ?calPlato2) (proteinas ?proteinas2) (hidratos ?hidratos2) (grasas ?grasas2) )
    (plato (nombre ?nombrePlato3) (tipoPlato postre) (calorias ?calPlato3) (proteinas ?proteinas3) (hidratos ?hidratos3) (grasas ?grasas3) )
    ?caloriasRestantes <- (dieta (calRestantes ?calRestantes) (proteinas ?proteinasRestantes) (hidratos ?hidratosRestantes) (grasas ?grasasRestantes))
    ?menu <- (menu (primero ?nombrePlato1) (segundo ?nombrePlato2) (postre ?nombrePlato3) (id ?id))
    (numaleatorio ?id)
	=>    
    (modify ?caloriasRestantes (calRestantes (- ?calRestantes (+ ?calPlato1 ?calPlato2 ?calPlato3))) 
        						(proteinas (- ?proteinasRestantes (+ ?proteinas1 ?proteinas2 ?proteinas3)))
        						(hidratos (- ?hidratosRestantes (+ ?hidratos1 ?hidratos2 ?hidratos3)))
        						(grasas (- ?grasasRestantes (+ ?grasas1 ?grasas2 ?grasas3))))
    (modify ?comida (primero ?nombrePlato1) (segundo ?nombrePlato2) (postre ?nombrePlato3) (calorias (+ ?calPlato1 ?calPlato2 ?calPlato3)) (id ?id))
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;MODULO QUE MUESTRA POR PANTALLA LOS DATOS FINALES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmodule impresionDatos)


(defrule muestraDieta "Regla para mostrar la dieta del dia (sólo si se ha conseguido un menu que cumpla las condiciones óptimas)"
    (desayuno (plato ?desayuno) (calorias ?calDesayuno))
    (comida (primero ?primero) (segundo ?segundo) (postre ?postre) (calorias ?calComida))
    (cena (plato ?cena) (postre ?postreCena) (calorias ?calCena))
    (test (neq ?primero no))
    (test (neq ?segundo no))
    (test (neq ?postre no))
=>
    (store desayuno ?desayuno)  
    (store primero ?primero)
    (store segundo ?segundo)
    (store postre ?postre)
    (store cena ?cena)
    (store postreCena ?postreCena)
    (store caloriasConsumidas (round (+ ?calDesayuno ?calComida ?calCena)))
)

(defrule muestraError "Regla para mostrar ERROR"
    (recomendaciones::numMenus 0)
=>
    (store error "true")
)

