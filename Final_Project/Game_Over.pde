class Over {
  void display() {
    background(0);
    textSize(72);
    textAlign(CENTER);
    text("Game Over", width/2, height/2);
        textSize(48);
    text("Press Space to Go Back to Menu", width/2, height/2+100);
    if (keyPressed) {
      if (key == ' ') {
        stage =2;
      }
    }
  }
  void survival() {
    background(0);
    textSize(72);
    textAlign(CENTER);
    text("You Failed", width/2, height/2);
        textSize(48);
    text("Press Space to Go Back to Menu", width/2, height/2+100);
    if (keyPressed) {
      if (key == ' ') {
        stage =2;
      }
    }
  }
}