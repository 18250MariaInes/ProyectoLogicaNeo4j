//MATCH (n) DETACH DELETE n
//MATCH (n) RETURN n;
//trae coxiones de un pais
//MATCH (p:Pais {nombre: "Guatemala"})-[:CONECTA]->(p2:Pais) RETURN p2.nombre;
//Trae hotel de pais
//MATCH (p:Pais {nombre: "Guatemala"})-[:HOSPEDAJE]->(h:Hotel) RETURN h.nombre;

//shortest path
//MATCH (start:Pais{nombre:"Guatemala"}), (end:Pais{nombre:"Egipto"})
CALL algo.shortestPath.stream(start, end, "precio")
YIELD nodeId
MATCH (other:Pais) WHERE id(other) = nodeId
RETURN other.nombre AS nombre

CREATE 
// PAISES

	(pGUATEMALA:Pais {nombre:"Guatemala"}),
	(pBRAZIL:Pais {nombre:"Brazil"}),
	(pMEXICO:Pais {nombre:"Mexico"}),
	(pRUSIA:Pais {nombre:"Rusia"}),
	(pCHINA:Pais {nombre:"China"}),
	(pEEUU:Pais {nombre:"Estados Unidos"}),
	(pITALIA:Pais {nombre:"Italia"}),
	(pEGIPTO:Pais {nombre:"Egipto"}),
	(pIRAN:Pais {nombre:"Irán"}),
	(pPARAGUAY:Pais {nombre:"Paraguay"}),
	(pARGENTINA:Pais {nombre:"Argentina"}),

// HOTELES

	(pCamino_Real:Hotel {nombre:"Camino_Real"}),
	(pAtlantico_Rio:Hotel {nombre:"Atlantico Rio"}),
	(pHotel_Amazonas:Hotel {nombre:"Hotel Amazonas"}),
	(pKazachi_Bereg:Hotel {nombre:"Kazachi Bereg"}),
	(pJin_Ying:Hotel {nombre:"Jin Ying"}),
	(pHILTON:Hotel {nombre:"Hilton"}),
	(pBaglio:Hotel {nombre:"Baglio"}),
	(pRamses:Hotel {nombre:"Ramses"}),
	(pShams:Hotel {nombre:"Shams"}),
	(pArmele:Hotel {nombre:"Armele"}),
	(pAustral:Hotel {nombre:"Austral"}),

//RELACION DE HOTEL A PAIS
	(pGUATEMALA)-[:HOSPEDAJE]-> (pCamino_Real),
	(pBRAZIL)-[:HOSPEDAJE]-> (pAtlantico_Rio),
	(pMEXICO)-[:HOSPEDAJE]-> (pHotel_Amazonas),
	(pRUSIA)-[:HOSPEDAJE]-> (pKazachi_Bereg),
	(pCHINA)-[:HOSPEDAJE]-> (pJin_Ying),
	(pEEUU)-[:HOSPEDAJE]-> (pHILTON),
	(pITALIA)-[:HOSPEDAJE]-> (pBaglio),
	(pEGIPTO)-[:HOSPEDAJE]-> (pRamses),
	(pIRAN)-[:HOSPEDAJE]-> (pShams),
	(pPARAGUAY)-[:HOSPEDAJE]-> (pArmele),
	(pARGENTINA)-[:HOSPEDAJE]-> (pAustral),

//CONEXIONES ENTRE PAISES
	(pGUATEMALA)-[:CONECTA {precio:500}]-> (pARGENTINA),
	(pGUATEMALA)-[:CONECTA {precio:430}]-> (pPARAGUAY),
	(pGUATEMALA)-[:CONECTA {precio:530}]-> (pMEXICO),
	(pGUATEMALA)-[:CONECTA {precio:260}]-> (pEEUU),
	(pBRAZIL)-[:CONECTA {precio:600}]-> (pGUATEMALA),
	(pBRAZIL)-[:CONECTA {precio:365}]-> (pPARAGUAY),
	(pBRAZIL)-[:CONECTA {precio:420}]-> (pEGIPTO),
	(pMEXICO)-[:CONECTA {precio:520}]-> (pPARAGUAY),
	(pMEXICO)-[:CONECTA {precio:540}]-> (pEEUU),
	(pRUSIA)-[:CONECTA {precio:230}]-> (pCHINA),
	(pCHINA)-[:CONECTA {precio:700}]-> (pBRAZIL),
	(pEEUU)-[:CONECTA {precio:400}]-> (pITALIA),
	(pITALIA)-[:CONECTA {precio:230}]-> (pRUSIA),
	(pITALIA)-[:CONECTA {precio:360}]-> (pMEXICO),
	(pITALIA)-[:CONECTA {precio:480}]-> (pEGIPTO),
	(pITALIA)-[:CONECTA {precio:610}]-> (pIRAN),
	(pEGIPTO)-[:CONECTA {precio:720}]-> (pIRAN),
	(pEGIPTO)-[:CONECTA {precio:680}]-> (pCHINA),
	(pIRAN)-[:CONECTA {precio:250}]-> (pCHINA),
	(pPARAGUAY)-[:CONECTA {precio:450}]-> (pITALIA),
	(pPARAGUAY)-[:CONECTA {precio:600}]-> (pEGIPTO),
	(pARGENTINA)-[:CONECTA {precio:230}]-> (pBRAZIL),

