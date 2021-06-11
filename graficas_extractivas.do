********************************************************************************
*Projecto: "Percepción de las extractivas en CAN"			   				   *
*Descripción: En este do-file uno datos de Colombia, Ecuador, Perú y Bolivia   *
*			y elaboro gráficas.												   *
*Datasets usados: 															   *
* CID Gallup Base de datos OP Enero 2021 Perú.xlsx							   *
* CID Gallup Base de datos OP Enero Ecuador.xlsx							   *
* OP Colombia 02 Enero 2021 BID.xlsx										   *
* OP Bolivia 01 Feb2021_BID.xlsx											   *
* BASE BID.xlsx																   *						
*Autor: Lina Díaz 															   *
*Fecha: 06/01/2021															   *
*Stata 14																	   *
********************************************************************************

clear all
set more off
global workdir "C:\Users\lina_\OneDrive - Inter-American Development Bank Group\Natural resources Trust Beliefs\Encuesta Opinión Pública + Extractivas"
*global workdir "C:\Users\linad\OneDrive - Inter-American Development Bank Group\Natural resources Trust Beliefs\Encuesta Opinión Pública + Extractivas"
global graficas "$workdir\Graficas"
cd "$workdir"

********************************************************************************
************************ PREPARANDO BASES DE DATOS *****************************
********************************************************************************

********************************* COLOMBIA *************************************

/* Convirtiendo los archivo de formato excel a formato stata */
	import excel "$workdir\Colombia\OP Colombia 02 Enero 2021 BID.xlsx", sheet("BID Colombia 02") firstrow case(lower) clear
		gen pais=1

/* Preparando variables sobre extractivas */
	rename b1consideraustedquelaminer percepcion_mineria1
	rename b2consideraustedquelaexplo percepcion_hidrocarburos1
	rename b3quétandeacuerdoestáust normas_mineria1
	rename b4quétandeacuerdoestáust normas_hidrocarburos1
	rename b5consideraustedquelosbene distribu_justice_mineria1
	rename b6consideraustedquelosbene distribu_justice_hidroca1
	rename b7quétandeacuerdoestáust procedural_justice_mineria1
	rename b8laindustriadepetróleoyg procedural_justice_hidroca1
	rename b9aquétandeacuerdoestáus escala_beneficios_mineria1
	rename b9bquétandeacuerdoestáus escala_problemas_mineria1
	rename b10losrecursosmineroscolomb foreignness_mineria1
	rename b11elpetróleoygascolombian foreignness_hidrocarburos1
	rename b12enquémedioseinformópo informacion_mineria1
	rename cl informacion_mineria2
	rename cm informacion_mineria3 
	rename b13ysobregasypetróleoen informacion_hidrocarburos1
	rename co informacion_hidrocarburos2
	rename cp informacion_hidrocarburos3
	rename cq informacion_hidrocarburos4
	rename cr informacion_hidrocarburos5
	rename cs informacion_hidrocarburos6
	rename ct informacion_hidrocarburos7
	rename cu informacion_hidrocarburos8
	rename cv informacion_hidrocarburos9
	rename cw informacion_hidrocarburos10 
	rename b14teniendoencuentalosimpa impacto_oro_colombia1
	
/* Preparando otras variables */
	rename p54ycuáleselúltimoañode p54ycuáleselúltimoañod
	
save "$workdir\analisis_datos\colombia.dta", replace


*********************************** PERU ***************************************

/* Convirtiendo los archivo de formato excel a formato stata */
	import excel "$workdir\Peru\CID Gallup Base de datos OP Enero 2021 Perú.xlsx", sheet("BID Perú 13") firstrow case(lower) clear
		gen pais=2
		
/* Preparando variables sobre extractivas */
	rename b1consideraustedquelaminer percepcion_mineria1
	rename b2consideraustedquelaexplo percepcion_hidrocarburos1
	rename b3quétandeacuerdoestáust normas_mineria1
	rename b4quétandeacuerdoestáust normas_hidrocarburos1
	rename b5consideraustedquelosbene distribu_justice_mineria1
	rename b6consideraustedquelosbene distribu_justice_hidroca1
	rename b7quétandeacuerdoestáust procedural_justice_mineria1
	rename b8laindustriadepetróleoyg procedural_justice_hidroca1
	rename b9aquétandeacuerdoestáus escala_beneficios_mineria1
	rename b9bquétandeacuerdoestáus escala_problemas_mineria1
	rename b10losrecursosminerosperuan foreignness_mineria1
	rename b11elpetróleoygasperuanod foreignness_hidrocarburos1
	rename b12enquémedioseinformópo informacion_mineria1
	rename cd informacion_mineria2
	rename ce informacion_mineria3
	rename cf informacion_mineria4
	rename cg informacion_mineria5
	rename ch informacion_mineria6
	rename ci informacion_mineria7
	rename cj informacion_mineria8
	rename b13ysobregasypetróleoen informacion_hidrocarburos1
	rename cl informacion_hidrocarburos2
	rename cm informacion_hidrocarburos3
	rename cn informacion_hidrocarburos4
	rename co informacion_hidrocarburos5
	rename cp informacion_hidrocarburos6
	rename cq informacion_hidrocarburos7
	rename cr informacion_hidrocarburos8
	rename cs informacion_hidrocarburos9
	rename ct informacion_hidrocarburos10
	
/* Preparando otras variables */
	rename anotelaregión región
	rename p531ycuáleselúltimoaño p54ycuáleselúltimoañod
		
save "$workdir\analisis_datos\peru.dta", replace

	
********************************* ECUADOR **************************************

/* Convirtiendo los archivo de formato excel a formato stata */
	import excel "$workdir\Ecuador\CID Gallup Base de datos OP Enero Ecuador.xlsx", sheet("BID Ecuador 02") firstrow case(lower) clear
		gen pais=3
		
/* Preparando variables sobre extractivas */
	rename b1consideraustedquelaminer percepcion_mineria1
	rename b2consideraustedquelaexplo percepcion_hidrocarburos1
	rename b3quétandeacuerdoestáust normas_mineria1
	rename b4quétandeacuerdoestáust normas_hidrocarburos1
	rename b5consideraustedquelosbene distribu_justice_mineria1
	rename b6consideraustedquelosbene distribu_justice_hidroca1
	rename b7quétandeacuerdoestáust procedural_justice_mineria1
	rename b8laindustriadepetróleoyga procedural_justice_hidroca1
	rename b9aquétandeacuerdoestáus escala_beneficios_mineria1
	rename b9bquétandeacuerdoestáus escala_problemas_mineria1
	rename b10losrecursosminerosecuato foreignness_mineria1
	rename b11elpetróleoygasecuatoria foreignness_hidrocarburos1
	rename b12enquémedioseinformópo informacion_mineria1
	rename ce informacion_mineria2
	rename cf informacion_mineria3 
	rename b13ysobregasypetróleoen informacion_hidrocarburos1
	rename ch informacion_hidrocarburos2
	rename ci informacion_hidrocarburos3
	rename cj informacion_hidrocarburos4
	rename ck informacion_hidrocarburos5
	rename cl informacion_hidrocarburos6
	rename cm informacion_hidrocarburos7
	rename cn informacion_hidrocarburos8
	rename co informacion_hidrocarburos9
	rename cp informacion_hidrocarburos10
	
/* Preparando otras variables */
	
	
save "$workdir\analisis_datos\ecuador.dta", replace
		

********************************* BOLIVIA *************************************

/* Convirtiendo los archivo de formato excel a formato stata */
	import excel "$workdir\Bolivia\OP Bolivia 01 Feb2021_BID.xlsx", sheet("Base BID") firstrow case(lower) clear
		gen pais=4

/*Preparando variables sobre extractivas */
	rename b1consideraustedquelaminer percepcion_mineria1
	rename b2consideraustedquelaexplo percepcion_hidrocarburos1
	rename b3quétandeacuerdoestáust normas_mineria1
	rename b4quétandeacuerdoestáust normas_hidrocarburos1
	rename b5consideraustedquelosbene distribu_justice_mineria1
	rename b6consideraustedquelosbene distribu_justice_hidroca1
	rename b7quétandeacuerdoestáust procedural_justice_mineria1
	rename b8laindustriadepetróleoyg procedural_justice_hidroca1
	rename b9aquétandeacuerdoestáus escala_beneficios_mineria1
	rename b9bquétandeacuerdoestáus escala_problemas_mineria1
	rename b10losrecursosminerosbolivi foreignness_mineria1
	rename b11elpetróleoygasboliviano foreignness_hidrocarburos1
	rename b12enquémedioseinformópo informacion_mineria1
	rename cu informacion_mineria2
	rename cv informacion_mineria3
	rename b13ysobregasypetróleoen informacion_hidrocarburos1
	rename cx informacion_hidrocarburos2
	rename cy informacion_hidrocarburos3
	rename cz informacion_hidrocarburos4
	rename da informacion_hidrocarburos5
	rename db informacion_hidrocarburos6
	rename dc informacion_hidrocarburos7
	rename dd informacion_hidrocarburos8
	rename de informacion_hidrocarburos9
	rename df informacion_hidrocarburos10
	rename b14quétandeacuerdoestáus litio_bolivia1
	
/* Preparando otras variables */	
	rename p57aycuáleselúltimoañod p54ycuáleselúltimoañod
		
save "$workdir\analisis_datos\bolivia.dta", replace

********************************* VENEZUELA ************************************

/* Convirtiendo los archivo de formato excel a formato stata */
	import excel "$workdir\Venezuela\BASE BID.xlsx", sheet("DATA") firstrow case(lower) clear
		gen pais=5

