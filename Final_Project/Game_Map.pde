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
  float x4 = 4, y4 = height/2, w4 = 990, h4 = 80;
  void display() {
    background(100);
    stroke(0);
    strokeWeight(12);
    fill(255);
        rect(x, y, w, h);
    rect(x2, y2, w2, h2);
    rect(x3, y3, w3, h3);
    if (enemy.health <1 && enemy.health2 < 1 && enemy.health3 < 1 ){
      fill(0);
      textSize(32);
      text("Proceed to Next Dream",565,550);
    }
    
  }
  
  void survival() {
    background(100);
    fill(255);
    stroke(0);
        //strokeWeight(8);
    rect(x4, y4, w4, h4);
  }
}