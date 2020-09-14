# Maria Ines Vasquez 18250, Camila Gonzalez 18398, Cristina Bautista 16----
# Hoja de trabajo numero 10
# 17/05/2019

from neo4j import GraphDatabase

driver = GraphDatabase.driver("bolt://localhost:7687", auth=("neo4j", "123456"))

print("conecto")