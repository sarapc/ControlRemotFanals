import mysql.connector
import json
import paho.mqtt.client as mqtt

# Desem les dades de la connexio
def desaCon(msg):
	jsonVar = json.loads(msg.payload)
	mycursor = mydb.cursor()
	sql = """DELETE FROM connection"""
	mycursor.execute(sql)
	mydb.commit()
	mycursor.close()
	mycursor = mydb.cursor()
	sql = """INSERT INTO connection(broker,port,user,password) VALUES (%s, %s, NULL, NULL)"""
	val = (jsonVar["broker"], jsonVar["port"])
	mycursor.execute(sql, val)
	mydb.commit()
	mycursor.close()

# desemles dades de la configuracio per als fanals
def desaConf(msg):
	jsonVar = json.loads(msg.payload)
	mycursor = mydb.cursor()
	sql = """DELETE FROM conf"""
	mycursor.execute(sql)
	mydb.commit()
	mycursor.close()
	mycursor = mydb.cursor()
	sql = """INSERT INTO conf(tema,missatge) VALUES (%s, %s)"""
	val = (jsonVar["tema"], jsonVar["mis"])
	mycursor.execute(sql, val)
	mydb.commit()
	mycursor.close()

#desem les dades de la pl
def desaPl(msg):
	jsonVar = json.loads(msg.payload)
	mycursor = mydb.cursor()
	sql = """INSERT INTO pl(plName, plNum) VALUES (%s, %s)"""
	val = (jsonVar["nomPl"], jsonVar["numPl"])
	mycursor.execute(sql, val)
	mydb.commit()
	mycursor.close()

#desem les posicions dels fanals a la pantalla
def desaPos(msg):
	jsonVar = json.loads(msg.payload)
	mycursor = mydb.cursor()
	sql = """INSERT INTO posicio(posName, posX, posY, plName) VALUES (%s, %s, %s, %s)"""
	val = (jsonVar["nomPos"], jsonVar["posX"], jsonVar["posY"], jsonVar["nomPl"])
	mycursor.execute(sql, val)
	mydb.commit()
	mycursor.close()

#desem els fanals
def desaFan(msg):
	jsonVar = json.loads(msg.payload)
	mycursor = mydb.cursor()
	sql = """INSERT INTO fanal(alias, mac, plName, tema) VALUES (%s, %s, %s, %s)"""
	val = (jsonVar["alias"], jsonVar["mac"], jsonVar["nomPl"], jsonVar["tema"])
	mycursor.execute(sql, val)
	mydb.commit()
	mycursor.close()

#desem els grups
def desaGr(msg):
	jsonVar = json.loads(msg.payload)
	mycursor = mydb.cursor()
	sql = """INSERT INTO grup(alias, nomConf, nomGrup, plName) VALUES (%s, %s, %s, %s)"""
	val = (jsonVar["alias"], jsonVar["nomConf"], jsonVar["nomGr"], jsonVar["nomPl"])
	mycursor.execute(sql, val)
	mydb.commit()
	mycursor.close()

#carrega de les dades inicial
def carregaDades(msg):
	if msg.payload == "Con":
		mycursor = mydb.cursor()
		sql = """SELECT broker, port FROM connection"""
		mycursor.execute(sql)
		resultat = mycursor.fetchall()
		llista = [resultat[0][0], resultat[0][1]]
		mycursor.close()
		x = '{"broker": "' + str(llista[0]) + '", "port": "' + str(llista[1]) + '"}' 
		print(x)
		client.publish("/configuracio/dadesCon",x)
	elif msg.payload == "LlistaPl":
		mycursor = mydb.cursor()
		sql = """SELECT DISTINCT plName FROM pl"""
		mycursor.execute(sql)
		resultat = mycursor.fetchall()
		for i in resultat:
			llista = [i[0]]
			x ='{"nomPl": "' + str(llista[0]) + '"}'
			client.publish("/configuracio/dadesLlistaPl",x)
			print(x)
		mycursor.close()
	elif msg.payload == "LlistaGr":
		mycursor = mydb.cursor()
		sql = """SELECT DISTINCT nomConf FROM grup"""
		mycursor.execute(sql)
		resultat = mycursor.fetchall()
		for i in resultat:
			llista = [i[0]]
			x ='{"nomGr": "' + str(llista[0]) + '"}'
			client.publish("/configuracio/dadesLlistaGr",x)
			print(x)
		mycursor.close()
	elif msg.payload == "Conf":
		mycursor = mydb.cursor()
		sql = """SELECT tema, missatge FROM conf"""
		mycursor.execute(sql)
		resultat = mycursor.fetchall()
		llista = [resultat[0][0], resultat[0][1]]
		mycursor.close()
		x = '{ "tema": "' + str(llista[0]) + '", "mis": "' + str(llista[1]) + '"}' 
		client.publish("/configuracio/dadesConf",x)
		pass	

