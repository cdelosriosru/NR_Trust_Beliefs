********************************************************************************
*Projecto: "Percepción de las extractivas en CAN"			   				   *
*Descripción: En este do-file corro regresiones.							   *
*Datasets usados: 															   *
* extractivas_CAN.dta														   *						
*Autor: Lina Díaz 															   *
*Fecha: 06/03/2021															   *
*Stata 14																	   *
********************************************************************************

clear all
set more off
global workdir "C:\Users\lina_\OneDrive - Inter-American Development Bank Group\Natural resources Trust Beliefs\Encuesta Opinión Pública + Extractivas"
*global workdir "C:\Users\linad\OneDrive - Inter-American Development Bank Group\Natural resources Trust Beliefs\Encuesta Opinión Pública + Extractivas"


use "$workdir\extractivas_CAN.dta", clear


********************************************************************************
************************* REGRESIONES SIN VENEZUELA ****************************
********************************************************************************	

preserve
drop if pais==5
	
	gen catolico=0
		replace catolico=1 if p19ycuálessureligiónactu=="Católica" 
		
	gen democracia=0
		replace democracia=1 if p20concuáldelassiguientes=="La democracia es preferible a cualquier otra forma de gobier"
        replace democracia=1 if p20concuáldelassiguientes=="La democracia es preferible a cualquier otra forma de gobierno"
		
	gen presidente_resuelve=.
		replace presidente_resuelve=4 if p8cuánprobablecreeustedqu=="Mucho"
		replace presidente_resuelve=3 if p8cuánprobablecreeustedqu=="Algo"
		replace presidente_resuelve=2 if p8cuánprobablecreeustedqu=="Poco"
		replace presidente_resuelve=1 if p8cuánprobablecreeustedqu=="Nada"
		
	gen presidente_pueblo=.
		replace presidente_pueblo=4 if p15conquéfrecuenciacreequ=="Siempre"
		replace presidente_pueblo=3 if p15conquéfrecuenciacreequ=="Casi siempre"
		replace presidente_pueblo=2 if p15conquéfrecuenciacreequ=="Casi nunca"
		replace presidente_pueblo=1 if p15conquéfrecuenciacreequ=="Nunca"
		
	gen presidente_pandemia=.
		replace presidente_pandemia=5 if p25cuálessuopinióndelam=="Muy bien"
		replace presidente_pandemia=4 if p25cuálessuopinióndelam=="Algo bien"
		replace presidente_pandemia=3 if p25cuálessuopinióndelam=="Ni bien ni mal"
		replace presidente_pandemia=2 if p25cuálessuopinióndelam=="Algo mal"
		replace presidente_pandemia=1 if p25cuálessuopinióndelam=="Muy mal"
				
	pca presidente_resuelve presidente_pueblo presidente_pandemia
	screeplot, yline(1) ci(het)
	predict pc1 pc2, score
	correlate pc1 pc2
			
	/* Mineria */
	xi: reg dpercepcion_mineria dnormas_mineria ddistribu_justice_mineria ///
		dprocedural_justice_mineria dforeignness_mineria mujer edu_superior mayor35 ///
		rural catolico i.informacion_mineria democracia i.presidente_pueblo i.pais , r
		outreg2 using percep_mineria.tex, label ctitle(CAN) replace
	xi: reg dpercepcion_mineria dnormas_mineria ddistribu_justice_mineria ///
		dprocedural_justice_mineria dforeignness_mineria mujer edu_superior mayor35 ///
		rural catolico i.informacion_mineria democracia i.presidente_pueblo if pais==1, r
		outreg2 using percep_mineria.tex, label ctitle(Colombia) append
	xi: reg dpercepcion_mineria dnormas_mineria ddistribu_justice_mineria ///
		dprocedural_justice_mineria dforeignness_mineria mujer edu_superior mayor35 ///
		rural catolico i.informacion_mineria democracia i.presidente_pueblo if pais==2, r
		outreg2 using percep_mineria.tex, label ctitle(Peru) append
	xi: reg dpercepcion_mineria dnormas_mineria ddistribu_justice_mineria ///
		dprocedural_justice_mineria dforeignness_mineria mujer edu_superior mayor35 ///
		rural catolico i.informacion_mineria democracia i.presidente_pueblo if pais==3, r
		outreg2 using percep_mineria.tex, label ctitle(Ecuador) append
	xi: reg dpercepcion_mineria dnormas_mineria ddistribu_justice_mineria ///
		dprocedural_justice_mineria dforeignness_mineria mujer edu_superior mayor35 ///
		rural catolico i.informacion_mineria democracia i.presidente_pueblo if pais==4, r
		outreg2 using percep_mineria.tex, label ctitle(Bolivia) append
		
	/* Hidrocarburos */
	xi: reg dpercepcion_hidrocarburos dnormas_hidrocarburos ddistribu_justice_hidroca ///
		dprocedural_justice_hidroca dforeignness_hidrocarburos mujer edu_superior mayor35 ///
		rural catolico i.informacion_hidrocarburos democracia i.presidente_pueblo i.pais, r
		outreg2 using percep_hidro.tex, label ctitle(CAN) replace
	xi: reg dpercepcion_hidrocarburos dnormas_hidrocarburos ddistribu_justice_hidroca ///
		dprocedural_justice_hidroca dforeignness_hidrocarburos mujer edu_superior mayor35 ///
		rural catolico i.informacion_hidrocarburos democracia i.presidente_pueblo if pais==1, r
		outreg2 using percep_hidro.tex, label ctitle(Colombia) append
	xi: reg dpercepcion_hidrocarburos dnormas_hidrocarburos ddistribu_justice_hidroca ///
		dprocedural_justice_hidroca dforeignness_hidrocarburos mujer edu_superior mayor35 ///
		rural catolico i.informacion_hidrocarburos democracia i.presidente_pueblo if pais==2, r
		outreg2 using percep_hidro.tex, label ctitle(Peru) append
	xi: reg dpercepcion_hidrocarburos dnormas_hidrocarburos ddistribu_justice_hidroca ///
		dprocedural_justice_hidroca dforeignness_hidrocarburos mujer edu_superior mayor35 ///
		rural catolico i.informacion_hidrocarburos democracia i.presidente_pueblo if pais==3, r
		outreg2 using percep_hidro.tex, label ctitle(Ecuador) append
	xi: reg dpercepcion_hidrocarburos dnormas_hidrocarburos ddistribu_justice_hidroca ///
		dprocedural_justice_hidroca dforeignness_hidrocarburos mujer edu_superior mayor35 ///
		rural catolico i.informacion_hidrocarburos democracia i.presidente_pueblo if pais==4, r
		outreg2 using percep_hidro.tex, label ctitle(Bolivia) append

