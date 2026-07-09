Proceso ReservaCine
	Definir FILAS, COLUMNAS, PRECIO_GENERAL, PRECIO_PREFERENCIAL, totalRecaudado Como Entero;
	FILAS <- 7;
	COLUMNAS <- 4;
	PRECIO_GENERAL <- 10000;
	PRECIO_PREFERENCIAL <- 20000;
	totalRecaudado <- 0;
	Definir sillas Como Entero;
	Dimensionar sillas(FILAS,COLUMNAS);
	Definir f, c Como Entero;
	Para f<-0 Hasta FILAS-1 Con Paso 1 Hacer
		Para c<-0 Hasta COLUMNAS-1 Con Paso 1 Hacer
			sillas[f,c]<-0;
		FinPara
	FinPara
	Definir parar Como Lógico;
	parar <- Falso;
	Definir opc Como Entero;
	Mientras  NO parar Hacer
		mostrar_menu_principal('');
		Escribir 'Seleccione una opción (1-5): ';
		Leer opc;
		Si opc==1 Entonces
			mostrar_sala(PRECIO_GENERAL,PRECIO_PREFERENCIAL,FILAS,COLUMNAS,sillas);
		SiNo
			Si opc==2 Entonces
				hacer_reserva(sillas,PRECIO_GENERAL,PRECIO_PREFERENCIAL,FILAS,COLUMNAS);
			SiNo
				Si opc==3 Entonces
					cancelar_reserva(sillas,PRECIO_GENERAL,PRECIO_PREFERENCIAL,FILAS,COLUMNAS);
				SiNo
					Si opc==4 Entonces
						mostrar_total_recaudado(sillas,FILAS,COLUMNAS,PRECIO_GENERAL,PRECIO_PREFERENCIAL);
					SiNo
						Si opc==5 Entonces
							Escribir '¡Gracias por usar el sistema! Hasta luego.';
							parar <- Verdadero;
						SiNo
							Escribir 'Opción inválida. Intente nuevamente.';
						FinSi
					FinSi
				FinSi
			FinSi
		FinSi
	FinMientras
FinProceso

SubAlgoritmo mostrar_menu_principal (arg)
	Escribir 'SISTEMA DE RESERVA DE CINE';
	Escribir '1. Ver estado de la sala';
	Escribir '2. Hacer reserva';
	Escribir '3. Cancelar reserva';
	Escribir '4. Ver total recaudado';
	Escribir '5. Salir';
FinSubAlgoritmo

SubAlgoritmo mostrar_sala (_precioGeneral,_precioPreferencial,_filas,_columnas,_sillas)
	Escribir 'ESTADO DE LA SALA DE CINE';
	Escribir 'Leyenda: 0=Libre  |  1=Reservada';
	Escribir 'Sillas Generales (filas 0-3): $', _precioGeneral;
	Escribir 'Sillas Preferenciales (filas 4-6): $', _precioPreferencial;
	Escribir '    Col 0    Col 1    Col 2    Col 3';
	Definir tipo, fila Como Cadena;
	Definir f, c Como Entero;
	Para f<-0 Hasta _filas-1 Con Paso 1 Hacer
		Si f<=3 Entonces
			tipo <- 'GENERAL';
		SiNo
			tipo <- 'PREFERENCIAL';
		FinSi
		fila <- 'Fila '+ConvertirATexto(f)+'('+tipo+') ';
		Para c<-0 Hasta _columnas-1 Con Paso 1 Hacer
			fila <- fila+' ['+ConvertirATexto(_sillas[f,c])+']';
		FinPara
		Escribir fila;
	FinPara
FinSubAlgoritmo

