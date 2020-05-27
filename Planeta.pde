public class Planeta{
  
  float radio;
  int distancia;
  float anguloInclinacion;
  PImage textura;
  float velRotacional;
  float velOrbital;
  
  PVector vector; 
  float angulo = random(TWO_PI);
  PShape planet;
  
  Planeta(float radio, int distancia, float anguloInclinacion, PImage textura, float velRotacional, float velOrbital){
    this.radio = radio;
    this.distancia = distancia;
    this.textura = textura;
    this.anguloInclinacion = anguloInclinacion;
    this.vector = new PVector(1,1,1);
    vector.mult(distancia);
    this.velRotacional = velRotacional;
    this.velOrbital = velOrbital;
  }
  
  void display(boolean orbitar, boolean rotar){  
    pushMatrix(); 
    
    if(orbitar){
      orbitar();
    }else if(rotar){
      translate(distancia, 0, 0);
      rotar();
    }else {
      translate(distancia, 0, 0);
    }
    
    noFill();
    noStroke();  
    planet = createShape(SPHERE, radio);
    planet.setTexture(textura);
    shape(planet);
    popMatrix();
  }
  
  void orbitar(){
    PVector v2 = new PVector(1,0,1);
    PVector perpendicular = vector.cross(v2);
    rotate(angulo,perpendicular.x, perpendicular.y, perpendicular.z);
    translate(vector.x, vector.y, vector.z);
    stroke(255);
    angulo+=velOrbital;
    line(0,0,0,vector.x, vector.y, vector.z);
    line(0,0,0,perpendicular.x, perpendicular.y, perpendicular.z);
  }
  
  void rotar(){
    anguloInclinacion = anguloInclinacion + velRotacional;
    rotateY(anguloInclinacion);
  }
  
}
