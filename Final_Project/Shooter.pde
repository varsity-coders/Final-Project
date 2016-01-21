class Shooter {

  PVector loc;  //loc of bullet shot
  PVector locb;
  PVector vel;  //speed of bullet?
  float c; //set color
  float x, y;  //set location
  float fr;  //gun firerate
  float diam;
  

  //constructor
  Shooter(float newC, float newX, float newY, float nFr, float tdiam) {
    c = newC;
    diam = tdiam;
    x = newX;
    y = newY;
    fr = nFr;
    loc = new PVector(x, y);
    
  }

  void display() {
    fill(c);
    stroke(c);
    ellipse(x,y,5,5);
  }
  
  void update(float nx, float ny) {
    x = nx;
    y = ny;
    loc = new PVector(x,y);
  }
  
  void shoot() {
    if (mousePressed) {
      
    }
  }

}