class Map {
  float x=0;
  float y=height/2+200;
  float w=600;
  float h=50;
  float x2=0;
  float y2=height/2-200;
  float w2=600;
  float h2=50;
  float x3=400;
  float y3=height/2;
  float w3=600;
  float h3=50;
  float x4 = 4, y4 = height/2, w4 = 990, h4 = 80;
  float x5=0;
  float y5=height/2+650;
  float w5=600;
  float h5=35;
  float x6=400;
  float y6=height/2+475;
  float w6=600;
  float h6=35;
  float x7=0;
  float y7=height/2+275;
  float w7=600;
  float h7=35;
  float x8=400;
  float y8=height/2+75;
  float w8=600;
  float h8=35;
  void display() {
    background(100);
    stroke(0);
    //strokeWeight(12);
    fill(255);
    rect(x2, y2, w2, h2);
    rect(x, y, w, h);
    rect(x3, y3, w3, h3);
  }
  void display3() {
    background(153,50,204);
    fill(255);
    stroke(0);
    rect(x5,y5,w5,h5);
    rect(x6,y6,w6,h6);
    rect(x7,y7,w7,h7);
    rect(x8,y8,w8,h8);

}
  void survival() {
    background(100);
    fill(255);
    stroke(0);
        //strokeWeight(8);
    rect(x4, y4, w4, h4);
  }
}