restore
	
********************************************************************************
************************* REGRESIONES CON VENEZUELA ****************************
********************************************************************************

/* Mineria */
xi: reg dpercepcion_mineria dnormas_mineria ddistribu_justice_mineria ///
	dprocedural_justice_mineria dforeignness_mineria mujer edu_superior mayor35 ///
	i.informacion_mineria i.pais, r
	outreg2 using percep_mineria2.tex, label ctitle(CAN) replace
xi: reg dpercepcion_mineria dnormas_mineria ddistribu_justice_mineria ///
	dprocedural_justice_mineria dforeignness_mineria mujer edu_superior mayor35 ///
	i.informacion_mineria if pais==1, r
	outreg2 using percep_mineria2.tex, label ctitle(Colombia) append
xi: reg dpercepcion_mineria dnormas_mineria ddistribu_justice_mineria ///
	dprocedural_justice_mineria dforeignness_mineria mujer edu_superior mayor35 ///
	i.informacion_mineria if pais==2, r
	outreg2 using percep_mineria2.tex, label ctitle(Peru) append
xi: reg dpercepcion_mineria dnormas_mineria ddistribu_justice_mineria ///
	dprocedural_justice_mineria dforeignness_mineria mujer edu_superior mayor35 ///
	i.informacion_mineria if pais==3, r
	outreg2 using percep_mineria2.tex, label ctitle(Ecuador) append
