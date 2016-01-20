class Enemy {
  PImage image;
  PVector per;
  int frameRow;
  int frameColumn;
  float frameTime;
  float vel;   
  float x, y;
  Enemy() {
    image  = loadImage("enemy.png");
    vel = 3;
    x = width/2;
    y = height/2;
  }

  void display() {
    image(image, x, y);
  }
  void bossdisplay() {
  }
}