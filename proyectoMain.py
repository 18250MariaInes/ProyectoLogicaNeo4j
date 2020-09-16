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

#shortest path
def shortestPath(tx, p1, p2):
    print("Camino más corto y económico desde " + p1 + " a " + p2 + "\n")
    precio="precio"
    cont = 0
    for pais in tx.run("MATCH (start:Pais{nombre:$p1}), (end:Pais{nombre:$p2}) CALL algo.shortestPath.stream(start, end, 'precio') YIELD nodeId MATCH (other:Pais) WHERE id(other) = nodeId RETURN other.nombre",
           p1=p1, p2=p2):
            cont = cont + 1
            print (str(cont) + ". " + pais["other.nombre"])

def validarNumero(variable): 
    try:
        variable = int(variable)
        return True
    except ValueError:
        return False

print("PROYECTO 2 DE LÓGICA: ORGANIZADOR DE VIAJES")
with driver.session() as session:
	elec=0
	print("------BIENVENIDO A NODOTRIP------")
	while (elec!=6):
		print("\n\nIngrese opcion que desea realizar\n")
		print("1. Ver paises relacionados a un pais\n")
		print("2. Ver hoteles en un pais\n")
		print("3. Ver restaurantes en un pais\n")
		print("4. Ver lugares turisticos en un pais\n")
		print("5. Ver la ruta de menor costo desde el pais origen hacia el destino\n")
		print("6. Salir\n")
		elec=input("")
		# si ingresa una opcion incorrecta
		if ((validarNumero(elec)==False) or (int(elec)==0) or (int(elec)>6)):
			print("¡¡¡¡¡Ingresaste una opcion incorrecta!!!!\n")
		else:
			elec = int(elec)
			if (elec==1):
				print("\n-_-_-_-_-_-_Paises relacionados-_-_-_-_-_-_\n")
				pais=input("Pais: ")
				session.read_transaction(conexionesPais, pais)
				print("----------------------------------------------")
			elif (elec==2):
				print("\n-_-_-_-_-_-_Hoteles en pais-_-_-_-_-_-_\n")
				pais=input("Pais: ")
				session.read_transaction(hotelPais, "Guatemala")
				print("----------------------------------------------")
			elif (elec==3):
				print("\n-_-_-_-_-_-_Restaurantes en pais-_-_-_-_-_-_\n")
				pais=input("Pais: ")
				session.read_transaction(restaurantePais, pais)
				print("----------------------------------------------")
			elif (elec==4):
				print("\n-_-_-_-_-_-_Lugares turisticos en pais-_-_-_-_-_-_\n")
				pais=input("Pais: ")
				session.read_transaction(atraccionPais, pais)
				print("----------------------------------------------")
			elif (elec==5):
				print("\n-_-_-_-_-_-_Ruta mas corta hacia destino-_-_-_-_-_-_\n")
				p1=input("Pais de origen: ")
				p2=input("Pais destino: ")
				session.read_transaction(shortestPath, p1, p2)
				print("----------------------------------------------")
	if(elec==6):
		print("Hasta luego!")
		session.close()