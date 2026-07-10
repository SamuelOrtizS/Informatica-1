Proceso ReservaCine
	Definir FILAS, COLUMNAS, PRECIO_GENERAL, PRECIO_PREFERENCIAL Como Entero;
	FILAS <- 7;
	COLUMNAS <- 4;
	PRECIO_GENERAL <- 10000;
	PRECIO_PREFERENCIAL <- 20000;

	Definir sala1, sala2 Como Entero;
	Dimension sala1(FILAS, COLUMNAS);
	Dimension sala2(FILAS, COLUMNAS);

	Definir f, c Como Entero;
	Para f <- 1 Hasta FILAS Con Paso 1 Hacer
		Para c <- 1 Hasta COLUMNAS Con Paso 1 Hacer
			sala1[f,c] <- 0;
			sala2[f,c] <- 0;
		FinPara
	FinPara

	Definir salaActual, opcion, nuevaSala Como Entero;
	Definir parar Como Logico;
	parar <- Falso;
	salaActual <- 0;

	Mientras NO parar Hacer
		mostrar_menu_principal(salaActual);
		Escribir 'Seleccione una opcion (1-6): ';
		Leer opcion;

		Segun opcion Hacer
			1:
				Si salaActual = 0 Entonces
					mostrar_sala(sala1, salaActual + 1, PRECIO_GENERAL, PRECIO_PREFERENCIAL, FILAS, COLUMNAS);
				SiNo
					mostrar_sala(sala2, salaActual + 1, PRECIO_GENERAL, PRECIO_PREFERENCIAL, FILAS, COLUMNAS);
				FinSi
			2:
				Si salaActual = 0 Entonces
					hacer_reserva(sala1, salaActual + 1, PRECIO_GENERAL, PRECIO_PREFERENCIAL, FILAS, COLUMNAS);
				SiNo
					hacer_reserva(sala2, salaActual + 1, PRECIO_GENERAL, PRECIO_PREFERENCIAL, FILAS, COLUMNAS);
				FinSi
			3:
				Si salaActual = 0 Entonces
					cancelar_reserva(sala1, salaActual + 1, PRECIO_GENERAL, PRECIO_PREFERENCIAL, FILAS, COLUMNAS);
				SiNo
					cancelar_reserva(sala2, salaActual + 1, PRECIO_GENERAL, PRECIO_PREFERENCIAL, FILAS, COLUMNAS);
				FinSi
			4:
				mostrar_total_recaudado(sala1, sala2, FILAS, COLUMNAS, PRECIO_GENERAL, PRECIO_PREFERENCIAL);
			5:
				nuevaSala <- seleccionar_sala(_arg);
				Si nuevaSala <> -1 Entonces
					salaActual <- nuevaSala;
				FinSi
			6:
				Escribir 'Gracias por usar el sistema! Hasta luego.';
				parar <- Verdadero;
			De Otro Modo:
				Escribir 'Opcion invalida. Intente nuevamente.';
			FinSegun
	FinMientras
FinProceso

SubAlgoritmo mostrar_menu_principal (salaActual)
	Escribir '';
	Escribir '==================================================';
	Escribir '    SISTEMA DE RESERVA DE CINE';
	Escribir '==================================================';
	Escribir 'Sala actual: ', salaActual + 1;
	Escribir '1. Ver estado de la sala';
	Escribir '2. Hacer reserva';
	Escribir '3. Cancelar reserva';
	Escribir '4. Ver total recaudado';
	Escribir '5. Cambiar sala';
	Escribir '6. Salir';
	Escribir '==================================================';
FinSubAlgoritmo

SubAlgoritmo mostrar_sala (_sillas, _numeroSala, _precioGeneral, _precioPreferencial, _filas, _columnas)
	Escribir '';
	Escribir '==================================================';
	Escribir '        ESTADO DE LA SALA DE CINE - SALA ', _numeroSala;
	Escribir '==================================================';
	Escribir 'Leyenda: 0=Libre  |  1=Reservada';
	Escribir 'Sillas Generales (filas 1-4): $', _precioGeneral;
	Escribir 'Sillas Preferenciales (filas 5-7): $', _precioPreferencial;
	Escribir '==================================================';
	Escribir '      Col 1  Col 2  Col 3  Col 4';

	Definir tipo, filaTexto Como Cadena;
	Definir f, c Como Entero;
	Para f <- 1 Hasta _filas Con Paso 1 Hacer
		Si f <= 4 Entonces
			tipo <- 'GENERAL';
		SiNo
			tipo <- 'PREFERENCIAL';
		FinSi
		filaTexto <- 'Fila ' + ConvertirATexto(f) + ' (' + tipo + ') ';
		Para c <- 1 Hasta _columnas Con Paso 1 Hacer
			filaTexto <- filaTexto + ' [' + ConvertirATexto(_sillas[f,c]) + ']';
		FinPara
		Escribir filaTexto;
	FinPara
	Escribir '==================================================';
FinSubAlgoritmo

