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

#hotel de pais
def hotelPais(tx, pais):
    print("Hotel de " + pais + "\n")
    cont = 0
    for pais in tx.run("MATCH (p:Pais {nombre: $pais})-[:HOSPEDAJE]->(h:Hotel) RETURN h.nombre",
           pais=pais):
            cont = cont + 1
            print (str(cont) + ". " + pais["h.nombre"])
#restaurante de pais
def restaurantePais(tx, pais):
    print("Restaurante de " + pais + "\n")
    cont = 0
    for pais in tx.run("MATCH (p:Pais {nombre: $pais})-[:ALIMENTACION]->(r:Restaurante) RETURN r.nombre",
           pais=pais):
            cont = cont + 1
            print (str(cont) + ". " + pais["r.nombre"])

#atraccion de pais
def atraccionPais(tx, pais):
    print("Atracción de " + pais + "\n")
    cont = 0
    for pais in tx.run("MATCH (p:Pais {nombre: $pais})-[:ATRACCION]->(t:LugarTurisco) RETURN t.nombre",
           pais=pais):
            cont = cont + 1
            print (str(cont) + ". " + pais["t.nombre"])

#print(conexionesPais("Guatemala"))
print("conecto")
with driver.session() as session:
	session.read_transaction(conexionesPais, "Guatemala")
	print("--------------------------------------------------------")
	session.read_transaction(hotelPais, "Guatemala")
	print("--------------------------------------------------------")
	session.read_transaction(restaurantePais, "Guatemala")
	print("--------------------------------------------------------")
	session.read_transaction(atraccionPais, "Guatemala")
	print("--------------------------------------------------------")