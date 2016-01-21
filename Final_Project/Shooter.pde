class Shooter {

  PVector loc;  //bottom left point
  PVector vel; 
  float c; //set color
  float x, y;  //set location
  float bSpeed;  //bullet speed
  float fr;  //gun firerate
<<<<<<< HEAD

  /*l1 = 5;
   l2 = 10;
   h1 = 10;
   h2 = 5;*/


=======
  float diam;
  
>>>>>>> 4a5be64e1a755df1e62b5bfac729321e560916af

  //constructor
  Shooter(float newC, float newX, float newY, float bs, float nFr, float tdiam) {
    c = newC;
    diam = tdiam;
    x = newX;
    y = newY;
    bSpeed = bs;
    fr = nFr;
    loc = new PVector(x, y);
  }

  void display() {
    fill(c);
    stroke(c);
    ellipse(x,y,5,5);
  }

  void update() {
    loc.set(x, y);
  }
<<<<<<< HEAD
=======
  
  void shoot() {
    if (mousePressed) {
    }
  }

>>>>>>> 4a5be64e1a755df1e62b5bfac729321e560916af
}