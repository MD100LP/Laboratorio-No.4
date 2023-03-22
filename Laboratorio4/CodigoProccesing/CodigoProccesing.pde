
//lIBRERIAS DE EL SENSOR

//LIBRERIAS PARA MONITOR SERIAL
import processing.serial.*;
Serial puertoSerie;
int valor=0;
PrintWriter output;


//LIBRERIAS PARA MySQL
import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;
MySQL msql;

//VARIABLES PARA OBTENER TEMPERATURA 
float C,F, temp=0, a=0, aux=0;
int num =0, num1=0;
//-----PARA OBTENER TEMPERATURAS--


void setup(){

  //----PARA EL SERIAL
  println(Serial.list());
  print("Calculando temperatura...");
  puertoSerie = new Serial(this, Serial.list()[0],9600);
  output =createWriter("temperatura.txt");
  size (800,400);
  //-------
  
    //-------PARA MySQL------
  String user ="root";
  String password ="Anthonie30";
  String database ="tempsarduino";
  msql = new MySQL (this, "localhost", database, user, password);
  if (msql.connect()){
    msql.query("SELECT * FROM `temperaturas`");
      msql.execute("INSERT TO `TemperaturaC` "+ valor);
    while(msql.next()){
      println(/*msql.getInt(1)+*/ msql.getString("TemperaturaC")/*+msql.getString(3)+*/+ " SI SE HA PODIDO CONECTAR");
    }
  }
  if (msql.connect()){
    msql.query("SELECT * FROM `temperaturas`");
     msql.execute("insert into `TemperaturaF` "+ valor);
     msql.execute("update `TemperaturaF`");
    while(msql.next()){
      println(msql.getString("`TemperaturaF`"));
    }
  }
  else 
  {
  println("No se podido establecer conexion con la base de datos");
  }
  //-------------
  
}
void draw(){
  
    
 if (puertoSerie.available() > 0){
   valor = puertoSerie.read();
   C= valor;   //*100)/1023;
   F=1.8*C+32;
    
 
 }
 
 text ("Temperatura = ",280,200);
 textSize(32);
 text (valor,480,200);
  textSize(32);
 
 text ("c ",547,200);
  textSize(32);
 println("");
 delay(500);
 
 
 print("Temperatura: ");
 print(C);
 print(" *C ");
 print("Temperatura: ");
 print(F);
 print(" *F ");
 
}
  
  // if (puertoSerie.available() > 0){
  //  String texto  = puertoSerie.readStringUntil('\n');
  //  if (texto != null){
  //   valor = int(trim(texto));
  //  }
  //  println(valor);
  
  //}  
