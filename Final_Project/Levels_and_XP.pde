class Levels {
  int l = 1;//start out at level 1
  int xp = 0;//0 xp at the start
  float o = 255;
  float op1 = 255,op2 = 255,op3 = 255,op4 = 255;
  void display() {//allows the xp meter to increase as one kills enemies
    noStroke();
    fill(0, 112, 186);
    rect(20, height-45, xp, 35);
    fill(255);
    textSize(16);
    text("XP:"+xp, 40, height-50);
    fill(255);
    textSize(22);
    text("Level:" + l, 700, height-25);
      if (xp >200) {
        xp = 0;
        l+=1;
      }
      if (l>5){
        l = 5;
      }
    }
    void levelup(){//level up animations
        if (l==2) {
    fill(255, 255, 255, op1);
    textSize(16);
    text("Leveled Up", 700, height - 50);
    op1-=2;
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
    }
}