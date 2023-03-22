#include <MySQL_Connection.h>
#include <MySQL_Cursor.h>
#include <MySQL_Encrypt_Sha1.h>
#include <MySQL_Packet.h>
#include <SPI.h>
#include <Ethernet.h>
#include <MySQL_Connection.h>
#include <MySQL_Cursor.h>

byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };


int lm35Pin = A1  ; // Pin analógico del LM35
float temperatura; // Variable para almacenar la temperatura
IPAddress server_addr(127,0,0,1); //  127.0.0.1Dirección IP del servidor MySQL
char user[] = "root"; // Nombre de usuario de MySQL
char password[] = ""; // Contraseña de MySQL
char database[] = "temparduino"; // Nombre de la base de datos
EthernetClient client;
MySQL_Connection conn((Client *)&client);

void setup() {
  Serial.begin(9600); // Inicializa la comunicación serial
  Ethernet.begin(mac);
  delay(1000);
  Serial.println("Connecting to MySQL...");
  if (conn.connect(server_addr, 3306, user, password)) {
    Serial.println("Connected to MySQL!");
    delay(1000);
  }
  else {
    Serial.println("Connection failed.");
  }
}

void loop() {
  // Lee el valor analógico del LM35
  int lectura = analogRead(lm35Pin);

  // Convierte el valor analógico a grados Celsius
  temperatura = (5.0 * lectura * 100.0) / 1024.0;

  // Muestra la temperatura en el monitor serial
  Serial.print("Temperatura: ");
  Serial.print(temperatura);
  Serial.println(" grados Celsius");

  delay(1000); // Espera un segundo antes de volver a leer la temperatura
}















//
//void setup() {
//  Serial.begin(9600);
//
//}
//
//void loop() {
//  val= analogRead(tempPin);
//  float mv =(val / 1024.0)* 5000.0;
//  float centi = mv /10;
////  float farth=5(centi*9)/5+32;
//  float farth = 5 (centi*9)7 5+32;
//  
//  Serial.print("TEMPERATURA EN GRADOS C*: ");
//  Serial.println(centi);
//  
//  Serial.print("TEMPERATURA EN GRADOS F*");
//  Serial.println(farth);
//  Serial.println();
//  delay(1000);
//  
//
//}
// const int pinSensor =A0;
//int valorDelSensor = 0;
//float temperatura = 0;
//int val;
//int tempPin = 1;
