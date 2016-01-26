class Map {
  float x=0;
  float y=height/2-200;
  float w=600;
  float h=50;
  float x2=400;
  float y2=height/2;
  float w2=600;
  float h2=50;
  float x3=0;
  float y3=height/2+200;
  float w3=1000;
  float h3=50;
  
  float x4=400;
  float y4=height/2-200;
  float w4=600;
  float h4=40;
  float x5=0;
  float y5=height/2;
  float w5=700;
  float h5=40;
  float x6=0;
  float y6=height/2+200;
  float w6=1000;
  float h6=40;

  float xBOSS=0;
  float yBOSS=500;
  float wBOSS= 1000;
  float hBOSS= 100;

  //float x7 = 4, y7 = height/2, w7 = 990, h7 = 80;
  void display() {
    background(100);
    stroke(0);
    strokeWeight(12);
    fill(255);
    rect(x, y, w, h);
    rect(x2, y2, w2, h2);
    rect(x3, y3, w3, h3);
    if (enemy.health <1 && enemy.health2 < 1 && enemy.health3 < 1 ) {
      fill(0);
      textSize(32);
      text("Proceed to Next Dream", 565, 550);
    }
  }
  void display2() {
    background(160, 206, 222);
    fill(255);
    stroke(0);
    strokeWeight(12);
    rect(x4, y4, w4, h4);
    rect(x5, y5, w5, h5);
    rect(x6, y6, w6, h6);
    if (enemy.health4 <1 && enemy.health5 < 1 && enemy.health6 < 1 ) {
      fill(0);
      textSize(32);
      //text("Proceed to Next Dream", 565, 550);
    }
  }
  void displayBOSS () {
    background(100);
    stroke(0);
    strokeWeight(12);
    fill(255);
    rect(xBOSS, yBOSS, wBOSS, hBOSS);
  }

  /*void survival() {
   background(100);
   fill(255);
   stroke(0);
   //strokeWeight(8);
   rect(x4, y4, w4, h4);
   }
   */
}