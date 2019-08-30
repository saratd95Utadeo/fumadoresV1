PImage paisaje;
PFont fuente;

color verdeMent = #A5D9AF;
color azulOsc = #395D78;
color amarillo= #F9B500;
color naranja= #F48301;
String mje;
int tiempoLimite=10000;//30 seg
int seg=0;
int radioBtn=41;
int btn1X=116;
int btn1Y=441;
int btn2X=263;
int btn2Y=441;
zombie nuevoZombie;


void setup (){
  
  size(1366,664); //ancho,alto
 // background(#FFFFFF);
  fuente= createFont("Comfortaa-Regular.ttf",5);
  paisaje = loadImage("fondo.png");
  nuevoZombie = new zombie();
  
  ellipseMode(RADIUS); //por defecto viene en diametro
  
}//cierra setup



void draw(){
  background(#FFFFFF);
  //Colocar paisaje
  image(paisaje,0,0,1366,664); //(x,y,ancho,alto)
  
  //Crear texto pregunta 
  textFont(fuente,40); // el nro es el tamaño de a fuente pero no se recomienda cambiarlo porque se pixela
  fill(#000000);
  textAlign(CENTER);
  String s = "¿Fumas o te atreves a algo más?";
  text(s, 36, 185, 310.3, 190); //(texto, x, y, ancho, alto)
  
  
  /******************************* 
  ******BOTONES PRINCIPALES ******
  ********************************/
  // ---- BOTON FUMAR -----
  float dBtn1=dist(mouseX, mouseY,btn1X,btn1Y);//hallar distancia des centro del circulo al cursor
  noStroke();
     //hacer cambio de color al pasar mouse desntro del circulo
  if(dBtn1<radioBtn){
    fill(#14B2A3);
    //dibujar zombies si se oprime fumar
    if(mousePressed==true){
      nuevoZombie.movimiento();
  nuevoZombie.display();
      //image(zombie,0,0,74,126); //(x,y,ancho,alto)
    }
  }else{
    fill(verdeMent);
  }
  ellipse (btn1X,btn1Y,radioBtn,radioBtn);
  fill(#1C5556);
  textSize(20);
  text("fumar", 116, 446);
  
  // ---- BOTON ME ATREVO -----
  float dBtn2=dist(mouseX, mouseY,btn2X,btn2Y);//hallar distancia des centro del circulo al cursor
  noStroke();
     //hacer cambio de color al pasar mouse desntro del circulo
  if(dBtn2<radioBtn){
    fill(naranja);
    if(mousePressed){
      //contar los 30 seg y mostrar mensaje final
    int tiempoActual = millis();
    if(tiempoActual>tiempoLimite){
      finalTiempo();
    }
      //mostrar retos
    String[] verbos={"dibujar", "contar", "abrazar"};
    String[] cosas={"un árbol", "una nube", "una bici", "un poste"};
    int nVerbos= int(random(3));
    int nCosas= int(random(4));
    text(verbos[nVerbos],120,30);
    text(cosas[nCosas],120,100);
    
   }//cierra mousePressed 
  }else{
    fill(amarillo);
  }
  ellipse (btn2X,btn2Y,radioBtn,radioBtn);
  fill(#FFFFFF);
  textSize(20);
  text("me atrevo", 222, 413, 80,80);
  
  
}

/********************* 
  ******METODOS ******
  ********************/
void mostrarTexto(String mje, int x, int y, boolean txtCentrado) {
  fill(0);
  textSize(32);
    String nombreTxt= mje;
    float posTxt_X= x;
    if (txtCentrado) {
      float anchoTxt= textWidth(nombreTxt);
      posTxt_X= 500;//(width-anchoTxt)/2
    } 
    int textY= y;
    text(nombreTxt, posTxt_X, textY,560,500);
}

void finalTiempo() {
  noStroke();
  fill(#F2F2EB,127); //el 127 es de opacidad, representa 55% de opacidad
  //la opacidad se representa de 0 a 255
  //255 es un 100% de opacidad
  rect(500, 55, 580, 500, 7);
  String mje="Si piensas en cigarrillo fumas, si piensas en abrazar un árbol u otras cosas puedes cambiar el hábito.   En estos 30 segundos disminuiste tu nivel de estrés mucho más que al haber optado por un cigarrillo. ATREVETE";
    mostrarTexto(mje, 0, 120, true);
  }
  
  
class zombie{
  PImage zombieSrc;
  int posX=int(random(200, 450));
  int posY=int(random(20, 500));
  int ancho=74;
  int alto=126;
  float vel=5;
  //constructor sin param
  zombie(){};
    
  void display(){
    zombieSrc= loadImage("zombie.png");
    image(zombieSrc,posX,posY,ancho,alto); //(x,y,ancho,alto)
  }
  
  void movimiento(){
    // no se ve moviendose porq el background esta en setup
    //pero si pongo background en draw entonces no me dibuja mas de un zombie
    posX += vel;   
  }
}
