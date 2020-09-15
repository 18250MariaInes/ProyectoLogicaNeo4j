# Maria Ines Vasquez 18250, Camila Gonzalez 18398, Cristina Bautista 16----
# Proyecto 2
# 21/09/2020

from neo4j import GraphDatabase

driver = GraphDatabase.driver("bolt://localhost:7687", auth=("neo4j", "123456"))

#traer conexiones de paises
def conexionesPais(tx, pais):
    print("Conexiones de " + pais + "\n")
    cont = 0
    for pais in tx.run("MATCH (p:Pais {nombre: $pais})-[:CONECTA]->(p2:Pais) RETURN p2.nombre",
           pais=pais):
            cont = cont + 1
            print (str(cont) + ". " + pais["p2.nombre"])

#print(conexionesPais("Guatemala"))
print("conecto")
with driver.session() as session:
	session.read_transaction(conexionesPais, "Guatemala")
	print("--------------------------------------------------------")