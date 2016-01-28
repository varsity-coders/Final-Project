class Shooter {
  float x, y, d, x2, y2, d2;//coordinates of bullets
  float speed, speed2,powerstat;//stats of bullets
  boolean shoot, shootleft;//commands for shooting
  PImage blastblue, blast;//image of blast
  PImage blastblueleft, blastleft;//image
  Shooter() {
    shoot = false;
    speed = 4;
    speed2 = 4;
    powerstat = 1;
    blast = loadImage("blast.png");//just loads up the images but they dont appear just yet
    blastleft = loadImage("blast2.png");
    blastblue = loadImage("blastblue.png");
    blastblueleft = loadImage("blastblue2.png");
  }
  void setLocationright(float initialx, float initialy) {
    x = initialx;
    y = initialy;
    // d = direction;
    shoot = true;
  }
  void setLocationleft(float initialx2, float initialy2) {
    x2 = initialx2;
    y2 = initialy2;
    // d = direction;
    shootleft = true;
  }
  void displayright() {
    if (shoot == true) { //could display bigger blast when leveling up and reaching boss
      image(blastblue, x, y);
    }
  }
  void displayleft() {
    if (shootleft == true) {
      image(blastblueleft, x2, y2);
    }
  }
  void updaterightlvl1() { //if level up shoot faster
    if (shoot == true) {
      x+=speed;
    }
    if (enemy.health2 >0) {
      if (x >enemy.x2-35 && y > enemy.y2) {
        shoot = false;
      }
    }
    if (enemy.health3 >0) {
      if (x >enemy.x3-35 && y > enemy.y3) {
        shoot = false;
      }
    }
    if (enemy.health >0) {
      if (x >enemy.x-35 && y > enemy.y) {
        shoot = false;
      }
    }
  
}
void updateleftlvl1() { 
  if (shootleft == true) {
    x2-=speed2;
  }
  if (enemy.health2 >0) {
    if (x2 < enemy.x2+35 && y2 > enemy.y2) {
      shootleft = false;
    }
  }
  if (enemy.health3 >0) {
    if (x2 < enemy.x3+35 && y2 > enemy.y3) {
      shootleft = false;
    }
  }
  if (enemy.health >0) {
    if (x2 < enemy.x+35 && y2 > enemy.y) {
      shootleft = false;
    }
  }
}

  void updaterightlvl2() { 
    if (shoot == true) {
      x+=speed;
    }
    if (enemy.health4 >0) {
      if (x >enemy.x4-35 && y > enemy.y4) {
        shoot = false;
      }
    }
    if (enemy.health5 >0) {
      if (x >enemy.x5-35 && y > enemy.y5) {
        shoot = false;
      }
    }
    if (enemy.health6 >0) {
      if (x >enemy.x6-35 && y > enemy.y6) {
        shoot = false;
      }
    }  
}
void updateleftlvl2() { 
  if (shootleft == true) {
    x2-=speed2;
  }
  if (enemy.health4 >0) {
    if (x2 < enemy.x4+35 && y2 > enemy.y4) {
      shootleft = false;
    }
  }
  if (enemy.health5 >0) {
    if (x2 < enemy.x5+35 && y2 > enemy.y5) {
      shootleft = false;
    }
  }
  if (enemy.health6 >0) {
    if (x2 < enemy.x6+35 && y2 > enemy.y6) {
      shootleft = false;
    }
  }
}
void updateBOSSleft(){
    if (shootleft == true) {
    x2-=speed2;
  }
    if (enemy.bosshealth >0) {
    if (x2 < enemy.xboss+40 && y2 > enemy.yboss) {
      shootleft = false;
    }
  }
}
void updateBOSSright(){
     if (shoot == true) {
      x+=speed;
    }
        if (enemy.bosshealth >0) {
      if (x >enemy.xboss-40 && y > enemy.yboss) {
        shoot = false;
      }
    } 
}
}