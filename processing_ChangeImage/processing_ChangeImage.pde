/*
 *  xavidominguez@gmail.com
 *  @xavidominguez
 *  xavidominguez.com
 */
 
import processing.serial.*; //Importamos la librería Serial
 
Serial port;
int cambia;

PImage images[];
int index = 0;
void setup(){
  println(Serial.list());
  port = new Serial(this, Serial.list()[1], 9600); 
  size(1280,800);
  images = new PImage[7];
  images[0] = loadImage( "fabkids1.jpg" );
  images[1] = loadImage( "fabkids2.jpg" );
  index = 0;
}

void draw(){
 image( images[index], 0, 0 );
 if(port.available() > 0) // si hay algún dato disponible en el puerto
   {
     cambia=port.read();//Lee el dato y lo almacena en la variable "valor"
     println(cambia);
     if(cambia==0){
       if( index <1){
          index++;
       }else{
          index = 0;
       }
     }
   }
}