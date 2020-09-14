//MATCH (n) DETACH DELETE n
//MATCH (n) RETURN n;
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

//CONEXIONES
	(pGUATEMALA)-[:CONECTA]-> (pARGENTINA),
	(pGUATEMALA)-[:CONECTA]-> (pPARAGUAY),
	(pGUATEMALA)-[:CONECTA]-> (pMEXICO),
	(pGUATEMALA)-[:CONECTA]-> (pEEUU),
	(pBRAZIL)-[:CONECTA]-> (pGUATEMALA),
	(pBRAZIL)-[:CONECTA]-> (pPARAGUAY),
	(pBRAZIL)-[:CONECTA]-> (pEGIPTO),
	(pMEXICO)-[:CONECTA]-> (pPARAGUAY),
	(pMEXICO)-[:CONECTA]-> (pEEUU),
	(pRUSIA)-[:CONECTA]-> (pCHINA),
	(pCHINA)-[:CONECTA]-> (pBRAZIL),
	(pEEUU)-[:CONECTA]-> (pITALIA),
	(pITALIA)-[:CONECTA]-> (pRUSIA),
	(pITALIA)-[:CONECTA]-> (pMEXICO),
	(pITALIA)-[:CONECTA]-> (pEGIPTO),
	(pITALIA)-[:CONECTA]-> (pIRAN),
	(pEGIPTO)-[:CONECTA]-> (pIRAN),
	(pEGIPTO)-[:CONECTA]-> (pCHINA),
	(pIRAN)-[:CONECTA]-> (pCHINA),
	(pPARAGUAY)-[:CONECTA]-> (pITALIA),
	(pPARAGUAY)-[:CONECTA]-> (pEGIPTO),
	(pARGENTINA)-[:CONECTA]-> (pBRAZIL)