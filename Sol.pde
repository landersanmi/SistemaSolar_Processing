public class Sol{
  
  float radio;
  int distancia;
  PImage textura;
  PShape sol;
  
  Sol(float radio, int distancia, PImage textura){
    this.radio = radio;
    this.distancia = distancia;
    this.textura = textura;
  }
  
  void display(boolean light){
    translate(distancia,0,0);
    pushMatrix();
    noFill();
    noStroke();
  
    PShape sol = createShape(SPHERE, radio);
    sol.setTexture(textures[0]);
    shape(sol);
  
    if(light) 
      pointLight(255, 255, 255, 0, 0, 0);  
  
    popMatrix();  
  }
  
  
 
}