/* Preparando variables */
	rename sujeto sbjnum
	
	gen p2arangodeedad=""
		replace p2arangodeedad="18-24" if f2==1
        replace p2arangodeedad="25-34" if f2==2
        replace p2arangodeedad="35-44" if f2==3
        replace p2arangodeedad="45-54" if f2==4
        replace p2arangodeedad="55+" if f2==5
		drop f2
	
	gen p1anotarsexodelentrevistado=""
		replace p1anotarsexodelentrevistado="Femenino" if f5==2
		replace p1anotarsexodelentrevistado="Masculino" if f5==1
		drop f5
		
	gen p54ycuáleselúltimoañod=""
		replace p54ycuáleselúltimoañod="Sin educación/ ninguno" if nse3==1
		replace p54ycuáleselúltimoañod="Primaria incompleta" if nse3==2
		replace p54ycuáleselúltimoañod="Primaria completa" if nse3==3
		replace p54ycuáleselúltimoañod="Secundaria incompleta" if nse3==4
		replace p54ycuáleselúltimoañod="Secundaria completa" if nse3==5
		replace p54ycuáleselúltimoañod="Estudios técnicos" if nse3==6
		replace p54ycuáleselúltimoañod="Estudios técnicos" if nse3==7
		replace p54ycuáleselúltimoañod="Estudios superiores incompletos" if nse3==8
		replace p54ycuáleselúltimoañod="superiores completos" if nse3==9
		drop nse3
	
	gen percepcion_mineria1=""
		replace percepcion_mineria1="Muy positiva" if p17==1
		replace percepcion_mineria1="Algo positiva" if p17==2
		replace percepcion_mineria1="Ni positiva, ni negativa" if p17==3
		replace percepcion_mineria1="Algo negativa" if p17==4
		replace percepcion_mineria1="Muy negativa" if p17==5
		drop p17
		
	gen percepcion_hidrocarburos1=""
		replace percepcion_hidrocarburos1="Muy positiva" if p18==1
		replace percepcion_hidrocarburos1="Algo positiva" if p18==2
		replace percepcion_hidrocarburos1="Ni positiva, ni negativa" if p18==3
		replace percepcion_hidrocarburos1="Algo negativa" if p18==4
		replace percepcion_hidrocarburos1="Muy negativa" if p18==5
		drop p18
		
	gen normas_mineria1=""
		replace normas_mineria1="Muy de acuerdo" if p19==1
		replace normas_mineria1="Algo de acuerdo" if p19==2
		replace normas_mineria1="Ni en desacuerdo, ni de acuerdo" if p19==3
		replace normas_mineria1="Algo en desacuerdo" if p19==4
		replace normas_mineria1="Muy en desacuerdo" if p19==5
		drop p19 
		
	gen normas_hidrocarburos1=""
		replace normas_hidrocarburos1="Muy de acuerdo" if p20==1
        replace normas_hidrocarburos1="Algo de acuerdo" if p20==2                 
		replace normas_hidrocarburos1="Ni en desacuerdo, ni de acuerdo" if p20==3
		replace normas_hidrocarburos1="Algo en desacuerdo" if p20==4
		replace normas_hidrocarburos1="Muy en desacuerdo" if p20==5
		drop p20
		
	gen distribu_justice_mineria1=""
		replace distribu_justice_mineria1="Muy justa" if p21==1
		replace distribu_justice_mineria1="Algo justa" if p21==2
		replace distribu_justice_mineria1="Ni justa ni injusta" if p21==3
		replace distribu_justice_mineria1="Algo injusta" if p21==4
		replace distribu_justice_mineria1="Muy injusta" if p21==5
		drop p21
		
	gen distribu_justice_hidroca1=""
		replace distribu_justice_hidroca1="Muy justa" if p22==1
		replace distribu_justice_hidroca1="Algo justa" if p22==2
		replace distribu_justice_hidroca1="Ni justa ni injusta" if p22==3
		replace distribu_justice_hidroca1="Algo injusta" if p22==4
		replace distribu_justice_hidroca1="Muy injusta" if p22==5
		drop p22
		 
	gen procedural_justice_mineria1=""
		replace procedural_justice_mineria1="Muy de acuerdo" if p23==1
        replace procedural_justice_mineria1="Algo de acuerdo" if p23==2                 
		replace procedural_justice_mineria1="Ni en desacuerdo, ni de acuerdo" if p23==3
		replace procedural_justice_mineria1="Algo en desacuerdo" if p23==4
		replace procedural_justice_mineria1="Muy en desacuerdo" if p23==5
		drop p23
		
	gen procedural_justice_hidroca1=""
		replace procedural_justice_hidroca1="Muy de acuerdo" if p24==1
        replace procedural_justice_hidroca1="Algo de acuerdo" if p24==2                 
		replace procedural_justice_hidroca1="Ni en desacuerdo, ni de acuerdo" if p24==3
		replace procedural_justice_hidroca1="Algo en desacuerdo" if p24==4
		replace procedural_justice_hidroca1="Muy en desacuerdo" if p24==5
		drop p24
		
	gen escala_beneficios_mineria1=""
		replace escala_beneficios_mineria1="Muy de acuerdo" if p25a==1
        replace escala_beneficios_mineria1="Algo de acuerdo" if p25a==2                 
		replace escala_beneficios_mineria1="Ni en desacuerdo, ni de acuerdo" if p25a==3
		replace escala_beneficios_mineria1="Algo en desacuerdo" if p25a==4
		replace escala_beneficios_mineria1="Muy en desacuerdo" if p25a==5
		drop p25a
		
	gen escala_problemas_mineria1=""
		replace escala_problemas_mineria1="Muy de acuerdo" if p25b==1
        replace escala_problemas_mineria1="Algo de acuerdo" if p25b==2                 
		replace escala_problemas_mineria1="Ni en desacuerdo, ni de acuerdo" if p25b==3
		replace escala_problemas_mineria1="Algo en desacuerdo" if p25b==4
		replace escala_problemas_mineria1="Muy en desacuerdo" if p25b==5
		drop p25b
		
	gen foreignness_mineria1=""
		replace foreignness_mineria1="Muy de acuerdo" if p26==1
        replace foreignness_mineria1="Algo de acuerdo" if p26==2                 
		replace foreignness_mineria1="Ni en desacuerdo, ni de acuerdo" if p26==3
		replace foreignness_mineria1="Algo en desacuerdo" if p26==4
		replace foreignness_mineria1="Muy en desacuerdo" if p26==5
		drop p26
	
	gen foreignness_hidrocarburos1=""
		replace foreignness_hidrocarburos1="Muy de acuerdo" if p27==1
        replace foreignness_hidrocarburos1="Algo de acuerdo" if p27==2                 
		replace foreignness_hidrocarburos1="Ni en desacuerdo, ni de acuerdo" if p27==3
		replace foreignness_hidrocarburos1="Algo en desacuerdo" if p27==4
		replace foreignness_hidrocarburos1="Muy en desacuerdo" if p27==5
		drop p27
		
	gen informacion_mineria1=""
		replace informacion_mineria1="Televisión" if p281==1
		replace informacion_mineria1="Radio" if p281==2
		replace informacion_mineria1="Redes sociales como Facebook, Instagram, whatsapp y Twitter" if p281==3
		replace informacion_mineria1="Otras fuentes de internet" if p281==4
		replace informacion_mineria1="Prensa" if p281==5
		replace informacion_mineria1="Algún familiar o amigo" if p281==6
		replace informacion_mineria1="No se informó" if p281==7
		replace informacion_mineria1="Otros. Anote lo que dice" if p281==8
		drop p281
		
	gen informacion_mineria2=""
		replace informacion_mineria2="Televisión" if p282==1
		replace informacion_mineria2="Radio" if p282==2
		replace informacion_mineria2="Redes sociales como Facebook, Instagram, whatsapp y Twitter" if p282==3
		replace informacion_mineria2="Otras fuentes de internet" if p282==4
		replace informacion_mineria2="Prensa" if p282==5
		replace informacion_mineria2="Algún familiar o amigo" if p282==6
		replace informacion_mineria2="No se informó" if p282==7
		replace informacion_mineria2="Otros. Anote lo que dice" if p282==8
		drop p282
		
	gen informacion_mineria3=""
		replace informacion_mineria3="Televisión" if p283==1
		replace informacion_mineria3="Radio" if p283==2
		replace informacion_mineria3="Redes sociales como Facebook, Instagram, whatsapp y Twitter" if p283==3
		replace informacion_mineria3="Otras fuentes de internet" if p283==4
		replace informacion_mineria3="Prensa" if p283==5
		replace informacion_mineria3="Algún familiar o amigo" if p283==6
		replace informacion_mineria3="No se informó" if p283==7
		replace informacion_mineria3="Otros. Anote lo que dice" if p283==8
		drop p283
		
	gen informacion_hidrocarburos1=""
		replace informacion_hidrocarburos1="Televisión" if p291==1
		replace informacion_hidrocarburos1="Radio" if p291==2
		replace informacion_hidrocarburos1="Redes sociales como Facebook, Instagram, whatsapp y Twitter" if p291==3
		replace informacion_hidrocarburos1="Otras fuentes de internet" if p291==4
		replace informacion_hidrocarburos1="Prensa" if p291==5
		replace informacion_hidrocarburos1="Algún familiar o amigo" if p291==6
		replace informacion_hidrocarburos1="No se informó" if p291==7
		replace informacion_hidrocarburos1="Otros. Anote lo que dice" if p291==8
		drop p291
			
	gen informacion_hidrocarburos2=""
		replace informacion_hidrocarburos2="Televisión" if p292==1
		replace informacion_hidrocarburos2="Radio" if p292==2
		replace informacion_hidrocarburos2="Redes sociales como Facebook, Instagram, whatsapp y Twitter" if p292==3
		replace informacion_hidrocarburos2="Otras fuentes de internet" if p292==4
		replace informacion_hidrocarburos2="Prensa" if p292==5
		replace informacion_hidrocarburos2="Algún familiar o amigo" if p292==6
		replace informacion_hidrocarburos2="No se informó" if p292==7
		replace informacion_hidrocarburos2="Otros. Anote lo que dice" if p292==8
		drop p292
		
	gen informacion_hidrocarburos3=""
		replace informacion_hidrocarburos3="Televisión" if p293==1
		replace informacion_hidrocarburos3="Radio" if p293==2
		replace informacion_hidrocarburos3="Redes sociales como Facebook, Instagram, whatsapp y Twitter" if p293==3
		replace informacion_hidrocarburos3="Otras fuentes de internet" if p293==4
		replace informacion_hidrocarburos3="Prensa" if p293==5
		replace informacion_hidrocarburos3="Algún familiar o amigo" if p293==6
		replace informacion_hidrocarburos3="No se informó" if p293==7
		replace informacion_hidrocarburos3="Otros. Anote lo que dice" if p293==8	
		drop p293
	
save "$workdir\analisis_datos\venezuela.dta", replace

********************************************************************************
************************** UNIENDO BASES DE DATOS ******************************
********************************************************************************
		
/* Uniendo las distintas bases en una sola */
	use "$workdir\analisis_datos\colombia.dta", clear
		append using "$workdir\analisis_datos\ecuador.dta", force
		append using "$workdir\analisis_datos\peru.dta", force
		append using "$workdir\analisis_datos\bolivia.dta", force
		append using "$workdir\analisis_datos\venezuela.dta", force

		
	dropmiss , force //Borro variables sin datos (ah ai bq br bs informacion_hidrocarburos8
	// informacion_hidrocarburos9 informacion_hidrocarburos10 aq ar as at au
	// informacion_mineria6 informacion_mineria7 informacion_mineria8 dropped)

	save "$workdir\extractivas_CAN.dta", replace // N=7,018
	
/* Borrando archivos creados como paso intermedio que es innecesario guardar */
	erase "$workdir\analisis_datos\colombia.dta"
	erase "$workdir\analisis_datos\ecuador.dta"
	erase "$workdir\analisis_datos\peru.dta"
	erase "$workdir\analisis_datos\bolivia.dta"
	erase "$workdir\analisis_datos\venezuela.dta"

	