SubAlgoritmo hacer_reserva (_sillas,_precioGeneral,_precioPreferencial,_filas,_columnas)
	Escribir 'HACER RESERVA';
	mostrar_sala(_precioGeneral,_precioPreferencial,_filas,_columnas,_sillas);
	Definir numSillas, total_reserva Como Entero;
	total_reserva <- 0;
	Escribir '¿Cuántas sillas desea reservar? ';
	Leer numSillas;
	Definir sillasReservadas Como Cadena;
	Dimensionar sillasReservadas(numSillas);
	Si numSillas<=0 Entonces
		Escribir 'Ingrese una cantidad válida.';
	SiNo
		Definir i, f, c, precio Como Entero;
		Definir tipo Como Cadena;
		Para i<-0 Hasta numSillas-1 Con Paso 1 Hacer
			Escribir 'Silla: ', i+1;
			Escribir 'Ingrese número de fila (0-6): ';
			Leer f;
			Escribir 'Ingrese número de columna (0-3): ';
			Leer c;
			Si 0<=f Y f<_filas Entonces
				Si 0<=c Y c<_columnas Entonces
					Si _sillas[f,c]==1 Entonces
						Escribir 'Esta silla ya está reservada.';
					SiNo
						_sillas[f,c]<-1;
						precio <- obtener_precio_silla(f,_precioGeneral,_precioPreferencial);
						tipo <- obtener_tipo_silla(f);
						sillasReservadas[i] <- 'Silla reservada - Fila '+ConvertirATexto(f)+', Columna '+ConvertirATexto(c)+' - '+tipo+' ($'+ConvertirATexto(precio)+')';
						total_reserva <- total_reserva+precio;
					FinSi
				SiNo
					Escribir 'Columna fuera de rango';
				FinSi
			SiNo
				Escribir 'Fila fuera de rango';
			FinSi
		FinPara
	FinSi
	Escribir 'RESUMEN DE RESERVA';
	Definir j Como Entero;
	Para j<-0 Hasta numSillas-1 Con Paso 1 Hacer
		Escribir sillasReservadas[j];
	FinPara
	Escribir 'TOTAL A PAGAR: ', total_reserva;
FinSubAlgoritmo

SubAlgoritmo cancelar_reserva (_sillas,_precioGeneral,_precioPreferencial,_filas,_columnas)
	Definir f, c, precio Como Entero;
	Definir tipo Como Cadena;
	Escribir 'CANCELAR RESERVA';
	Escribir 'Ingrese número de fila de la silla (0-6): ';
	Leer f;
	Escribir 'Ingrese número de columna de la silla (0-3): ';
	Leer c;
	Si 0<=f Y f<_filas Entonces
		Si 0<=c Y c<_columnas Entonces
			Si _sillas[f,c]==1 Entonces
				_sillas[f,c]<-0;
				tipo <- obtener_tipo_silla(f);
				precio <- obtener_precio_silla(f,_precioGeneral,_precioPreferencial);
				Escribir 'Reserva cancelada - Fila ', f, ', Columna ', c, ' - ', tipo;
				Escribir 'Reembolso: $', precio;
			SiNo
				Escribir 'Esta silla no está reservada.';
			FinSi
		SiNo
			Escribir 'Columna fuera de rango';
		FinSi
	SiNo
		Escribir 'Fila fuera de rango';
	FinSi
FinSubAlgoritmo

SubAlgoritmo mostrar_total_recaudado (_sillas,_filas,_columnas,_precioGeneral,_precioPreferencial)
	Definir totalRecaudado, f, c Como Entero;
	totalRecaudado <- 0;
	Para f<-0 Hasta _filas-1 Con Paso 1 Hacer
		Para c<-0 Hasta _columnas-1 Con Paso 1 Hacer
			Si _sillas[f,c]<>0 Entonces
				totalRecaudado <- totalRecaudado+obtener_precio_silla(f,_precioGeneral,_precioPreferencial);
			FinSi
		FinPara
	FinPara
	Escribir 'TOTAL RECAUDADO POR RESERVAS';
	Escribir 'Total recaudado actual: $', totalRecaudado;
FinSubAlgoritmo

SubAlgoritmo tipoSilla <- obtener_tipo_silla (fila)
	Definir tipoSilla Como Cadena;
	Si fila<=3 Entonces
		tipoSilla <- 'General';
	SiNo
		tipoSilla <- 'Preferencial';
	FinSi
FinSubAlgoritmo

SubAlgoritmo precioSilla <- obtener_precio_silla (fila,_precioGeneral,_precioPreferencial)
	Definir precioSilla Como Entero;
	Si fila<=3 Entonces
		precioSilla <- _precioGeneral;
	SiNo
		precioSilla <- _precioPreferencial;
	FinSi
FinSubAlgoritmo