SubAlgoritmo hacer_reserva (_sillas, _numeroSala, _precioGeneral, _precioPreferencial, _filas, _columnas)
	Escribir '';
	Escribir '--- HACER RESERVA EN SALA ', _numeroSala, ' ---';
	mostrar_sala(_sillas, _numeroSala, _precioGeneral, _precioPreferencial, _filas, _columnas);

	Definir numSillas, totalReserva, i, f, c, precio Como Entero;
	Definir tipo, mensaje Como Cadena;
	Definir sillasReservadas Como Cadena;
	Dimension sillasReservadas(_filas * _columnas);

	totalReserva <- 0;
	Escribir 'Cuantas sillas desea reservar? ';
	Leer numSillas;

	Si numSillas <= 0 Entonces
		Escribir 'Ingrese una cantidad valida.';
	SiNo
		Para i <- 1 Hasta numSillas Con Paso 1 Hacer
			Escribir '';
			Escribir 'Silla ', i, ':';
			f <- leer_entero('Ingrese numero de fila (1-7): ', 1, _filas);
			c <- leer_entero('Ingrese numero de columna (1-4): ', 1, _columnas);

			Si _sillas[f,c] = 1 Entonces
				Escribir 'Esta silla ya esta reservada.';
			SiNo
				_sillas[f,c] <- 1;
				precio <- obtener_precio_silla(f, _precioGeneral, _precioPreferencial);
				tipo <- obtener_tipo_silla(f);
				totalReserva <- totalReserva + precio;
				mensaje <- 'Silla reservada - Fila ' + ConvertirATexto(f) + ', Columna ' + ConvertirATexto(c) + ' - ' + tipo + ' ($' + ConvertirATexto(precio) + ')';
				Escribir mensaje;
				sillasReservadas[i] <- mensaje;
			FinSi
		FinPara
	FinSi

	Escribir '';
	Escribir '==================================================';
	Escribir '           RESUMEN DE RESERVA';
	Escribir '==================================================';
	Para i <- 1 Hasta numSillas Con Paso 1 Hacer
		Escribir sillasReservadas[i];
	FinPara
	Escribir 'TOTAL A PAGAR: $', totalReserva;
	Escribir '==================================================';
FinSubAlgoritmo

SubAlgoritmo cancelar_reserva (_sillas, _numeroSala, _precioGeneral, _precioPreferencial, _filas, _columnas)
	Escribir '';
	Escribir '--- CANCELAR RESERVA EN SALA ', _numeroSala, ' ---';
	mostrar_sala(_sillas, _numeroSala, _precioGeneral, _precioPreferencial, _filas, _columnas);

	Definir f, c, precio Como Entero;
	Definir tipo Como Cadena;
	f <- leer_entero('Ingrese numero de fila de la silla (1-7): ', 1, _filas);
	c <- leer_entero('Ingrese numero de columna de la silla (1-4): ', 1, _columnas);

	Si _sillas[f,c] = 0 Entonces
		Escribir 'Esta silla no esta reservada.';
	SiNo
		_sillas[f,c] <- 0;
		tipo <- obtener_tipo_silla(f);
		precio <- obtener_precio_silla(f, _precioGeneral, _precioPreferencial);
		Escribir 'Reserva cancelada - Fila ', f, ', Columna ', c, ' - ', tipo;
		Escribir 'Reembolso: $', precio;
	FinSi
FinSubAlgoritmo

SubAlgoritmo mostrar_total_recaudado (_sala1, _sala2, _filas, _columnas, _precioGeneral, _precioPreferencial)
	Definir subtotalSala1, subtotalSala2, totalTotal, f, c Como Entero;
	subtotalSala1 <- 0;
	subtotalSala2 <- 0;

	Para f <- 1 Hasta _filas Con Paso 1 Hacer
		Para c <- 1 Hasta _columnas Con Paso 1 Hacer
			Si _sala1[f,c] = 1 Entonces
				subtotalSala1 <- subtotalSala1 + obtener_precio_silla(f, _precioGeneral, _precioPreferencial);
			FinSi
			Si _sala2[f,c] = 1 Entonces
				subtotalSala2 <- subtotalSala2 + obtener_precio_silla(f, _precioGeneral, _precioPreferencial);
			FinSi
		FinPara
	FinPara

	Escribir '';
	Escribir '==================================================';
	Escribir '    TOTAL RECAUDADO POR RESERVAS';
	Escribir '==================================================';
	Escribir 'Sala 1: $', subtotalSala1;
	Escribir 'Sala 2: $', subtotalSala2;
	Escribir '--------------------------------------------------';
	totalTotal <- subtotalSala1 + subtotalSala2;
	Escribir 'Total general: $', totalTotal;
	Escribir '==================================================';
FinSubAlgoritmo

Funcion valor <- leer_entero (prompt, min_val, max_val)
	Definir valor Como Entero;
	Escribir prompt;
	Leer valor;
	Mientras valor < min_val O valor > max_val Hacer
		Escribir 'Valor invalido.';
		Escribir prompt;
		Leer valor;
	FinMientras
FinFuncion

Funcion tipoSilla <- obtener_tipo_silla (fila)
	Definir tipoSilla Como Cadena;
	Si fila <= 4 Entonces
		tipoSilla <- 'General';
	SiNo
		tipoSilla <- 'Preferencial';
	FinSi
FinFuncion

Funcion precioSilla <- obtener_precio_silla (fila, _precioGeneral, _precioPreferencial)
	Definir precioSilla Como Entero;
	Si fila <= 4 Entonces
		precioSilla <- _precioGeneral;
	SiNo
		precioSilla <- _precioPreferencial;
	FinSi
FinFuncion

Funcion sala <- seleccionar_sala (_arg)
	Definir sala Como Entero;
	Escribir '';
	Escribir '--- SELECCIONE SALA ---';
	Escribir '1. Sala 1';
	Escribir '2. Sala 2';
	sala <- leer_entero('Seleccione sala (1-2): ', 1, 2) - 1;
	Si sala < 0 O sala > 1 Entonces
		sala <- -1;
	FinSi
FinFuncion