/* Preparando variables sobre extractivas */
	gen percepcion_mineria=. 
		replace percepcion_mineria=1 if percepcion_mineria1=="Muy negativa"
		replace percepcion_mineria=2 if percepcion_mineria1=="Algo negativa"
		replace percepcion_mineria=3 if percepcion_mineria1=="Ni positiva, ni negativa"
		replace percepcion_mineria=4 if percepcion_mineria1=="Algo positiva"	
		replace percepcion_mineria=5 if percepcion_mineria1=="Muy positiva"
		drop percepcion_mineria1
		
	gen percepcion_hidrocarburos=. 
		replace percepcion_hidrocarburos=1 if percepcion_hidrocarburos1=="Muy negativa"
		replace percepcion_hidrocarburos=2 if percepcion_hidrocarburos1=="Algo negativa"
		replace percepcion_hidrocarburos=3 if percepcion_hidrocarburos1=="Ni positiva, ni negativa"
		replace percepcion_hidrocarburos=4 if percepcion_hidrocarburos1=="Algo positiva"	
		replace percepcion_hidrocarburos=5 if percepcion_hidrocarburos1=="Muy positiva"
		drop percepcion_hidrocarburos1
	
	gen normas_mineria=.
		replace normas_mineria=1 if normas_mineria1=="Muy en desacuerdo"
		replace normas_mineria=2 if normas_mineria1=="Algo en desacuerdo"
		replace normas_mineria=3 if normas_mineria1=="Ni en desacuerdo, ni de acuerdo"
		replace normas_mineria=4 if normas_mineria1=="Algo de acuerdo"
		replace normas_mineria=5 if normas_mineria1=="Muy de acuerdo"
		drop normas_mineria1
		
	gen normas_hidrocarburos=.
		replace normas_hidrocarburos=1 if normas_hidrocarburos1=="Muy en desacuerdo"
		replace normas_hidrocarburos=2 if normas_hidrocarburos1=="Algo en desacuerdo"
		replace normas_hidrocarburos=3 if normas_hidrocarburos1=="Ni en desacuerdo, ni de acuerdo"
		replace normas_hidrocarburos=4 if normas_hidrocarburos1=="Algo de acuerdo"
		replace normas_hidrocarburos=5 if normas_hidrocarburos1=="Muy de acuerdo"
		drop normas_hidrocarburos1
		
	gen distribu_justice_mineria=.
		replace distribu_justice_mineria=1 if distribu_justice_mineria1=="Muy injusta"
		replace distribu_justice_mineria=2 if distribu_justice_mineria1=="Algo injusta"
		replace distribu_justice_mineria=3 if distribu_justice_mineria1=="Ni justa ni injusta"
		replace distribu_justice_mineria=4 if distribu_justice_mineria1=="Algo justa"
		replace distribu_justice_mineria=5 if distribu_justice_mineria1=="Muy justa"
		drop distribu_justice_mineria1
		
	gen distribu_justice_hidroca=.
		replace distribu_justice_hidroca=1 if distribu_justice_hidroca1=="Muy injusta"
		replace distribu_justice_hidroca=2 if distribu_justice_hidroca1=="Algo injusta"
		replace distribu_justice_hidroca=3 if distribu_justice_hidroca1=="Ni justa ni injusta"
		replace distribu_justice_hidroca=4 if distribu_justice_hidroca1=="Algo justa"
		replace distribu_justice_hidroca=5 if distribu_justice_hidroca1=="Muy justa"
		drop distribu_justice_hidroca1
		
	gen procedural_justice_mineria=.
		replace procedural_justice_mineria=1 if procedural_justice_mineria1=="Muy en desacuerdo"
		replace procedural_justice_mineria=2 if procedural_justice_mineria1=="Algo en desacuerdo"
		replace procedural_justice_mineria=3 if procedural_justice_mineria1=="Ni en desacuerdo, ni de acuerdo"
		replace procedural_justice_mineria=4 if procedural_justice_mineria1=="Algo de acuerdo"
		replace procedural_justice_mineria=5 if procedural_justice_mineria1=="Muy de acuerdo"
		drop procedural_justice_mineria1
		
	gen procedural_justice_hidroca=.
		replace procedural_justice_hidroca=1 if procedural_justice_hidroca1=="Muy en desacuerdo"
		replace procedural_justice_hidroca=2 if procedural_justice_hidroca1=="Algo en desacuerdo"
		replace procedural_justice_hidroca=3 if procedural_justice_hidroca1=="Ni en desacuerdo, ni de acuerdo"
		replace procedural_justice_hidroca=4 if procedural_justice_hidroca1=="Algo de acuerdo"
		replace procedural_justice_hidroca=5 if procedural_justice_hidroca1=="Muy de acuerdo"
		drop procedural_justice_hidroca1
		
	gen escala_beneficios_mineria=.
		replace escala_beneficios_mineria=1 if escala_beneficios_mineria1=="Muy en desacuerdo"
		replace escala_beneficios_mineria=2 if escala_beneficios_mineria1=="Algo en desacuerdo"
		replace escala_beneficios_mineria=3 if escala_beneficios_mineria1=="Ni en desacuerdo, ni de acuerdo"
		replace escala_beneficios_mineria=4 if escala_beneficios_mineria1=="Algo de acuerdo"
		replace escala_beneficios_mineria=5 if escala_beneficios_mineria1=="Muy de acuerdo"
		drop escala_beneficios_mineria1
		
	gen escala_problemas_mineria=.
		replace escala_problemas_mineria=1 if escala_problemas_mineria1=="Muy en desacuerdo"
		replace escala_problemas_mineria=2 if escala_problemas_mineria1=="Algo en desacuerdo"
		replace escala_problemas_mineria=3 if escala_problemas_mineria1=="Ni en desacuerdo, ni de acuerdo"
		replace escala_problemas_mineria=4 if escala_problemas_mineria1=="Algo de acuerdo"
		replace escala_problemas_mineria=5 if escala_problemas_mineria1=="Muy de acuerdo"
		drop escala_problemas_mineria1
	
	gen foreignness_mineria=.
		replace foreignness_mineria=1 if foreignness_mineria1=="Muy en desacuerdo"
		replace foreignness_mineria=2 if foreignness_mineria1=="Algo en desacuerdo"
		replace foreignness_mineria=3 if foreignness_mineria1=="Ni en desacuerdo, ni de acuerdo"
		replace foreignness_mineria=4 if foreignness_mineria1=="Algo de acuerdo"
		replace foreignness_mineria=5 if foreignness_mineria1=="Muy de acuerdo"
		drop foreignness_mineria1
		
	gen foreignness_hidrocarburos=.
		replace foreignness_hidrocarburos=1 if foreignness_hidrocarburos1=="Muy en desacuerdo"
		replace foreignness_hidrocarburos=2 if foreignness_hidrocarburos1=="Algo en desacuerdo"
		replace foreignness_hidrocarburos=3 if foreignness_hidrocarburos1=="Ni en desacuerdo, ni de acuerdo"
		replace foreignness_hidrocarburos=4 if foreignness_hidrocarburos1=="Algo de acuerdo"
		replace foreignness_hidrocarburos=5 if foreignness_hidrocarburos1=="Muy de acuerdo"
		drop foreignness_hidrocarburos1	
		
	encode informacion_mineria1, gen(informacion_mineria)
		drop informacion_mineria1
		
	encode informacion_hidrocarburos1, gen(informacion_hidrocarburos)
		drop informacion_hidrocarburos1
	
	encode impacto_oro_colombia1, gen(impacto_oro_colombia)
		drop impacto_oro_colombia1
		
	gen litio_bolivia=.
		replace litio_bolivia=1 if litio_bolivia1=="Muy en desacuerdo"
		replace litio_bolivia=2 if litio_bolivia1=="Algo en desacuerdo"
		replace litio_bolivia=3 if litio_bolivia1=="Ni en desacuerdo, ni de acuerdo"
		replace litio_bolivia=4 if litio_bolivia1=="Algo de acuerdo"
		replace litio_bolivia=5 if litio_bolivia1=="Muy de acuerdo"
		drop litio_bolivia1
	
/* Labels */
	la def pais 1 "Colombia" 2 "Peru" 3 "Ecuador" 4 "Bolivia" 5 "Venezuela"
	la val pais pais
	
	la def percepcion 1 "Muy negativa" 2 "Algo negativa" 3 "Ni positiva, ni negativa" ///
	                  4 "Algo positiva" 5 "Muy positiva"
	la val percepcion_mineria percepcion_hidrocarburos percepcion
	
	global acuerdo normas_mineria normas_hidrocarburos procedural_justice_mineria ///
		procedural_justice_hidroca escala_beneficios_mineria escala_problemas_mineria ///
		foreignness_mineria foreignness_hidrocarburos litio_bolivia
	
	la def acuerdo 1 "Muy en desacuerdo" 2 "Algo en desacuerdo" 3 "Ni en desacuerdo, ni de acuerdo" ///
	                 4 "Algo de acuerdo" 5 "Muy de acuerdo"
	la val $acuerdo acuerdo				 
	
	la def justicia 1 "Muy injusta" 2 "Algo injusta" 3 "Ni justa ni injusta" ///
	                4 "Algo justa" 5 "Muy justa"
	la val distribu_justice_mineria distribu_justice_hidroca justicia
	
	
save "$workdir\extractivas_CAN.dta", replace


********************************************************************************
********************************* GRÁFICAS *************************************
********************************************************************************

global percepcion_mineria "Considera usted que la minería para el país es..."
global percepcion_hidrocarburos "Considera usted que la explotación de gas y petróleo para el país es…"
global normas_mineria "Gob. hace cumplir normas ambientales y sociales minería"
global normas_hidrocarburos "Gob. hace cumplir normas ambientales y sociales hidrocarburos"
global distribu_justice_mineria "Beneficios económicos minería son distribuidos de manera"
global distribu_justice_hidroca "Beneficios económicos hidrocarburos son distribuidos de manera"
global procedural_justice_mineria "Industria minera escucha comunidades cerca de las minas"
global procedural_justice_hidroca "Industria hidrocarburos escucha comunidades cerca de pozos"
global escala_beneficios_mineria "Minería a gran escala trae más beneficios que la artesanal"
global escala_problemas_mineria "Minería a gran escala trae más problemas que la artesanal"
global foreignness_mineria "Minerales deberían ser explotados únicamente por empresas nacionales"
global foreignness_hidrocarburos "Hidrocarburos deberían ser explotados únicamente por empresas nacionales"
global informacion_mineria "¿En qué medio se informó por última vez sobre el tema de la minería?"
global informacion_hidrocarburos "Y sobre gas y petróleo, ¿En qué medio se informó por última vez?"
 
*ssc install splitvallabels
*ssc install catplot

