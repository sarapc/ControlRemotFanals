#include <EEPROM.h>
#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#include <Wire.h>
#include <ArduinoJson.h>
#include "credentials.h"

//constants
#define TEMA_PUBLICA_MAC "/configuracio/resposta"
#define TEMA_SUBSCRIPCIO_MAC "/configuracio/envia"

//variables 
WiFiClient espClient;
PubSubClient client(espClient);
char ma[18];
char subColor[19];
byte mac[6];
const byte ledRed = 15, ledGreen = 12, ledBlue = 13;

//funcio que gestiona els missatges que arriben
void callback(char* topic, byte* payload, unsigned int length) {
  String szRx = "", szTema(topic);

  Serial.print("Message arrived [");
  Serial.print(topic);
  Serial.print("] ");
  for (int i = 0; i < length; i++) {
    char receivedChar = (char)payload[i];
    szRx += receivedChar;
  }
  Serial.println(szRx);
  if (szTema == subColor) {
    
    StaticJsonBuffer<100> jsonbuffer;
    JsonObject& root = jsonbuffer.parseObject(szRx);

    short r = root["R"];
    short g = root["G"];
    short b = root["B"];
    short w = root["W"];

    analogWrite(ledBlue, b);
    analogWrite(ledGreen, g);
    analogWrite(ledRed, r);  
  }
  if (szTema == TEMA_SUBSCRIPCIO_MAC) {
    if(szRx == "mac"){
      client.publish(TEMA_PUBLICA_MAC,ma);
    }
  }
}

//funcio que permet la reconnexio mqtt si aquesta es perd
void reconnect() {
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    if (client.connect(ma)) {
      Serial.println("connected");
      client.subscribe(TEMA_SUBSCRIPCIO_MAC);
      client.subscribe(subColor);
    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      delay(5000);
    }
  }
}

//funcio per a iniciar la connexio a internet
void setup_wifi() {
  delay(10);
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

//funcio de posada en marxa que recupera la mac i crida les altres funcions
void setup() {
  Serial.begin(115200);
  pinMode(ledRed, OUTPUT);
  pinMode(ledGreen, OUTPUT);
  pinMode(ledBlue, OUTPUT);

  setup_wifi();
  
  WiFi.macAddress(mac);
  for(int i = 0; i <6; i++){
    byte nib1 = (mac[i] >> 4) & 0x0F;
    byte nib2 = (mac[i] >> 0) & 0x0F;
    ma[i*3+0] = nib1  < 0xA ? '0' + nib1  : 'A' + nib1  - 0xA;
    ma[i*3+1] = nib2  < 0xA ? '0' + nib2  : 'A' + nib2  - 0xA;
    if(i!=5){
      ma[i*3+2] = ':';
    }
  }
  ma[18] = '\0';

  subColor[0]='/';
  for(int i=0; i<18; i++){
    subColor[i+1] = ma[i];
  }
  
  client.setServer(mqtt_server, mqtt_port);
  client.setCallback(callback);
}

//bucle infinit
void loop() {
  if (!client.connected()) {
    reconnect();
  }
  client.loop();
}
