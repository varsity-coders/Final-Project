class Shooter {

  PVector loc;  //bottom left point
  float l1, l2, h1, h2; //declare lengths and height of gun
  float c; //set color
  float x, y;  //set location
  float bSpeed;  //bullet speed
  float fr;  //gun firerate

  /*l1 = 5;
   l2 = 10;
   h1 = 10;
   h2 = 5;*/



  //constructor
  Shooter(float newC, float newX, float newY, float bs, float nFr) {
    c = newC;
    x = newX;
    y = newY;
    l1 = 5;
    l2 = 10;
    h1 = 10;
    h2 = 5;
    bSpeed = bs;
    fr = nFr;
    loc = new PVector(x, y);
  }

  void display() {
    fill(c);
    stroke(c);
    rect(x, y-h1, l1, h1);
    rect(x, y-h1, l2, h2);
  }

  void update() {
    loc.set(x, y);
  }
}