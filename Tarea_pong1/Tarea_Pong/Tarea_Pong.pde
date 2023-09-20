import processing.serial.*; //Libreria datos puerto serial
Serial MyPort;
//Posicion inicial de la pelota
int y=100;
int x=100;
//Tener en cuenta que la velocidad es la diferencia recorrida en distancia en segmento de tiempo
//Velocidad inicial de la pelota
int vy=3;
int vx=3;
//Desplazamiento den x de la paleta
int RelativePositionX;
//Información a través del puerto
String val="";
//Variable numerica del puerto
float value;
//Posicion inicial paleta
int xb;
//Posicion relativa que cambia con puerto
void setup(){
  //En el canvas todos los valores en x aumentan hacia la derecha y en y de arriba hacia abajo
  size(600,450);
  //Definir puerto
  MyPort=new Serial(this,"COM5",9600);
}
//Funcion para calculos de lo que se hará
void draw(){
  //Comunicación
  //ver si está disponible: en caso de que esté disponible enviará un numero mayor a 0
  if(MyPort.available()>0){
    //Leer todos los valores de los datos hasta el salto de linea (motivo en el arudino del println)
    val=MyPort.readStringUntil('\n');
  //En caso de que por alguna razón java no me envíe algún numero lo que hace es reiniciar y tomar de nuevo el número
    if(val==null){
      return;
    }
  //Casteo de cadena de caracteres de String a float
  value=float(val);
  }
  //Que hacer con el valor
  if(value==1){ //ir para la izquierda
    RelativePositionX-=10;
  }
  else if(value==2){ //ir para la derecha
    RelativePositionX+=10;
  }
  //Dibujar paleta
  background(0,1,23);//Color fondo
  xb=200+RelativePositionX; //outset+posición
  fill(19,168,254);
  rect(xb,420, 180,30); //Pos inicial en x, en y y dimensiones de la recta
  //Para la bolita
  fill(207,0,96);
  ellipse(x,y,40,40); //Pos inicial en x y y y dimensiones
  //añadir velocidad a la elipse
  x+=vx;
  //Establecer limites para que rebote en x
  if(x>580||x<20){
    vx=vx*-1;
  }
  y+=vy;
  if(y>height||y<0){
    vy=vy*-1;
  }
  //Establecer colisiones:
  //
    if(y>=410&&(x<xb+180)&&(x>xb)){
      //Si choca con la barra o paleta aumentar velocidad en y
      vy=-(vy+2);
        //Si choca con la barra o paleta aumentar velocidad en x
      vx+=1;
    }
    //Si no toca la barra 
    if(y>=450){
      x=100;
      y=100;
      vx=3;
      vy=3;
    }
}
