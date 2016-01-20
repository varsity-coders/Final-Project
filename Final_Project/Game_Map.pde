class Map{
  float x=0;
  float y=height/2+200;
  float w=600;
  float h=50;
  
void display(){
  stroke(0);
  strokeWeight(12);
    fill(255);
    rect(x,y,w,h);
  }
}