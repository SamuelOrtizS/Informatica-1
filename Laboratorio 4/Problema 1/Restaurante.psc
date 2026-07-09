Proceso Restaurante
	Definir NOMBRE_RESTAURANTE, DIRECCION Como Cadena;
	NOMBRE_RESTAURANTE <- 'Las delicias de Juan';
	DIRECCION <- 'Avenida 6 con Calle 20';
	Definir parar Como Lógico;
	parar <- Falso;
	Definir opc Como Entero;
	Definir DIAS_SEMANA Como Cadena;
	Dimensionar DIAS_SEMANA(7);
	DIAS_SEMANA[0] <- 'Lunes';
	DIAS_SEMANA[1] <- 'Martes';
	DIAS_SEMANA[2] <- 'Miércoles';
	DIAS_SEMANA[3] <- 'Jueves';
	DIAS_SEMANA[4] <- 'Viernes';
	DIAS_SEMANA[5] <- 'Sabado';
	DIAS_SEMANA[6] <- 'Domingo';
	Definir menu_semana Como Cadena;
	Dimensionar menu_semana(7);
	menu_semana[0] <- '';
	menu_semana[1] <- '';
	menu_semana[2] <- '';
	menu_semana[3] <- '';
	menu_semana[4] <- '';
	menu_semana[5] <- '';
	menu_semana[6] <- '';
	Mientras  NO parar Hacer
		mostrar_menu_principal(NOMBRE_RESTAURANTE);
		Escribir 'Seleccione una opción (1-6): ';
		Leer opc;
		Si opc==1 Entonces
			guardar_menu(DIAS_SEMANA,menu_semana);
		SiNo
			Si opc==2 Entonces
				consultar_por_dia(DIAS_SEMANA,menu_semana);
			SiNo
				Si opc==3 Entonces
					consultar_por_menu(DIAS_SEMANA,menu_semana);
				SiNo
					Si opc==4 Entonces
						mostrar_informacion(NOMBRE_RESTAURANTE,DIRECCION);
					SiNo
						Si opc==5 Entonces
							mostrar_semana_completa(DIAS_SEMANA,menu_semana);
						SiNo
							Si opc==6 Entonces
								Escribir '\n¡Gracias por usar el sistema! Hasta luego.';
								parar <- Verdadero;
							SiNo
								Escribir 'Opción inválida. Intente nuevamente.';
							FinSi
						FinSi
					FinSi
				FinSi
			FinSi
		FinSi
	FinMientras
FinProceso

SubAlgoritmo mostrar_menu_principal (_nombre)
	Escribir 'SISTEMA DE MENÚ ', _nombre;
	Escribir '1. Guardar menú para un día';
	Escribir '2. Consultar menú por número de día';
	Escribir '3. Consultar día por nombre de menú';
	Escribir '4. Mostrar información del restaurante';
	Escribir '5. Mostrar todos los menús de la semana';
	Escribir '6. Salir';
FinSubAlgoritmo

SubAlgoritmo guardar_menu (_arregloDias,_arregloMenu)
	Definir dia Como Entero;
	Definir menu Como Cadena;
	Escribir 'Días de la semana:';
	Definir i Como Entero;
	Para i<-0 Hasta 6 Con Paso 1 Hacer
		Escribir i, ':', _arregloDias[i];
	FinPara
	Escribir 'Ingrese el número del día (0-6): ';
	Leer dia;
	Si 0<=dia Y dia<=6 Entonces
		Escribir 'Ingrese el nombre del menú para ', _arregloDias[dia];
		Leer menu;
		_arregloMenu[dia] <- menu;
		Escribir 'Menú guardado correctamente para ', _arregloDias[dia];
	SiNo
		Escribir 'Número de día inválido. Intente nuevamente.';
	FinSi
FinSubAlgoritmo

SubAlgoritmo consultar_por_dia (_arregloDias,_arregloMenu)
	Definir dia Como Entero;
	Definir menu Como Cadena;
	Escribir 'Días de la semana:';
	Definir i Como Entero;
	Para i<-0 Hasta 6 Con Paso 1 Hacer
		Escribir i, ':', _arregloDias[i];
	FinPara
	Escribir 'Ingrese el número del día (0-6): ';
	Leer dia;
	Si 0<=dia Y dia<=6 Entonces
		Si _arregloMenu[dia]<>'' Entonces
			Escribir 'El ', _arregloDias[dia], ' se prepara: ', _arregloMenu[dia];
		SiNo
			Escribir 'No hay menu registrado para ', _arregloDias[dia];
		FinSi
	SiNo
		Escribir 'Número de día inválido. Intente nuevamente.';
	FinSi
FinSubAlgoritmo

SubAlgoritmo consultar_por_menu (_arregloDias,_arregloMenu)
	Definir menu_buscado Como Cadena;
	Definir encontrado Como Lógico;
	Escribir 'Ingrese el nombre del menú a buscar: ';
	Leer menu_buscado;
	encontrado <- Falso;
	Definir i Como Entero;
	Para i<-0 Hasta 6 Con Paso 1 Hacer
		Si _arregloMenu[i]==menu_buscado Entonces
			encontrado <- Verdadero;
			Escribir 'El menú ', _arregloMenu[i], ' se prepara el ', _arregloDias[i];
		FinSi
	FinPara
	Si  NO encontrado Entonces
		Escribir 'El menú ', menu_buscado, ' no está registrado en la semana.';
	FinSi
FinSubAlgoritmo

SubAlgoritmo mostrar_informacion (_nombre,_direccion)
	Escribir 'INFORMACIÓN DEL RESTAURANTE';
	Escribir 'Nombre: ', _nombre;
	Escribir 'Dirección: ', _direccion;
FinSubAlgoritmo

SubAlgoritmo mostrar_semana_completa (_arregloDias,_arregloMenu)
	Escribir 'MENÚ DE LA SEMANA';
	Definir i Como Entero;
	Para i<-0 Hasta 6 Con Paso 1 Hacer
		Si _arregloMenu[i]<>'' Entonces
			Escribir _arregloDias[i], ': ', _arregloMenu[i];
		SiNo
			Escribir _arregloDias[i], ': Sin menú registrado';
		FinSi
	FinPara
FinSubAlgoritmo
