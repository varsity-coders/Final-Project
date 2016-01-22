class Levels {
  int l = 1;
  int xp = 0;
  float o = 255;
  float op1 = 255,op2 = 255,op3 = 255,op4 = 255,
op5 = 255,op6 = 255,op7 = 255,op8 = 255,op9 = 255;
  void display() {
    fill(0, 112, 186);
    rect(20, height-45, xp, 35);
    fill(255);
    textSize(16);
    text("XP:"+xp, 20, height-50);
    fill(255);
    textSize(22);
    text("Level:" + l, 700, height-25); //change just for testing
    if (keyPressed) {
      if (key == 'r') {
        xp+=1;
      }
    }
      if (xp >200) {
        xp = 0;
        l+=1;
      }
      if (l>10){
        l = 10;
      }
    }
    void levelup(){
        if (l==2) {
    fill(255, 255, 255, op1);
    textSize(16);
    text("Leveled Up", 700, height - 50);
    op1-=2;
    //player.lives+=1; if level up twice give life
  }
          if (l==3) {
    fill(255, 255, 255, op2);
    textSize(16);
    text("Leveled Up", 700, height - 50);
    op2-=2;
  }
          if (l==4) {
    fill(255, 255, 255, op3);
    textSize(16);
    text("Leveled Up", 700, height - 50);
    op3-=2;
  }
          if (l==5) {
    fill(255, 255, 255, op4);
    textSize(16);
    text("Leveled Up", 700, height - 50);
    op4-=2;
  }
          if (l==6) {
    fill(255, 255, 255, op5);
    textSize(16);
    text("Leveled Up", 700, height - 50);
    op5-=2;
  }
  
    }
}