xi: reg dpercepcion_mineria dnormas_mineria ddistribu_justice_mineria ///
	dprocedural_justice_mineria dforeignness_mineria mujer edu_superior mayor35 ///
	i.informacion_mineria if pais==4, r
	outreg2 using percep_mineria2.tex, label ctitle(Bolivia) append
xi: reg dpercepcion_mineria dnormas_mineria ddistribu_justice_mineria ///
	dprocedural_justice_mineria dforeignness_mineria mujer edu_superior mayor35 ///
	i.informacion_mineria if pais==5, r
	outreg2 using percep_mineria2.tex, label ctitle(Venezuela) append
	
/* Hidrocarburos */
xi: reg dpercepcion_hidrocarburos dnormas_hidrocarburos ddistribu_justice_hidroca ///
	dprocedural_justice_hidroca dforeignness_hidrocarburos mujer edu_superior mayor35 ///
	i.informacion_hidrocarburos i.pais, r
	outreg2 using percep_hidro2.tex, label ctitle(CAN) replace
xi: reg dpercepcion_hidrocarburos dnormas_hidrocarburos ddistribu_justice_hidroca ///
	dprocedural_justice_hidroca dforeignness_hidrocarburos mujer edu_superior mayor35 ///
	i.informacion_hidrocarburos if pais==1, r
	outreg2 using percep_hidro2.tex, label ctitle(Colombia) append
xi: reg dpercepcion_hidrocarburos dnormas_hidrocarburos ddistribu_justice_hidroca ///
	dprocedural_justice_hidroca dforeignness_hidrocarburos mujer edu_superior mayor35 ///
	i.informacion_hidrocarburos if pais==2, r
	outreg2 using percep_hidro2.tex, label ctitle(Peru) append
xi: reg dpercepcion_hidrocarburos dnormas_hidrocarburos ddistribu_justice_hidroca ///
	dprocedural_justice_hidroca dforeignness_hidrocarburos mujer edu_superior mayor35 ///
	i.informacion_hidrocarburos if pais==3, r
	outreg2 using percep_hidro2.tex, label ctitle(Ecuador) append
xi: reg dpercepcion_hidrocarburos dnormas_hidrocarburos ddistribu_justice_hidroca ///
	dprocedural_justice_hidroca dforeignness_hidrocarburos mujer edu_superior mayor35 ///
	i.informacion_hidrocarburos if pais==4, r
	outreg2 using percep_hidro2.tex, label ctitle(Bolivia) append
xi: reg dpercepcion_hidrocarburos dnormas_hidrocarburos ddistribu_justice_hidroca ///
	dprocedural_justice_hidroca dforeignness_hidrocarburos mujer edu_superior mayor35 ///
	i.informacion_hidrocarburos if pais==5, r
	outreg2 using percep_hidro2.tex, label ctitle(Venezuela) append
	
	
	
********************************************************************************
*********************************** COVARIATES *********************************
********************************************************************************

/* Intenté controlar por las siguientes variables pero se reduce mucho el N */
	
	p4ensuopinióncuandousted //Mineria N=3691, hidrocarburos N=3740
	p5cuáleslaopiniónquetien //Mineria N=3694, hidrocarburos N=3763
	
	*Las preguntas de ingresos son las siguientes, pero no se hicieron en todos 
	*los países:
	*¿trabaja usted tiempo completo en algún empleo remunerado o que recibe paga?
	*¿Cuáles son los ingresos mensuales de todos los miembros de la familia que trabajan en este hogar?