foreach var of varlist percepcion_mineria-percepcion_hidrocarburos {
	splitvallabels pais
		catplot `var' pais, ///
		name (graph_`var', replace) ///
		percent(pais) ///
		var1opts(label(labsize(small))) ///
		var2opts(label(labsize(small)) relabel(`r(relabel)')) ///
		ytitle("Porcentaje de encuestados por país", size(small)) ///
		title($`var' ///
		, span size(medium)) ///
		intensity(25) ///
		asyvars stack ///
		bar(1, color(maroon) fintensity(inten80)) ///
		bar(2, color(maroon) fintensity(inten60)) ///
		bar(3, color(gray) fintensity(inten40)) ///
		bar(4, color(navy) fintensity(inten60)) ///
		bar(5, color(navy) fintensity(inten80)) ///
		legend(rows(1) stack size(small) ///
		order(1 "Muy" "negativa" 2 "Algo" "negativa" 3 "Ni positiva," /// 
		"ni negativa" 4 "Algo" "positiva" 5 "Muy" "positiva") ///
		symplacement(center) ///
		title(Categorías de respuesta, size(small)))
	graph export "$graficas\graph_`var'.png", replace
	}

foreach var of varlist $acuerdo {
	splitvallabels pais
		catplot `var' pais, ///
		name (graph_`var', replace) ///
		percent(pais) ///
		var1opts(label(labsize(small))) ///
		var2opts(label(labsize(small)) relabel(`r(relabel)')) ///
		ytitle("Porcentaje de encuestados por país", size(small)) ///
		title($`var' ///
		, span size(small)) ///
		intensity(25) ///
		asyvars stack ///
		bar(1, color(maroon) fintensity(inten80)) ///
		bar(2, color(maroon) fintensity(inten60)) ///
		bar(3, color(gray) fintensity(inten40)) ///
		bar(4, color(navy) fintensity(inten60)) ///
		bar(5, color(navy) fintensity(inten80)) ///
		legend(rows(1) stack size(small) ///
		order(1 "Muy en" "desacuerdo" 2 "Algo en" "desacuerdo" 3 "Ni en desacuerdo," ///
			"ni de acuerdo" 4 "Algo de" "acuerdo" 5 "Muy de" "acuerdo") ///
		symplacement(center) ///
		title(Categorías de respuesta, size(small)))
	graph export "$graficas\graph_`var'.png", replace
	}
	
foreach var of varlist distribu_justice_mineria-distribu_justice_hidroca {
	splitvallabels pais
		catplot `var' pais, ///
		percent(pais) ///
		var1opts(label(labsize(small))) ///
		var2opts(label(labsize(small)) relabel(`r(relabel)')) ///
		ytitle("Porcentaje de encuestados por país", size(small)) ///
		title($`var' ///
		, span size(medium)) ///
		intensity(25) ///
		asyvars stack ///
		bar(1, color(maroon) fintensity(inten80)) ///
		bar(2, color(maroon) fintensity(inten60)) ///
		bar(3, color(gray) fintensity(inten40)) ///
		bar(4, color(navy) fintensity(inten60)) ///
		bar(5, color(navy) fintensity(inten80)) ///
		legend(rows(1) stack size(small) ///
		order(1 "Muy" "injusta" 2 "Algo" "injusta" 3 "Ni justa" "ni injusta" ///
	          4 "Algo" "justa" 5 "Muy" "justa") ///
		symplacement(center) ///
		title(Categorías de respuesta, size(small)))
	graph export "$graficas\graph_`var'.png", replace
	}

	
/* splitvallabels informacion_mineria
	graph hbar, ///
	over(informacion_mineria, label(labsize(half_tiny)) relabel(`r(relabel)')) ///
	over(pais,label(labsize(small))) ///
	ytitle("Porcentaje de encuestados", size(small)) ///
	title($informacion_mineria ///
	, span size(small)) ///
	blabel(bar, format(%4.1f)) ///
	intensity(25)
graph export "$graficas\informacion_mineria.png", replace */

/* Exportando bases para gráficas en R */
	preserve
		gen num_personas=.
			replace num_personas=1 if informacion_mineria!=.
		collapse (count) num_personas, by(pais informacion_mineria)
		by pais, sort: egen pc = pc(num_personas)
		drop if informacion_mineria==.
		gen id=_n
		save "$workdir\Rinformacion_mineria.dta", replace
	restore

	preserve
		gen num_personas=.
			replace num_personas=1 if informacion_hidrocarburos!=.
		collapse (count) num_personas, by(pais informacion_hidrocarburos)
		by pais, sort: egen pc = pc(num_personas)
		drop if informacion_hidrocarburos==.
		gen id=_n
		save "$workdir\Rinformacion_hidrocarburos.dta", replace
	restore
	
/* splitvallabels informacion_hidrocarburos
	graph hbar, ///
	over(informacion_hidrocarburos, label(labsize(half_tiny)) relabel(`r(relabel)')) ///
	over(pais,label(labsize(small))) ///
	ytitle("Porcentaje de encuestados", size(small)) ///
	title($informacion_hidrocarburos ///
	, span size(tiny)) ///
	blabel(bar, format(%4.1f)) ///
	intensity(25)
graph export "$workdir\informacion_hidrocarburos.png", replace */	
	
splitvallabels impacto_oro_colombia
	graph hbar, ///
	over(impacto_oro_colombia, label(labsize(small)) relabel(`r(relabel)')) ///
	ytitle("Porcentaje de encuestados", size(small)) ///
	title("Teniendo en cuenta los impactos negativos de la minería de oro en Colombia ¿Cuál cree usted que es el más preocupante?" ///
	, span size(small)) ///
	blabel(bar, format(%4.1f)) ///
	intensity(25)
graph export "$graficas\oro_colombia.png", replace

splitvallabels litio_bolivia
	graph hbar, ///
	over(litio_bolivia, label(labsize(small)) relabel(`r(relabel)')) ///
	ytitle("Porcentaje de encuestados", size(small)) ///
	title("¿Qué tan de acuerdo está usted con que se exploten las reservas de litio en Bolivia?" ///
	, span size(small)) ///
	blabel(bar, format(%4.1f)) ///
	intensity(25)
graph export "$graficas\litio_bolivia.png", replace
	


********************************************************************************
****************************** HETEROGENEIDAD **********************************
********************************************************************************	
	
/* Volviendo las variables binarias */

	gen dpercepcion_mineria=. 
		replace dpercepcion_mineria=0 if percepcion_mineria==1
		replace dpercepcion_mineria=0 if percepcion_mineria==2
		replace dpercepcion_mineria=1 if percepcion_mineria==3
		replace dpercepcion_mineria=1 if percepcion_mineria==4
		replace dpercepcion_mineria=1 if percepcion_mineria==5
		
	gen dpercepcion_hidrocarburos=. 
		replace dpercepcion_hidrocarburos=0 if percepcion_hidrocarburos==1
		replace dpercepcion_hidrocarburos=0 if percepcion_hidrocarburos==2
		replace dpercepcion_hidrocarburos=1 if percepcion_hidrocarburos==3
		replace dpercepcion_hidrocarburos=1 if percepcion_hidrocarburos==4	
		replace dpercepcion_hidrocarburos=1 if percepcion_hidrocarburos==5
	
	gen dnormas_mineria=.
		replace dnormas_mineria=0 if normas_mineria==1
		replace dnormas_mineria=0 if normas_mineria==2
		replace dnormas_mineria=1 if normas_mineria==3
		replace dnormas_mineria=1 if normas_mineria==4
		replace dnormas_mineria=1 if normas_mineria==5
		
	gen dnormas_hidrocarburos=.
		replace dnormas_hidrocarburos=0 if normas_hidrocarburos==1
		replace dnormas_hidrocarburos=0 if normas_hidrocarburos==2
		replace dnormas_hidrocarburos=1 if normas_hidrocarburos==3
		replace dnormas_hidrocarburos=1 if normas_hidrocarburos==4
		replace dnormas_hidrocarburos=1 if normas_hidrocarburos==5
		
	gen ddistribu_justice_mineria=.
		replace ddistribu_justice_mineria=0 if distribu_justice_mineria==1
		replace ddistribu_justice_mineria=0 if distribu_justice_mineria==2
		replace ddistribu_justice_mineria=1 if distribu_justice_mineria==3
		replace ddistribu_justice_mineria=1 if distribu_justice_mineria==4
		replace ddistribu_justice_mineria=1 if distribu_justice_mineria==5
		
	gen ddistribu_justice_hidroca=.
		replace ddistribu_justice_hidroca=0 if distribu_justice_hidroca==1
		replace ddistribu_justice_hidroca=0 if distribu_justice_hidroca==2
		replace ddistribu_justice_hidroca=1 if distribu_justice_hidroca==3
		replace ddistribu_justice_hidroca=1 if distribu_justice_hidroca==4
		replace ddistribu_justice_hidroca=1 if distribu_justice_hidroca==5
		
	gen dprocedural_justice_mineria=.
		replace dprocedural_justice_mineria=0 if procedural_justice_mineria==1
		replace dprocedural_justice_mineria=0 if procedural_justice_mineria==2
		replace dprocedural_justice_mineria=1 if procedural_justice_mineria==3
		replace dprocedural_justice_mineria=1 if procedural_justice_mineria==4
		replace dprocedural_justice_mineria=1 if procedural_justice_mineria==5
		
	gen dprocedural_justice_hidroca=.
		replace dprocedural_justice_hidroca=0 if procedural_justice_hidroca==1
		replace dprocedural_justice_hidroca=0 if procedural_justice_hidroca==2
		replace dprocedural_justice_hidroca=1 if procedural_justice_hidroca==3
		replace dprocedural_justice_hidroca=1 if procedural_justice_hidroca==4
		replace dprocedural_justice_hidroca=1 if procedural_justice_hidroca==5
		
	gen descala_beneficios_mineria=.
		replace descala_beneficios_mineria=0 if escala_beneficios_mineria==1
		replace descala_beneficios_mineria=0 if escala_beneficios_mineria==2
		replace descala_beneficios_mineria=1 if escala_beneficios_mineria==3
		replace descala_beneficios_mineria=1 if escala_beneficios_mineria==4
		replace descala_beneficios_mineria=1 if escala_beneficios_mineria==5
		
	gen descala_problemas_mineria=.
		replace descala_problemas_mineria=0 if escala_problemas_mineria==1
		replace descala_problemas_mineria=0 if escala_problemas_mineria==2
		replace descala_problemas_mineria=1 if escala_problemas_mineria==3
		replace descala_problemas_mineria=1 if escala_problemas_mineria==4
		replace descala_problemas_mineria=1 if escala_problemas_mineria==5
	
	gen dforeignness_mineria=.
		replace dforeignness_mineria=0 if foreignness_mineria==1
		replace dforeignness_mineria=0 if foreignness_mineria==2
		replace dforeignness_mineria=1 if foreignness_mineria==3
		replace dforeignness_mineria=1 if foreignness_mineria==4
		replace dforeignness_mineria=1 if foreignness_mineria==5
		
	gen dforeignness_hidrocarburos=.
		replace dforeignness_hidrocarburos=0 if foreignness_hidrocarburos==1
		replace dforeignness_hidrocarburos=0 if foreignness_hidrocarburos==2
		replace dforeignness_hidrocarburos=1 if foreignness_hidrocarburos==3
		replace dforeignness_hidrocarburos=1 if foreignness_hidrocarburos==4
		replace dforeignness_hidrocarburos=1 if foreignness_hidrocarburos==5
		
	gen dlitio_bolivia=.
		replace dlitio_bolivia=0 if litio_bolivia==1
		replace dlitio_bolivia=0 if litio_bolivia==2
		replace dlitio_bolivia=1 if litio_bolivia==3
		replace dlitio_bolivia=1 if litio_bolivia==4
		replace dlitio_bolivia=1 if litio_bolivia==5
		
		
*******************************/* Género */*************************************
	gen mujer=.
		replace mujer=1 if p1anotarsexodelentrevistado=="Femenino"
		replace mujer=0 if p1anotarsexodelentrevistado=="Masculino"

* ttest dpercepcion_mineria if pais==, by(mujer)
preserve	
	collapse (mean) meandpercepcion_mineria=dpercepcion_mineria (sd) sddpercepcion_mineria=dpercepcion_mineria (count) n=dpercepcion_mineria, by(mujer pais)
		gen hidpercepcion_mineria = meandpercepcion_mineria + invttail(n-1,0.025)*(sddpercepcion_mineria/sqrt(n))	
		gen lowdpercepcion_mineria = meandpercepcion_mineria - invttail(n-1,0.025)*(sddpercepcion_mineria/sqrt(n))	
		gen mujerpais = mujer if pais==1
			replace mujerpais = mujer+5 if pais==2
			replace mujerpais = mujer+10 if pais==3
			replace mujerpais = mujer+15 if pais==4
			replace mujerpais = mujer+20 if pais==5
			sort mujerpais
	twoway (bar meandpercepcion_mineria mujerpais if mujer==0) ///
		   (bar meandpercepcion_mineria mujerpais if mujer==1) ///
		   (rcap hidpercepcion_mineria lowdpercepcion_mineria mujerpais), ///
		   legend(row(1) order(1 "Hombres" 2 "Mujeres")) ///
		   xlabel(1 "Colombia**" 6 "Ecuador*" 11 "Peru" 16 "Bolivia" 21 "Venezuela*", noticks) ///
		   xtitle("Género") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Percepción minería", span)
	graph export "$graficas\genero_percep_mineria.png", replace
restore	

* ttest dpercepcion_hidrocarburos if pais==, by(mujer)
preserve	
	collapse (mean) meandpercepcion_hidrocarburos=dpercepcion_hidrocarburos (sd) sddpercepcion_hidrocarburos=dpercepcion_hidrocarburos (count) n=dpercepcion_hidrocarburos, by(mujer pais)
		gen hidpercepcion_hidrocarburos = meandpercepcion_hidrocarburos + invttail(n-1,0.025)*(sddpercepcion_hidrocarburos/sqrt(n))	
		gen lowdpercepcion_hidrocarburos = meandpercepcion_hidrocarburos - invttail(n-1,0.025)*(sddpercepcion_hidrocarburos/sqrt(n))	
		gen mujerpais = mujer if pais==1
			replace mujerpais = mujer+5 if pais==2
			replace mujerpais = mujer+10 if pais==3
			replace mujerpais = mujer+15 if pais==4
			replace mujerpais = mujer+20 if pais==5
			sort mujerpais
	twoway (bar meandpercepcion_hidrocarburos mujerpais if mujer==0) ///
		   (bar meandpercepcion_hidrocarburos mujerpais if mujer==1) ///
		   (rcap hidpercepcion_hidrocarburos lowdpercepcion_hidrocarburos mujerpais), ///
		   legend(row(1) order(1 "Hombres" 2 "Mujeres")) ///
		   xlabel(1 "Colombia**" 6 "Ecuador**" 11 "Peru" 16 "Bolivia***" 21 "Venezuela", noticks) ///
		   xtitle("Género") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Percepción hidrocarburos", span)
	graph export "$graficas\genero_percep_hidrocar.png", replace
restore		
	
* ttest ddistribu_justice_mineria if pais==, by(mujer)
preserve	
	collapse (mean) meanddistribu_justice_mineria=ddistribu_justice_mineria (sd) sdddistribu_justice_mineria=ddistribu_justice_mineria (count) n=ddistribu_justice_mineria, by(mujer pais)
		gen hiddistribu_justice_mineria = meanddistribu_justice_mineria + invttail(n-1,0.025)*(sdddistribu_justice_mineria/sqrt(n))	
		gen lowddistribu_justice_mineria = meanddistribu_justice_mineria - invttail(n-1,0.025)*(sdddistribu_justice_mineria/sqrt(n))	
		gen mujerpais = mujer if pais==1
			replace mujerpais = mujer+5 if pais==2
			replace mujerpais = mujer+10 if pais==3
			replace mujerpais = mujer+15 if pais==4
			replace mujerpais = mujer+20 if pais==5
			sort mujerpais
	twoway (bar meanddistribu_justice_mineria mujerpais if mujer==0) ///
		   (bar meanddistribu_justice_mineria mujerpais if mujer==1) ///
		   (rcap hiddistribu_justice_mineria lowddistribu_justice_mineria mujerpais), ///
		   legend(row(1) order(1 "Hombres" 2 "Mujeres")) ///
		   xlabel(1 "Colombia***" 6 "Ecuador " 11 "Peru***" 16 "Bolivia" 21 "Venezuela", noticks) ///
		   xtitle("Género") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Justicia distributiva minería", span)
	graph export "$graficas\genero_distrib_mineria.png", replace
restore	

* ttest ddistribu_justice_hidroca if pais==, by(mujer)
preserve	
	collapse (mean) meanddistribu_justice_hidroca=ddistribu_justice_hidroca (sd) sdddistribu_justice_hidroca=ddistribu_justice_hidroca (count) n=ddistribu_justice_hidroca, by(mujer pais)
		gen hiddistribu_justice_hidroca = meanddistribu_justice_hidroca + invttail(n-1,0.025)*(sdddistribu_justice_hidroca/sqrt(n))	
		gen lowddistribu_justice_hidroca = meanddistribu_justice_hidroca - invttail(n-1,0.025)*(sdddistribu_justice_hidroca/sqrt(n))	
		gen mujerpais = mujer if pais==1
			replace mujerpais = mujer+5 if pais==2
			replace mujerpais = mujer+10 if pais==3
			replace mujerpais = mujer+15 if pais==4
			replace mujerpais = mujer+20 if pais==5
			sort mujerpais
	twoway (bar meanddistribu_justice_hidroca mujerpais if mujer==0) ///
		   (bar meanddistribu_justice_hidroca mujerpais if mujer==1) ///
		   (rcap hiddistribu_justice_hidroca lowddistribu_justice_hidroca mujerpais), ///
		   legend(row(1) order(1 "Hombres" 2 "Mujeres")) ///
		   xlabel(1 "Colombia" 6 "Ecuador" 11 "Peru" 16 "Bolivia" 21 "Venezuela", noticks) ///
		   xtitle("Género") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Justicia distributiva hidrocarburos", span)
	graph export "$graficas\genero_distrib_hidro.png", replace
restore	

* ttest dprocedural_justice_mineria if pais==, by(mujer)
preserve	
	collapse (mean) meandprocedural_justice_mineria=dprocedural_justice_mineria (sd) sddprocedural_justice_mineria=dprocedural_justice_mineria (count) n=dprocedural_justice_mineria, by(mujer pais)
		gen hidprocedural_justice_mineria = meandprocedural_justice_mineria + invttail(n-1,0.025)*(sddprocedural_justice_mineria/sqrt(n))	
		gen lowdprocedural_justice_mineria = meandprocedural_justice_mineria - invttail(n-1,0.025)*(sddprocedural_justice_mineria/sqrt(n))	
		gen mujerpais = mujer if pais==1
			replace mujerpais = mujer+5 if pais==2
			replace mujerpais = mujer+10 if pais==3
			replace mujerpais = mujer+15 if pais==4
			replace mujerpais = mujer+20 if pais==5
			sort mujerpais
	twoway (bar meandprocedural_justice_mineria mujerpais if mujer==0) ///
		   (bar meandprocedural_justice_mineria mujerpais if mujer==1) ///
		   (rcap hidprocedural_justice_mineria lowdprocedural_justice_mineria mujerpais), ///
		   legend(row(1) order(1 "Hombres" 2 "Mujeres")) ///
		   xlabel(1 "Colombia" 6 "Ecuador" 11 "Peru" 16 "Bolivia*" 21 "Venezuela", noticks) ///
		   xtitle("Género") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Justicia procedimental minería", span)
	graph export "$graficas\genero_proce_mineria.png", replace
restore	

* ttest dprocedural_justice_hidroca if pais==, by(mujer)
preserve	
	collapse (mean) meandprocedural_justice_hidroca=dprocedural_justice_hidroca (sd) sddprocedural_justice_hidroca=dprocedural_justice_hidroca (count) n=dprocedural_justice_hidroca, by(mujer pais)
		gen hidprocedural_justice_hidroca = meandprocedural_justice_hidroca + invttail(n-1,0.025)*(sddprocedural_justice_hidroca/sqrt(n))	
		gen lowdprocedural_justice_hidroca = meandprocedural_justice_hidroca - invttail(n-1,0.025)*(sddprocedural_justice_hidroca/sqrt(n))	
		gen mujerpais = mujer if pais==1
			replace mujerpais = mujer+5 if pais==2
			replace mujerpais = mujer+10 if pais==3
			replace mujerpais = mujer+15 if pais==4
			replace mujerpais = mujer+20 if pais==5
			sort mujerpais
	twoway (bar meandprocedural_justice_hidroca mujerpais if mujer==0) ///
		   (bar meandprocedural_justice_hidroca mujerpais if mujer==1) ///
		   (rcap hidprocedural_justice_hidroca lowdprocedural_justice_hidroca mujerpais), ///
		   legend(row(1) order(1 "Hombres" 2 "Mujeres")) ///
		   xlabel(1 "Colombia" 6 "Ecuador" 11 "Peru" 16 "Bolivia***" 21 "Venezuela", noticks) ///
		   xtitle("Género") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Justicia procedimental hidrocarburos", span)
	graph export "$graficas\genero_proce_hidro.png", replace
restore	

* ttest dforeignness_mineria if pais==, by(mujer)
preserve	
	collapse (mean) meandforeignness_mineria=dforeignness_mineria (sd) sddforeignness_mineria=dforeignness_mineria (count) n=dforeignness_mineria, by(mujer pais)
		gen hidforeignness_mineria = meandforeignness_mineria + invttail(n-1,0.025)*(sddforeignness_mineria/sqrt(n))	
		gen lowdforeignness_mineria = meandforeignness_mineria - invttail(n-1,0.025)*(sddforeignness_mineria/sqrt(n))	
		gen mujerpais = mujer if pais==1
			replace mujerpais = mujer+5 if pais==2
			replace mujerpais = mujer+10 if pais==3
			replace mujerpais = mujer+15 if pais==4
			replace mujerpais = mujer+20 if pais==5
			sort mujerpais
	twoway (bar meandforeignness_mineria mujerpais if mujer==0) ///
		   (bar meandforeignness_mineria mujerpais if mujer==1) ///
		   (rcap hidforeignness_mineria lowdforeignness_mineria mujerpais), ///
		   legend(row(1) order(1 "Hombres" 2 "Mujeres")) ///
		   xlabel(1 "Colombia***" 6 "Ecuador" 11 "Peru" 16 "Bolivia" 21 "Venezuela***", noticks) ///
		   xtitle("Género") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Nacionalismo minería", span)
	graph export "$graficas\genero_nacional_mineria.png", replace
restore			

* ttest dforeignness_hidrocarburos if pais==, by(mujer)	
preserve	
	collapse (mean) meandforeignness_hidrocarburos=dforeignness_hidrocarburos (sd) sddforeignness_hidrocarburos=dforeignness_hidrocarburos (count) n=dforeignness_hidrocarburos, by(mujer pais)
		gen hidforeignness_hidrocarburos = meandforeignness_hidrocarburos + invttail(n-1,0.025)*(sddforeignness_hidrocarburos/sqrt(n))	
		gen lowdforeignness_hidrocarburos = meandforeignness_hidrocarburos - invttail(n-1,0.025)*(sddforeignness_hidrocarburos/sqrt(n))	
		gen mujerpais = mujer if pais==1
			replace mujerpais = mujer+5 if pais==2
			replace mujerpais = mujer+10 if pais==3
			replace mujerpais = mujer+15 if pais==4
			replace mujerpais = mujer+20 if pais==5
			sort mujerpais
	twoway (bar meandforeignness_hidrocarburos mujerpais if mujer==0) ///
		   (bar meandforeignness_hidrocarburos mujerpais if mujer==1) ///
		   (rcap hidforeignness_hidrocarburos lowdforeignness_hidrocarburos mujerpais), ///
		   legend(row(1) order(1 "Hombres" 2 "Mujeres")) ///
		   xlabel(1 "Colombia***" 6 "Ecuador" 11 "Peru" 16 "Bolivia" 21 "Venezuela***", noticks) ///
		   xtitle("Género") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Nacionalismo hidrocarburos", span)
	graph export "$graficas\genero_nacional_hidro.png", replace
restore			

	
***************************/* Región */********************************

gen rural=0
	replace rural=1 if región=="Resto" | región=="Resto país" | región=="OT/C" 
	
preserve	
	collapse (mean) meandpercepcion_mineria=dpercepcion_mineria (sd) sddpercepcion_mineria=dpercepcion_mineria (count) n=dpercepcion_mineria, by(rural pais)
		gen hidpercepcion_mineria = meandpercepcion_mineria + invttail(n-1,0.025)*(sddpercepcion_mineria/sqrt(n))	
		gen lowdpercepcion_mineria = meandpercepcion_mineria - invttail(n-1,0.025)*(sddpercepcion_mineria/sqrt(n))	
		gen ruralpais = rural if pais==1
			replace ruralpais = rural+5 if pais==2
			replace ruralpais = rural+10 if pais==3
			replace ruralpais = rural+15 if pais==4
			sort ruralpais
	twoway (bar meandpercepcion_mineria ruralpais if rural==0) ///
		   (bar meandpercepcion_mineria ruralpais if rural==1) ///
		   (rcap hidpercepcion_mineria lowdpercepcion_mineria ruralpais), ///
		   legend(row(1) order(1 "Urbano" 2 "Rural")) ///
		   xlabel(1 "Colombia" 6 "Ecuador" 11 "Peru*" 16 "Bolivia", noticks) ///
		   xtitle("Región") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Percepción minería", span)
	graph export "$graficas\rural_percep_mineria.png", replace
restore	

preserve	
	collapse (mean) meandpercepcion_hidrocarburos=dpercepcion_hidrocarburos (sd) sddpercepcion_hidrocarburos=dpercepcion_hidrocarburos (count) n=dpercepcion_hidrocarburos, by(rural pais)
		gen hidpercepcion_hidrocarburos = meandpercepcion_hidrocarburos + invttail(n-1,0.025)*(sddpercepcion_hidrocarburos/sqrt(n))	
		gen lowdpercepcion_hidrocarburos = meandpercepcion_hidrocarburos - invttail(n-1,0.025)*(sddpercepcion_hidrocarburos/sqrt(n))	
		gen ruralpais = rural if pais==1
			replace ruralpais = rural+5 if pais==2
			replace ruralpais = rural+10 if pais==3
			replace ruralpais = rural+15 if pais==4
			sort ruralpais
	twoway (bar meandpercepcion_hidrocarburos ruralpais if rural==0) ///
		   (bar meandpercepcion_hidrocarburos ruralpais if rural==1) ///
		   (rcap hidpercepcion_hidrocarburos lowdpercepcion_hidrocarburos ruralpais), ///
		   legend(row(1) order(1 "Urbano" 2 "Rural")) ///
		   xlabel(1 "Colombia" 6 "Ecuador" 11 "Peru **" 16 "Bolivia", noticks) ///
		   xtitle("Región") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Percepción hidrocarburos", span)
	graph export "$graficas\rural_percep_hidrocar.png", replace
restore		

preserve	
	collapse (mean) meanddistribu_justice_mineria=ddistribu_justice_mineria (sd) sdddistribu_justice_mineria=ddistribu_justice_mineria (count) n=ddistribu_justice_mineria, by(rural pais)
		gen hiddistribu_justice_mineria = meanddistribu_justice_mineria + invttail(n-1,0.025)*(sdddistribu_justice_mineria/sqrt(n))	
		gen lowddistribu_justice_mineria = meanddistribu_justice_mineria - invttail(n-1,0.025)*(sdddistribu_justice_mineria/sqrt(n))	
		gen ruralpais = rural if pais==1
			replace ruralpais = rural+5 if pais==2
			replace ruralpais = rural+10 if pais==3
			replace ruralpais = rural+15 if pais==4
			sort ruralpais
	twoway (bar meanddistribu_justice_mineria ruralpais if rural==0) ///
		   (bar meanddistribu_justice_mineria ruralpais if rural==1) ///
		   (rcap hiddistribu_justice_mineria lowddistribu_justice_mineria ruralpais), ///
		   legend(row(1) order(1 "Urbano" 2 "Rural")) ///
		   xlabel(1 "Colombia" 6 "Ecuador" 11 "Peru" 16 "Bolivia *", noticks) ///
		   xtitle("Región") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Justicia distributiva minería", span)
	graph export "$graficas\rural_distrib_mineria.png", replace
restore	

preserve	
	collapse (mean) meanddistribu_justice_hidroca=ddistribu_justice_hidroca (sd) sdddistribu_justice_hidroca=ddistribu_justice_hidroca (count) n=ddistribu_justice_hidroca, by(rural pais)
		gen hiddistribu_justice_hidroca = meanddistribu_justice_hidroca + invttail(n-1,0.025)*(sdddistribu_justice_hidroca/sqrt(n))	
		gen lowddistribu_justice_hidroca = meanddistribu_justice_hidroca - invttail(n-1,0.025)*(sdddistribu_justice_hidroca/sqrt(n))	
		gen ruralpais = rural if pais==1
			replace ruralpais = rural+5 if pais==2
			replace ruralpais = rural+10 if pais==3
			replace ruralpais = rural+15 if pais==4
			sort ruralpais
	twoway (bar meanddistribu_justice_hidroca ruralpais if rural==0) ///
		   (bar meanddistribu_justice_hidroca ruralpais if rural==1) ///
		   (rcap hiddistribu_justice_hidroca lowddistribu_justice_hidroca ruralpais), ///
		   legend(row(1) order(1 "Urbano" 2 "Rural")) ///
		   xlabel(1 "Colombia" 6 "Ecuador" 11 "Peru" 16 "Bolivia **", noticks) ///
		   xtitle("Región") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Justicia distributiva hidrocarburos", span)
	graph export "$graficas\rural_distrib_hidro.png", replace
restore		
	
preserve	
	collapse (mean) meandprocedural_justice_mineria=dprocedural_justice_mineria (sd) sddprocedural_justice_mineria=dprocedural_justice_mineria (count) n=dprocedural_justice_mineria, by(rural pais)
		gen hidprocedural_justice_mineria = meandprocedural_justice_mineria + invttail(n-1,0.025)*(sddprocedural_justice_mineria/sqrt(n))	
		gen lowdprocedural_justice_mineria = meandprocedural_justice_mineria - invttail(n-1,0.025)*(sddprocedural_justice_mineria/sqrt(n))	
		gen ruralpais = rural if pais==1
			replace ruralpais = rural+5 if pais==2
			replace ruralpais = rural+10 if pais==3
			replace ruralpais = rural+15 if pais==4
			sort ruralpais
	twoway (bar meandprocedural_justice_mineria ruralpais if rural==0) ///
		   (bar meandprocedural_justice_mineria ruralpais if rural==1) ///
		   (rcap hidprocedural_justice_mineria lowdprocedural_justice_mineria ruralpais), ///
		   legend(row(1) order(1 "Urbano" 2 "Rural")) ///
		   xlabel(1 "Colombia" 6 "Ecuador" 11 "Peru" 16 "Bolivia *", noticks) ///
		   xtitle("Región") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Justicia procedimental minería", span)
	graph export "$graficas\rural_proce_mineria.png", replace
restore	

preserve	
	collapse (mean) meandprocedural_justice_hidroca=dprocedural_justice_hidroca (sd) sddprocedural_justice_hidroca=dprocedural_justice_hidroca (count) n=dprocedural_justice_hidroca, by(rural pais)
		gen hidprocedural_justice_hidroca = meandprocedural_justice_hidroca + invttail(n-1,0.025)*(sddprocedural_justice_hidroca/sqrt(n))	
		gen lowdprocedural_justice_hidroca = meandprocedural_justice_hidroca - invttail(n-1,0.025)*(sddprocedural_justice_hidroca/sqrt(n))	
		gen ruralpais = rural if pais==1
			replace ruralpais = rural+5 if pais==2
			replace ruralpais = rural+10 if pais==3
			replace ruralpais = rural+15 if pais==4
			sort ruralpais
	twoway (bar meandprocedural_justice_hidroca ruralpais if rural==0) ///
		   (bar meandprocedural_justice_hidroca ruralpais if rural==1) ///
		   (rcap hidprocedural_justice_hidroca lowdprocedural_justice_hidroca ruralpais), ///
		   legend(row(1) order(1 "Urbano" 2 "Rural")) ///
		   xlabel(1 "Colombia ***" 6 "Ecuador" 11 "Peru" 16 "Bolivia", noticks) ///
		   xtitle("Región") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Justicia procedimental hidrocarburos", span)
	graph export "$graficas\rural_proce_hidro.png", replace
restore	

preserve	
	collapse (mean) meandforeignness_mineria=dforeignness_mineria (sd) sddforeignness_mineria=dforeignness_mineria (count) n=dforeignness_mineria, by(rural pais)
		gen hidforeignness_mineria = meandforeignness_mineria + invttail(n-1,0.025)*(sddforeignness_mineria/sqrt(n))	
		gen lowdforeignness_mineria = meandforeignness_mineria - invttail(n-1,0.025)*(sddforeignness_mineria/sqrt(n))	
		gen ruralpais = rural if pais==1
			replace ruralpais = rural+5 if pais==2
			replace ruralpais = rural+10 if pais==3
			replace ruralpais = rural+15 if pais==4
			sort ruralpais
	twoway (bar meandforeignness_mineria ruralpais if rural==0) ///
		   (bar meandforeignness_mineria ruralpais if rural==1) ///
		   (rcap hidforeignness_mineria lowdforeignness_mineria ruralpais), ///
		   legend(row(1) order(1 "Urbano" 2 "Rural")) ///
		   xlabel(1 "Colombia **" 6 "Ecuador" 11 "Peru *" 16 "Bolivia", noticks) ///
		   xtitle("Región") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Nacionalismo minería", span)
	graph export "$graficas\rural_nacional_mineria.png", replace
restore			
	
preserve	
	collapse (mean) meandforeignness_hidrocarburos=dforeignness_hidrocarburos (sd) sddforeignness_hidrocarburos=dforeignness_hidrocarburos (count) n=dforeignness_hidrocarburos, by(rural pais)
		gen hidforeignness_hidrocarburos = meandforeignness_hidrocarburos + invttail(n-1,0.025)*(sddforeignness_hidrocarburos/sqrt(n))	
		gen lowdforeignness_hidrocarburos = meandforeignness_hidrocarburos - invttail(n-1,0.025)*(sddforeignness_hidrocarburos/sqrt(n))	
		gen ruralpais = rural if pais==1
			replace ruralpais = rural+5 if pais==2
			replace ruralpais = rural+10 if pais==3
			replace ruralpais = rural+15 if pais==4
			sort ruralpais
	twoway (bar meandforeignness_hidrocarburos ruralpais if rural==0) ///
		   (bar meandforeignness_hidrocarburos ruralpais if rural==1) ///
		   (rcap hidforeignness_hidrocarburos lowdforeignness_hidrocarburos ruralpais), ///
		   legend(row(1) order(1 "Urbano" 2 "Rural")) ///
		   xlabel(1 "Colombia" 6 "Ecuador" 11 "Peru" 16 "Bolivia", noticks) ///
		   xtitle("Región") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Nacionalismo hidrocarburos", span)
	graph export "$graficas\rural_nacional_hidro.png", replace
restore			
	
	
******************************/* Educación */***********************************

gen edu_superior=0
	replace edu_superior=1 if p54ycuáleselúltimoañod=="Estudios superiores incompletos"
	replace edu_superior=1 if p54ycuáleselúltimoañod=="Estudios técnicos"
	replace edu_superior=1 if p54ycuáleselúltimoañod=="superiores completos"

* ttest dpercepcion_mineria if pais==, by(edu_superior)	
preserve	
	collapse (mean) meandpercepcion_mineria=dpercepcion_mineria (sd) sddpercepcion_mineria=dpercepcion_mineria (count) n=dpercepcion_mineria, by(edu_superior pais)
		gen hidpercepcion_mineria = meandpercepcion_mineria + invttail(n-1,0.025)*(sddpercepcion_mineria/sqrt(n))	
		gen lowdpercepcion_mineria = meandpercepcion_mineria - invttail(n-1,0.025)*(sddpercepcion_mineria/sqrt(n))	
		gen edupais = edu_superior if pais==1
			replace edupais = edu_superior+5 if pais==2
			replace edupais = edu_superior+10 if pais==3
			replace edupais = edu_superior+15 if pais==4
			replace edupais = edu_superior+20 if pais==5
			sort edupais
	twoway (bar meandpercepcion_mineria edupais if edu_superior==0) ///
		   (bar meandpercepcion_mineria edupais if edu_superior==1) ///
		   (rcap hidpercepcion_mineria lowdpercepcion_mineria edupais), ///
		   legend(row(1) order(1 "Bachillerato o menos" 2 "Educación superior")) ///
		   xlabel(1 "Colombia***" 6 "Ecuador" 11 "Peru***" 16 "Bolivia" 21 "Venezuela**", noticks) ///
		   xtitle("Nivel educativo") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Percepción minería", span)
	graph export "$graficas\edu_percep_mineria.png", replace
restore	

* ttest dpercepcion_hidrocarburos if pais==, by(edu_superior)	
preserve	
	collapse (mean) meandpercepcion_hidrocarburos=dpercepcion_hidrocarburos (sd) sddpercepcion_hidrocarburos=dpercepcion_hidrocarburos (count) n=dpercepcion_hidrocarburos, by(edu_superior pais)
		gen hidpercepcion_hidrocarburos = meandpercepcion_hidrocarburos + invttail(n-1,0.025)*(sddpercepcion_hidrocarburos/sqrt(n))	
		gen lowdpercepcion_hidrocarburos = meandpercepcion_hidrocarburos - invttail(n-1,0.025)*(sddpercepcion_hidrocarburos/sqrt(n))	
		gen edupais = edu_superior if pais==1
			replace edupais = edu_superior+5 if pais==2
			replace edupais = edu_superior+10 if pais==3
			replace edupais = edu_superior+15 if pais==4
			replace edupais = edu_superior+20 if pais==5
			sort edupais
	twoway (bar meandpercepcion_hidrocarburos edupais if edu_superior==0) ///
		   (bar meandpercepcion_hidrocarburos edupais if edu_superior==1) ///
		   (rcap hidpercepcion_hidrocarburos lowdpercepcion_hidrocarburos edupais), ///
		   legend(row(1) order(1 "Bachillerato o menos" 2 "Educación superior")) ///
		   xlabel(1 "Colombia" 6 "Ecuador***" 11 "Peru***" 16 "Bolivia**" 21 "Venezuela", noticks) ///
		   xtitle("Nivel educativo") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Percepción hidrocarburos", span)
	graph export "$graficas\edu_percep_hidrocar.png", replace
restore		
	
* ttest dnormas_mineria if pais==, by(edu_superior)	
preserve	
	collapse (mean) meandnormas_mineria=dnormas_mineria (sd) sddnormas_mineria=dnormas_mineria (count) n=dnormas_mineria, by(edu_superior pais)
		gen hidnormas_mineria = meandnormas_mineria + invttail(n-1,0.025)*(sddnormas_mineria/sqrt(n))	
		gen lowdnormas_mineria = meandnormas_mineria - invttail(n-1,0.025)*(sddnormas_mineria/sqrt(n))	
		gen edupais = edu_superior if pais==1
			replace edupais = edu_superior+5 if pais==2
			replace edupais = edu_superior+10 if pais==3
			replace edupais = edu_superior+15 if pais==4
			replace edupais = edu_superior+20 if pais==5
			sort edupais
	twoway (bar meandnormas_mineria edupais if edu_superior==0) ///
		   (bar meandnormas_mineria edupais if edu_superior==1) ///
		   (rcap hidnormas_mineria lowdnormas_mineria edupais), ///
		   legend(row(1) order(1 "Bachillerato o menos" 2 "Educación superior")) ///
		   xlabel(1 "Colombia***" 6 "Ecuador*" 11 "Peru" 16 "Bolivia***" 21 "Venezuela*", noticks) ///
		   xtitle("Nivel educativo") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Cumplimiento normas ambientales y sociales minería", span)
	graph export "$graficas\edu_normas_mineria.png", replace
restore	

* ttest dnormas_hidrocarburos if pais==, by(edu_superior)	
preserve	
	collapse (mean) meandnormas_hidrocarburos=dnormas_hidrocarburos (sd) sddnormas_hidrocarburos=dnormas_hidrocarburos (count) n=dnormas_hidrocarburos, by(edu_superior pais)
		gen hidnormas_hidrocarburos = meandnormas_hidrocarburos + invttail(n-1,0.025)*(sddnormas_hidrocarburos/sqrt(n))	
		gen lowdnormas_hidrocarburos = meandnormas_hidrocarburos - invttail(n-1,0.025)*(sddnormas_hidrocarburos/sqrt(n))	
		gen edupais = edu_superior if pais==1
			replace edupais = edu_superior+5 if pais==2
			replace edupais = edu_superior+10 if pais==3
			replace edupais = edu_superior+15 if pais==4
			replace edupais = edu_superior+20 if pais==5
			sort edupais
	twoway (bar meandnormas_hidrocarburos edupais if edu_superior==0) ///
		   (bar meandnormas_hidrocarburos edupais if edu_superior==1) ///
		   (rcap hidnormas_hidrocarburos lowdnormas_hidrocarburos edupais), ///
		   legend(row(1) order(1 "Bachillerato o menos" 2 "Educación superior")) ///
		   xlabel(1 "Colombia**" 6 "Ecuador" 11 "Peru" 16 "Bolivia***" 21 "Venezuela***", noticks) ///
		   xtitle("Nivel educativo") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Cumplimiento normas ambientales y sociales hidrocarburos", span)
	graph export "$graficas\edu_normas_hidrocar.png", replace
restore	
	
* ttest ddistribu_justice_mineria if pais==, by(edu_superior)	
preserve	
	collapse (mean) meanddistribu_justice_mineria=ddistribu_justice_mineria (sd) sdddistribu_justice_mineria=ddistribu_justice_mineria (count) n=ddistribu_justice_mineria, by(edu_superior pais)
		gen hiddistribu_justice_mineria = meanddistribu_justice_mineria + invttail(n-1,0.025)*(sdddistribu_justice_mineria/sqrt(n))	
		gen lowddistribu_justice_mineria = meanddistribu_justice_mineria - invttail(n-1,0.025)*(sdddistribu_justice_mineria/sqrt(n))	
		gen edupais = edu_superior if pais==1
			replace edupais = edu_superior+5 if pais==2
			replace edupais = edu_superior+10 if pais==3
			replace edupais = edu_superior+15 if pais==4
			replace edupais = edu_superior+20 if pais==5
			sort edupais
	twoway (bar meanddistribu_justice_mineria edupais if edu_superior==0) ///
		   (bar meanddistribu_justice_mineria edupais if edu_superior==1) ///
		   (rcap hiddistribu_justice_mineria lowddistribu_justice_mineria edupais), ///
		   legend(row(1) order(1 "Bachillerato o menos" 2 "Educación superior")) ///
		   xlabel(1 "Colombia" 6 "Ecuador" 11 "Peru" 16 "Bolivia*" 21 "Venezuela***", noticks) ///
		   xtitle("Nivel educativo") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Justicia distributiva minería", span)
	graph export "$graficas\edu_distrib_mineria.png", replace
restore	

* ttest ddistribu_justice_hidroca if pais==, by(edu_superior)	
preserve	
	collapse (mean) meanddistribu_justice_hidroca=ddistribu_justice_hidroca (sd) sdddistribu_justice_hidroca=ddistribu_justice_hidroca (count) n=ddistribu_justice_hidroca, by(edu_superior pais)
		gen hiddistribu_justice_hidroca = meanddistribu_justice_hidroca + invttail(n-1,0.025)*(sdddistribu_justice_hidroca/sqrt(n))	
		gen lowddistribu_justice_hidroca = meanddistribu_justice_hidroca - invttail(n-1,0.025)*(sdddistribu_justice_hidroca/sqrt(n))	
		gen edupais = edu_superior if pais==1
			replace edupais = edu_superior+5 if pais==2
			replace edupais = edu_superior+10 if pais==3
			replace edupais = edu_superior+15 if pais==4
			replace edupais = edu_superior+20 if pais==5
			sort edupais
	twoway (bar meanddistribu_justice_hidroca edupais if edu_superior==0) ///
		   (bar meanddistribu_justice_hidroca edupais if edu_superior==1) ///
		   (rcap hiddistribu_justice_hidroca lowddistribu_justice_hidroca edupais), ///
		   legend(row(1) order(1 "Bachillerato o menos" 2 "Educación superior")) ///
		   xlabel(1 "Colombia**" 6 "Ecuador***" 11 "Peru" 16 "Bolivia" 21 "Venezuela*", noticks) ///
		   xtitle("Nivel educativo") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Justicia distributiva hidrocarburos", span)
	graph export "$graficas\edu_distrib_hidro.png", replace
restore			

* ttest dprocedural_justice_mineria if pais==, by(edu_superior)	
preserve	
	collapse (mean) meandprocedural_justice_mineria=dprocedural_justice_mineria (sd) sddprocedural_justice_mineria=dprocedural_justice_mineria (count) n=dprocedural_justice_mineria, by(edu_superior pais)
		gen hidprocedural_justice_mineria = meandprocedural_justice_mineria + invttail(n-1,0.025)*(sddprocedural_justice_mineria/sqrt(n))	
		gen lowdprocedural_justice_mineria = meandprocedural_justice_mineria - invttail(n-1,0.025)*(sddprocedural_justice_mineria/sqrt(n))	
		gen edupais = edu_superior if pais==1
			replace edupais = edu_superior+5 if pais==2
			replace edupais = edu_superior+10 if pais==3
			replace edupais = edu_superior+15 if pais==4
			replace edupais = edu_superior+20 if pais==5
			sort edupais
	twoway (bar meandprocedural_justice_mineria edupais if edu_superior==0) ///
		   (bar meandprocedural_justice_mineria edupais if edu_superior==1) ///
		   (rcap hidprocedural_justice_mineria lowdprocedural_justice_mineria edupais), ///
		   legend(row(1) order(1 "Bachillerato o menos" 2 "Educación superior")) ///
		   xlabel(1 "Colombia **" 6 "Ecuador" 11 "Peru" 16 "Bolivia ***" 21 "Venezuela***", noticks) ///
		   xtitle("Nivel educativo") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Justicia procedimental minería", span)
	graph export "$graficas\edu_proce_mineria.png", replace
restore	

* ttest dprocedural_justice_hidroca if pais==, by(edu_superior)	
preserve	
	collapse (mean) meandprocedural_justice_hidroca=dprocedural_justice_hidroca (sd) sddprocedural_justice_hidroca=dprocedural_justice_hidroca (count) n=dprocedural_justice_hidroca, by(edu_superior pais)
		gen hidprocedural_justice_hidroca = meandprocedural_justice_hidroca + invttail(n-1,0.025)*(sddprocedural_justice_hidroca/sqrt(n))	
		gen lowdprocedural_justice_hidroca = meandprocedural_justice_hidroca - invttail(n-1,0.025)*(sddprocedural_justice_hidroca/sqrt(n))	
		gen edupais = edu_superior if pais==1
			replace edupais = edu_superior+5 if pais==2
			replace edupais = edu_superior+10 if pais==3
			replace edupais = edu_superior+15 if pais==4
			replace edupais = edu_superior+20 if pais==5
			sort edupais
	twoway (bar meandprocedural_justice_hidroca edupais if edu_superior==0) ///
		   (bar meandprocedural_justice_hidroca edupais if edu_superior==1) ///
		   (rcap hidprocedural_justice_hidroca lowdprocedural_justice_hidroca edupais), ///
		   legend(row(1) order(1 "Bachillerato o menos" 2 "Educación superior")) ///
		   xlabel(1 "Colombia" 6 "Ecuador" 11 "Peru" 16 "Bolivia**" 21 "Venezuela***", noticks) ///
		   xtitle("Nivel educativo") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Justicia procedimental hidrocarburos", span)
	graph export "$graficas\edu_proce_hidro.png", replace
restore	

* ttest dforeignness_mineria if pais==, by(edu_superior)	
preserve	
	collapse (mean) meandforeignness_mineria=dforeignness_mineria (sd) sddforeignness_mineria=dforeignness_mineria (count) n=dforeignness_mineria, by(edu_superior pais)
		gen hidforeignness_mineria = meandforeignness_mineria + invttail(n-1,0.025)*(sddforeignness_mineria/sqrt(n))	
		gen lowdforeignness_mineria = meandforeignness_mineria - invttail(n-1,0.025)*(sddforeignness_mineria/sqrt(n))	
		gen edupais = edu_superior if pais==1
			replace edupais = edu_superior+5 if pais==2
			replace edupais = edu_superior+10 if pais==3
			replace edupais = edu_superior+15 if pais==4
			replace edupais = edu_superior+20 if pais==5
			sort edupais
	twoway (bar meandforeignness_mineria edupais if edu_superior==0) ///
		   (bar meandforeignness_mineria edupais if edu_superior==1) ///
		   (rcap hidforeignness_mineria lowdforeignness_mineria edupais), ///
		   legend(row(1) order(1 "Bachillerato o menos" 2 "Educación superior")) ///
		   xlabel(1 "Colombia**" 6 "Ecuador" 11 "Peru**" 16 "Bolivia" 21 "Venezuela***", noticks) ///
		   xtitle("Nivel educativo") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Nacionalismo minería", span)
	graph export "$graficas\edu_nacional_mineria.png", replace
restore			
	
* ttest dforeignness_hidrocarburos if pais==, by(edu_superior)
preserve	
	collapse (mean) meandforeignness_hidrocarburos=dforeignness_hidrocarburos (sd) sddforeignness_hidrocarburos=dforeignness_hidrocarburos (count) n=dforeignness_hidrocarburos, by(edu_superior pais)
		gen hidforeignness_hidrocarburos = meandforeignness_hidrocarburos + invttail(n-1,0.025)*(sddforeignness_hidrocarburos/sqrt(n))	
		gen lowdforeignness_hidrocarburos = meandforeignness_hidrocarburos - invttail(n-1,0.025)*(sddforeignness_hidrocarburos/sqrt(n))	
		gen edupais = edu_superior if pais==1
			replace edupais = edu_superior+5 if pais==2
			replace edupais = edu_superior+10 if pais==3
			replace edupais = edu_superior+15 if pais==4
			replace edupais = edu_superior+20 if pais==5
			sort edupais
	twoway (bar meandforeignness_hidrocarburos edupais if edu_superior==0) ///
		   (bar meandforeignness_hidrocarburos edupais if edu_superior==1) ///
		   (rcap hidforeignness_hidrocarburos lowdforeignness_hidrocarburos edupais), ///
		   legend(row(1) order(1 "Bachillerato o menos" 2 "Educación superior")) ///
		   xlabel(1 "Colombia" 6 "Ecuador" 11 "Peru*" 16 "Bolivia" 21 "Venezuela***", noticks) ///
		   xtitle("Nivel educativo") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Nacionalismo hidrocarburos", span)
	graph export "$graficas\edu_nacional_hidro.png", replace
restore			


********************************/* Edad */**************************************

gen mayor35=0
	replace mayor35=1 if p2arangodeedad=="35-44"
	replace mayor35=1 if p2arangodeedad=="45-54"
	replace mayor35=1 if p2arangodeedad=="55+"

* ttest dpercepcion_mineria if pais==, by(mayor35)
preserve	
	collapse (mean) meandpercepcion_mineria=dpercepcion_mineria (sd) sddpercepcion_mineria=dpercepcion_mineria (count) n=dpercepcion_mineria, by(mayor35 pais)
		gen hidpercepcion_mineria = meandpercepcion_mineria + invttail(n-1,0.025)*(sddpercepcion_mineria/sqrt(n))	
		gen lowdpercepcion_mineria = meandpercepcion_mineria - invttail(n-1,0.025)*(sddpercepcion_mineria/sqrt(n))	
		gen edadpais = mayor35 if pais==1
			replace edadpais = mayor35+5 if pais==2
			replace edadpais = mayor35+10 if pais==3
			replace edadpais = mayor35+15 if pais==4
			replace edadpais = mayor35+20 if pais==5
			sort edadpais
	twoway (bar meandpercepcion_mineria edadpais if mayor35==0) ///
		   (bar meandpercepcion_mineria edadpais if mayor35==1) ///
		   (rcap hidpercepcion_mineria lowdpercepcion_mineria edadpais), ///
		   legend(row(1) order(1 "Menor 35" 2 "Mayor 35")) ///
		   xlabel(1 "Colombia**" 6 "Ecuador" 11 "Peru" 16 "Bolivia" 21 "Venezuela***", noticks) ///
		   xtitle("Edad") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Percepción minería", span)
	graph export "$graficas\edad_percep_mineria.png", replace
restore	

* ttest dpercepcion_hidrocarburos if pais==, by(mayor35)
preserve	
	collapse (mean) meandpercepcion_hidrocarburos=dpercepcion_hidrocarburos (sd) sddpercepcion_hidrocarburos=dpercepcion_hidrocarburos (count) n=dpercepcion_hidrocarburos, by(mayor35 pais)
		gen hidpercepcion_hidrocarburos = meandpercepcion_hidrocarburos + invttail(n-1,0.025)*(sddpercepcion_hidrocarburos/sqrt(n))	
		gen lowdpercepcion_hidrocarburos = meandpercepcion_hidrocarburos - invttail(n-1,0.025)*(sddpercepcion_hidrocarburos/sqrt(n))	
		gen edadpais = mayor35 if pais==1
			replace edadpais = mayor35+5 if pais==2
			replace edadpais = mayor35+10 if pais==3
			replace edadpais = mayor35+15 if pais==4
			replace edadpais = mayor35+20 if pais==5
			sort edadpais
	twoway (bar meandpercepcion_hidrocarburos edadpais if mayor35==0) ///
		   (bar meandpercepcion_hidrocarburos edadpais if mayor35==1) ///
		   (rcap hidpercepcion_hidrocarburos lowdpercepcion_hidrocarburos edadpais), ///
		   legend(row(1) order(1 "Menor 35" 2 "Mayor 35")) ///
		   xlabel(1 "Colombia**" 6 "Ecuador***" 11 "Peru" 16 "Bolivia*" 21 "Venezuela***", noticks) ///
		   xtitle("Edad") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Percepción hidrocarburos", span)
	graph export "$graficas\edad_percep_hidrocar.png", replace
restore	

* ttest dnormas_mineria if pais==, by(mayor35)
preserve	
	collapse (mean) meandnormas_mineria=dnormas_mineria (sd) sddnormas_mineria=dnormas_mineria (count) n=dnormas_mineria, by(mayor35 pais)
		gen hidnormas_mineria = meandnormas_mineria + invttail(n-1,0.025)*(sddnormas_mineria/sqrt(n))	
		gen lowdnormas_mineria = meandnormas_mineria - invttail(n-1,0.025)*(sddnormas_mineria/sqrt(n))	
		gen edadpais = mayor35 if pais==1
			replace edadpais = mayor35+5 if pais==2
			replace edadpais = mayor35+10 if pais==3
			replace edadpais = mayor35+15 if pais==4
			replace edadpais = mayor35+20 if pais==5
			sort edadpais
	twoway (bar meandnormas_mineria edadpais if mayor35==0) ///
		   (bar meandnormas_mineria edadpais if mayor35==1) ///
		   (rcap hidnormas_mineria lowdnormas_mineria edadpais), ///
		   legend(row(1) order(1 "Menor 35" 2 "Mayor 35")) ///
		   xlabel(1 "Colombia" 6 "Ecuador" 11 "Peru" 16 "Bolivia" 21 "Venezuela***", noticks) ///
		   xtitle("Edad") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Cumplimiento normas ambientales y sociales minería", span)
	graph export "$graficas\edad_normas_mineria.png", replace
restore		

* ttest dnormas_hidrocarburos if pais==, by(mayor35)
preserve	
	collapse (mean) meandnormas_hidrocarburos=dnormas_hidrocarburos (sd) sddnormas_hidrocarburos=dnormas_hidrocarburos (count) n=dnormas_hidrocarburos, by(mayor35 pais)
		gen hidnormas_hidrocarburos = meandnormas_hidrocarburos + invttail(n-1,0.025)*(sddnormas_hidrocarburos/sqrt(n))	
		gen lowdnormas_hidrocarburos = meandnormas_hidrocarburos - invttail(n-1,0.025)*(sddnormas_hidrocarburos/sqrt(n))	
		gen edadpais = mayor35 if pais==1
			replace edadpais = mayor35+5 if pais==2
			replace edadpais = mayor35+10 if pais==3
			replace edadpais = mayor35+15 if pais==4
			replace edadpais = mayor35+20 if pais==5
			sort edadpais
	twoway (bar meandnormas_hidrocarburos edadpais if mayor35==0) ///
		   (bar meandnormas_hidrocarburos edadpais if mayor35==1) ///
		   (rcap hidnormas_hidrocarburos lowdnormas_hidrocarburos edadpais), ///
		   legend(row(1) order(1 "Menor 35" 2 "Mayor 35")) ///
		   xlabel(1 "Colombia**" 6 "Ecuador" 11 "Peru" 16 "Bolivia" 21 "Venezuela***", noticks) ///
		   xtitle("Edad") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Cumplimiento normas ambientales y sociales hidrocarburos", span)
	graph export "$graficas\edad_normas_hidrocar.png", replace
restore

* ttest ddistribu_justice_mineria if pais==, by(mayor35)
preserve	
	collapse (mean) meanddistribu_justice_mineria=ddistribu_justice_mineria (sd) sdddistribu_justice_mineria=ddistribu_justice_mineria (count) n=ddistribu_justice_mineria, by(mayor35 pais)
		gen hiddistribu_justice_mineria = meanddistribu_justice_mineria + invttail(n-1,0.025)*(sdddistribu_justice_mineria/sqrt(n))	
		gen lowddistribu_justice_mineria = meanddistribu_justice_mineria - invttail(n-1,0.025)*(sdddistribu_justice_mineria/sqrt(n))	
		gen edadpais = mayor35 if pais==1
			replace edadpais = mayor35+5 if pais==2
			replace edadpais = mayor35+10 if pais==3
			replace edadpais = mayor35+15 if pais==4
			replace edadpais = mayor35+20 if pais==5
			sort edadpais
	twoway (bar meanddistribu_justice_mineria edadpais if mayor35==0) ///
		   (bar meanddistribu_justice_mineria edadpais if mayor35==1) ///
		   (rcap hiddistribu_justice_mineria lowddistribu_justice_mineria edadpais), ///
		   legend(row(1) order(1 "Menor 35" 2 "Mayor 35")) ///
		   xlabel(1 "Colombia" 6 "Ecuador***" 11 "Peru*" 16 "Bolivia**" 21 "Venezuela", noticks) ///
		   xtitle("Edad") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Justicia distributiva minería", span)
	graph export "$graficas\edad_distrib_mineria.png", replace
restore	

* ttest ddistribu_justice_hidroca if pais==, by(mayor35)
preserve	
	collapse (mean) meanddistribu_justice_hidroca=ddistribu_justice_hidroca (sd) sdddistribu_justice_hidroca=ddistribu_justice_hidroca (count) n=ddistribu_justice_hidroca, by(mayor35 pais)
		gen hiddistribu_justice_hidroca = meanddistribu_justice_hidroca + invttail(n-1,0.025)*(sdddistribu_justice_hidroca/sqrt(n))	
		gen lowddistribu_justice_hidroca = meanddistribu_justice_hidroca - invttail(n-1,0.025)*(sdddistribu_justice_hidroca/sqrt(n))	
		gen edadpais = mayor35 if pais==1
			replace edadpais = mayor35+5 if pais==2
			replace edadpais = mayor35+10 if pais==3
			replace edadpais = mayor35+15 if pais==4
			replace edadpais = mayor35+20 if pais==5
			sort edadpais
	twoway (bar meanddistribu_justice_hidroca edadpais if mayor35==0) ///
		   (bar meanddistribu_justice_hidroca edadpais if mayor35==1) ///
		   (rcap hiddistribu_justice_hidroca lowddistribu_justice_hidroca edadpais), ///
		   legend(row(1) order(1 "Menor 35" 2 "Mayor 35")) ///
		   xlabel(1 "Colombia***" 6 "Ecuador" 11 "Peru" 16 "Bolivia***" 21 "Venezuela", noticks) ///
		   xtitle("Edad") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Justicia distributiva hidrocarburos", span)
	graph export "$graficas\edad_distrib_hidro.png", replace
restore			
	
* ttest dprocedural_justice_mineria if pais==, by(mayor35)
preserve	
	collapse (mean) meandprocedural_justice_mineria=dprocedural_justice_mineria (sd) sddprocedural_justice_mineria=dprocedural_justice_mineria (count) n=dprocedural_justice_mineria, by(mayor35 pais)
		gen hidprocedural_justice_mineria = meandprocedural_justice_mineria + invttail(n-1,0.025)*(sddprocedural_justice_mineria/sqrt(n))	
		gen lowdprocedural_justice_mineria = meandprocedural_justice_mineria - invttail(n-1,0.025)*(sddprocedural_justice_mineria/sqrt(n))	
		gen edadpais = mayor35 if pais==1
			replace edadpais = mayor35+5 if pais==2
			replace edadpais = mayor35+10 if pais==3
			replace edadpais = mayor35+15 if pais==4
			replace edadpais = mayor35+20 if pais==5
			sort edadpais
	twoway (bar meandprocedural_justice_mineria edadpais if mayor35==0) ///
		   (bar meandprocedural_justice_mineria edadpais if mayor35==1) ///
		   (rcap hidprocedural_justice_mineria lowdprocedural_justice_mineria edadpais), ///
		   legend(row(1) order(1 "Menor 35" 2 "Mayor 35")) ///
		   xlabel(1 "Colombia***" 6 "Ecuador***" 11 "Peru**" 16 "Bolivia**" 21 "Venezuela***", noticks) ///
		   xtitle("Edad") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Justicia procedimental minería", span)
	graph export "$graficas\edad_proce_mineria.png", replace
restore	

* ttest dprocedural_justice_hidroca if pais==, by(mayor35)
preserve	
	collapse (mean) meandprocedural_justice_hidroca=dprocedural_justice_hidroca (sd) sddprocedural_justice_hidroca=dprocedural_justice_hidroca (count) n=dprocedural_justice_hidroca, by(mayor35 pais)
		gen hidprocedural_justice_hidroca = meandprocedural_justice_hidroca + invttail(n-1,0.025)*(sddprocedural_justice_hidroca/sqrt(n))	
		gen lowdprocedural_justice_hidroca = meandprocedural_justice_hidroca - invttail(n-1,0.025)*(sddprocedural_justice_hidroca/sqrt(n))	
		gen edadpais = mayor35 if pais==1
			replace edadpais = mayor35+5 if pais==2
			replace edadpais = mayor35+10 if pais==3
			replace edadpais = mayor35+15 if pais==4
			replace edadpais = mayor35+20 if pais==5
			sort edadpais
	twoway (bar meandprocedural_justice_hidroca edadpais if mayor35==0) ///
		   (bar meandprocedural_justice_hidroca edadpais if mayor35==1) ///
		   (rcap hidprocedural_justice_hidroca lowdprocedural_justice_hidroca edadpais), ///
		   legend(row(1) order(1 "Menor 35" 2 "Mayor 35")) ///
		   xlabel(1 "Colombia" 6 "Ecuador**" 11 "Peru***" 16 "Bolivia" 21 "Venezuela", noticks) ///
		   xtitle("Edad") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Justicia procedimental hidrocarburos", span)
	graph export "$graficas\edad_proce_hidro.png", replace
restore	

* ttest dforeignness_mineria if pais==, by(mayor35)
preserve	
	collapse (mean) meandforeignness_mineria=dforeignness_mineria (sd) sddforeignness_mineria=dforeignness_mineria (count) n=dforeignness_mineria, by(mayor35 pais)
		gen hidforeignness_mineria = meandforeignness_mineria + invttail(n-1,0.025)*(sddforeignness_mineria/sqrt(n))	
		gen lowdforeignness_mineria = meandforeignness_mineria - invttail(n-1,0.025)*(sddforeignness_mineria/sqrt(n))	
		gen edadpais = mayor35 if pais==1
			replace edadpais = mayor35+5 if pais==2
			replace edadpais = mayor35+10 if pais==3
			replace edadpais = mayor35+15 if pais==4
			replace edadpais = mayor35+20 if pais==5
			sort edadpais
	twoway (bar meandforeignness_mineria edadpais if mayor35==0) ///
		   (bar meandforeignness_mineria edadpais if mayor35==1) ///
		   (rcap hidforeignness_mineria lowdforeignness_mineria edadpais), ///
		   legend(row(1) order(1 "Menor 35" 2 "Mayor 35")) ///
		   xlabel(1 "Colombia**" 6 "Ecuador" 11 "Peru**" 16 "Bolivia" 21 "Venezuela", noticks) ///
		   xtitle("Edad") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Nacionalismo minería", span)
	graph export "$graficas\edad_nacional_mineria.png", replace
restore			
	
* ttest dforeignness_hidrocarburos if pais==, by(mayor35)
preserve	
	collapse (mean) meandforeignness_hidrocarburos=dforeignness_hidrocarburos (sd) sddforeignness_hidrocarburos=dforeignness_hidrocarburos (count) n=dforeignness_hidrocarburos, by(mayor35 pais)
		gen hidforeignness_hidrocarburos = meandforeignness_hidrocarburos + invttail(n-1,0.025)*(sddforeignness_hidrocarburos/sqrt(n))	
		gen lowdforeignness_hidrocarburos = meandforeignness_hidrocarburos - invttail(n-1,0.025)*(sddforeignness_hidrocarburos/sqrt(n))	
		gen edadpais = mayor35 if pais==1
			replace edadpais = mayor35+5 if pais==2
			replace edadpais = mayor35+10 if pais==3
			replace edadpais = mayor35+15 if pais==4
			replace edadpais = mayor35+20 if pais==5
			sort edadpais
	twoway (bar meandforeignness_hidrocarburos edadpais if mayor35==0) ///
		   (bar meandforeignness_hidrocarburos edadpais if mayor35==1) ///
		   (rcap hidforeignness_hidrocarburos lowdforeignness_hidrocarburos edadpais), ///
		   legend(row(1) order(1 "Menor 35" 2 "Mayor 35")) ///
		   xlabel(1 "Colombia" 6 "Ecuador" 11 "Peru" 16 "Bolivia" 21 "Venezuela**", noticks) ///
		   xtitle("Edad") ytitle("Porcentaje de personas con opinión positiva") ///
		   title("Nacionalismo hidrocarburos", span)
	graph export "$graficas\edad_nacional_hidro.png", replace
restore			


save "$workdir\extractivas_CAN.dta", replace