#carrega de la pl seleccionada
def carregaPl(msg):
	mycursor = mydb.cursor()
	jsonVar = json.loads(msg.payload)
	sql = """SELECT * FROM pl WHERE plName = %s"""
	val = (str(jsonVar[u'nomPl']),)
	mycursor.execute(sql, val)
	resultat = mycursor.fetchall()
	llista = [resultat[0][0], resultat[0][1]]
	mycursor.close()
	x = '{"nomPl": "' + str(llista[0]) + '", "numPl": "' + str(llista[1]) + '"}' 
	print(x)
	client.publish("/configuracio/dadesPl",x)	
	mycursor = mydb.cursor()
	sql = """SELECT posName, posX, posY FROM posicio WHERE plName = %s"""
	val = (str(jsonVar[u'nomPl']),)
	mycursor.execute(sql, val)
	resultat = mycursor.fetchall()
	for i in resultat:
		llista = [i[0], i[1], i[2]]
		x ='{"nomPos": "' + str(llista[0]) + '", "posX": "' + str(llista[1]) + '", "posY": "' + str(llista[2]) + '"}'
		client.publish("/configuracio/dadesPos",x)
		print(x)
	mycursor.close()
	mycursor = mydb.cursor()
	sql = """SELECT alias, mac, tema FROM fanal WHERE plName = %s"""
	val = (str(jsonVar[u'nomPl']),)
	mycursor.execute(sql, val)
	resultat = mycursor.fetchall()
	for i in resultat:
		llista = [i[0], i[1], i[2]]
		x ='{"alias": "' + str(llista[0]) + '", "mac": "' + str(llista[1]) + '", "tema": "' + str(llista[2]) + '"}'
		client.publish("/configuracio/dadesFan",x)
		print(x)
	mycursor.close()

#carrega del grup seleccionat
def carregaGr(msg):
	mycursor = mydb.cursor()
	jsonVar = json.loads(msg.payload)
	sql = """SELECT DISTINCT nomGrup FROM grup WHERE plName = %s AND nomConf = %s"""
	val = (str(jsonVar[u'nomPl']),str(jsonVar[u'nomConf']))
	mycursor.execute(sql, val)
	resultat = mycursor.fetchall()
	for i in resultat:
		llista = [i[0]]
		x ='{"nomGr": "' + str(llista[0]) + '"}'
		client.publish("/configuracio/Gr",x)
		print(x)
	mycursor.close()
	mycursor = mydb.cursor()
	sql = """SELECT alias, nomGrup FROM grup WHERE plName = %s AND nomConf = %s"""
	val = (str(jsonVar[u'nomPl']),str(jsonVar[u'nomConf']))
	mycursor.execute(sql, val)
	resultat = mycursor.fetchall()
	for i in resultat:
		llista = [i[0], i[1]]
		x ='{"alias": "' + str(llista[0]) + '", "nomGr": "' + str(llista[1]) + '"}'
		client.publish("/configuracio/dadesGr",x)
		print(x)
	mycursor.close()

#funcio que gestiona l'arribada de missatges
def on_message(client, userdata, msg):
	print(msg.topic)
	print(msg.payload)
	if msg.topic == "/configuracio/desaCon":
		desaCon(msg)
	if msg.topic == "/configuracio/desaConf":
		desaConf(msg)
	elif msg.topic == "/configuracio/desaPl":
		desaPl(msg)
	elif msg.topic == "/configuracio/desaPos":
		desaPos(msg)
	elif msg.topic == "/configuracio/desaFan":
		desaFan(msg)
	elif msg.topic == "/configuracio/desaGr":
		desaGr(msg)
	elif msg.topic == "/configuracio/carrega":
		carregaDades(msg)
	elif msg.topic == "/configuracio/carregaPl":
		carregaPl(msg)
	elif msg.topic == "/configuracio/carregaGrNum":
		carregaGrNum(msg)
	elif msg.topic == "/configuracio/carregaGr":
		carregaGr(msg)
	elif msg.topic == "/configuracio/carregaGrFan":
		carregaGrFan(msg)

#connexio amb la base de dades  
mydb = mysql.connector.connect(user='ELTEUUSUARI', password='ELTEUPASSWORD', host='127.0.0.1', database='NOMBASEDEDADES', port=3306)

#creacio del client
client = mqtt.Client()

#connexio
client.connect("test.mosquitto.org",1883,60)

#temes als que es subscriu
client.subscribe("/configuracio/#")

#listenner
client.on_message = on_message

#loop infinit
client.loop_forever()