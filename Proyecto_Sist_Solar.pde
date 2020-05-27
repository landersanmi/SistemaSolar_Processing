import peasy.*;
import processing.sound.*;

int cantidadTexturas = 9;
int cantidadSonidos = 7;
int cantidadPlanetas = 5;

PImage[] textures = new PImage[cantidadTexturas];
SoundFile[] sounds = new SoundFile[cantidadSonidos];

boolean light = false;
boolean orbitar = false;
boolean rotar = false;
boolean agujeroNegro = false;

Sol sol;
Planeta[] planetas = new Planeta[cantidadPlanetas];
PeasyCam camara;

void setup() {
  size(1920, 1080, P3D);
  camara = new PeasyCam(this, 750,0,0,200);
  textures[0] = loadImage("textures/sol.jpg");
  textures[1] = loadImage("textures/mercurio.jpg");
  textures[2] = loadImage("textures/venus.jpg");
  textures[3] = loadImage("textures/tierra.jpg");
  textures[4] = loadImage("textures/marte.jpg");
  textures[5] = loadImage("textures/jupiter.jpg");
  textures[6] = loadImage("textures/estrellas.jpg");
  textures[7] = loadImage("textures/tierra_noche.jpg");
  textures[8] = loadImage("textures/agujeroNegro.jpg");
  
  sounds[0] = new SoundFile(this, "sounds/espacio.mp3");
  sounds[1] = new SoundFile(this, "sounds/sol.wav");
  sounds[2] = new SoundFile(this, "sounds/mercurio.mp3");
  sounds[3] = new SoundFile(this, "sounds/venus.mp3");
  sounds[4] = new SoundFile(this, "sounds/tierra.mp3");
  sounds[5] = new SoundFile(this, "sounds/marte.mp3");
  sounds[6] = new SoundFile(this, "sounds/jupiter.mp3");
  sounds[0].loop();

  sol = new Sol(250, 0, textures[0]);
  Planeta mercurio = new Planeta(3.83, 450, 0 ,textures[1], 5.88, 0.000241);
  Planeta venus = new Planeta(9.49, 600, 6.23083,textures[2], 24.4, 0.000615);
  Planeta tierra = new Planeta(10,750, 18.064158 ,textures[3], 0.1, 0.001);  //180º - (-23.5º) = 103.5 --> 18.064
  Planeta marte = new Planeta(5.32, 900, 3.57792,textures[4], 0.103, 0.00188);
  Planeta jupiter = new Planeta(112.1 , 1150, 3.19395,textures[5], 0.0415, 0.0119);
  
  planetas[0] = mercurio;
  planetas[1] = venus;
  planetas[2] = tierra;
  planetas[3] = marte;
  planetas[4] = jupiter;
}

void draw() {
  background(0);
  
  crearEstrellas();
  sol.display(light);
 
  for(int i = 0; i < cantidadPlanetas; i = i+1){
    planetas[i].display(orbitar, rotar);
  }
}

void keyTyped(){
    switch(key){
      case '1':
        camara = new PeasyCam(this, 0,0,0,600);
        cambiarMusica(1);
        break;
      case '2':
        camara = new PeasyCam(this, 450,0,0,200);
        cambiarMusica(2);
        break;
      case '3':
        camara = new PeasyCam(this, 600,0,0,200);
        cambiarMusica(3);
        break;
      case '4':
        camara = new PeasyCam(this, 750,0, 0,200);
        cambiarMusica(4);
        break;
      case '5':
        camara = new PeasyCam(this, 900,0, 0,200);
        cambiarMusica(5);
        break;
      case '6':
        camara = new PeasyCam(this, 1150,0, 0,300);
        cambiarMusica(6);
        break;
      case 'l':
        light = true;
        break;
      case 'o':
        orbitar = true;
        break;
      case 'r':
        rotar = true;
        break;
      case 'n':
        planetas[2].textura = textures[7];
        break;
      case 'b':
        agujeroNegro = true;
        break;
      case 'q':
        light = false;
        orbitar = false;
        rotar = false;
        planetas[2].textura = textures[3];
        cambiarMusica(0);
        break;   
    }
}

void crearEstrellas(){
  pushMatrix();
  noFill();
  noStroke();
  PShape estrellas = createShape(SPHERE, 7000);
  estrellas.setTexture(textures[6]);
  shape(estrellas);
  popMatrix();  
}

void cambiarMusica(int numero){
  for(int i = 0; i < cantidadSonidos; i++){
    if(sounds[i].isPlaying()){
      sounds[i].stop();
    }
  }
  sounds[numero].loop();
}