// RESTAURANTES

	(pCaoba_Farms:Restaurante {nombre:"Caoba Farms"}),
	(pCoco_Bambu:Restaurante {nombre:"Coco Bambu"}),
	(pThiara:Restaurante {nombre:"Thiara"}),
	(pDzhumbus:Restaurante {nombre:"Dzhumbus"}),
	(pMan_Wah:Restaurante {nombre:"Man_Wah"}),
	(pCafe_Gratitude:Restaurante {nombre:"Cafe Gratitude"}),
	(pPanzarotti:Restaurante {nombre:"Panzarotti"}),
	(pCulina:Restaurante {nombre:"Culina"}),
	(pShandiz_Mashad:Restaurante {nombre:"Shandiz Mashad"}),
	(pNa_Eustaquia:Restaurante {nombre:"Na Eustaquia"}),
	(pSacro:Restaurante {nombre:"Sacro"}),

//RELACION DE RESTAURANTE A PAIS
	(pGUATEMALA)-[:ALIMENTACION]-> (pCaoba_Farms),
	(pBRAZIL)-[:ALIMENTACION]-> (pCoco_Bambu),
	(pMEXICO)-[:ALIMENTACION]-> (pThiara),
	(pRUSIA)-[:ALIMENTACION]-> (pDzhumbus),
	(pCHINA)-[:ALIMENTACION]-> (pMan_Wah),
	(pEEUU)-[:ALIMENTACION]-> (pCafe_Gratitude),
	(pITALIA)-[:ALIMENTACION]-> (pPanzarotti),
	(pEGIPTO)-[:ALIMENTACION]-> (pCulina),
	(pIRAN)-[:ALIMENTACION]-> (pShandiz_Mashad),
	(pPARAGUAY)-[:ALIMENTACION]-> (pNa_Eustaquia),
	(pARGENTINA)-[:ALIMENTACION]-> (pSacro),

// LUGAR TURISTICO

	(pTikal:LugarTurisco {nombre:"Tikal"}),
	(pCristo_Redentor:LugarTurisco {nombre:"Cristo Redentor"}),
	(pXcaret:LugarTurisco {nombre:"Xcaret"}),
	(pPlaza_Roja:LugarTurisco {nombre:"Plaza Roja"}),
	(pMuralla_China:LugarTurisco {nombre:"Muralla China"}),
	(pYosemite:LugarTurisco {nombre:"Yosemite"}),
	(pCinque_Terre:LugarTurisco {nombre:"Cinque Terre"}),
	(pLa_Esfinge:LugarTurisco {nombre:"La Esfinge"}),
	(pPuente_Khaju:LugarTurisco {nombre:"Puente Khaju"}),
	(pTriple_Frontier:LugarTurisco {nombre:"Triple Frontier"}),
	(pLaguna_Esmeralda:LugarTurisco {nombre:"Laguna Esmeralda"}),

//RELACION DE LUGAR TURISTICO A PAIS
	(pGUATEMALA)-[:ATRACCION]-> (pTikal),
	(pBRAZIL)-[:ATRACCION]-> (pCristo_Redentor),
	(pMEXICO)-[:ATRACCION]-> (pXcaret),
	(pRUSIA)-[:ATRACCION]-> (pPlaza_Roja),
	(pCHINA)-[:ATRACCION]-> (pMuralla_China),
	(pEEUU)-[:ATRACCION]-> (pYosemite),
	(pITALIA)-[:ATRACCION]-> (pCinque_Terre),
	(pEGIPTO)-[:ATRACCION]-> (pLa_Esfinge),
	(pIRAN)-[:ATRACCION]-> (pPuente_Khaju),
	(pPARAGUAY)-[:ATRACCION]-> (pTriple_Frontier),
	(pARGENTINA)-[:ATRACCION]-> (pLaguna_Esmeralda)