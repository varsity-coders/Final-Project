class Pause {
  float c;
  float x = 0, y= 0, w=1000, h = 800;
  Pause() {
    c = 100;
  }
  void display() {
    fill(100, c);
    rect(x, y, w, h);
    textAlign(CENTER);
    textSize(72);
    fill(255);
    text("Paused", width/2, height/2);
    if (mousePressed) {
      if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseX < height) {
        w = 0;
      }
    }
  }
}