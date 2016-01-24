class Enemy {
  PImage image, imagered;
  float x, y; 
  float picvel;
  float x2, y2;
  float picvel2;
  float x3, y3; 
  float picvel3;
  float health, health2, health3;
  boolean draw, draw2, draw3;
  Enemy() {
    x = 441;
    x2 = random(400,580);
    x3 = 41;
    picvel = -random(1, 2);
    picvel2 = random(1, 2);
    picvel3 = random(1, 2);
    y = height/2-55;
    y2 =height/2-255;
    y3 = height/2+145;
    health = 20;
    health2 = 20;
    health3 = 20;
    image  = loadImage("enemy.png");
    draw=true;
    draw2=true;
    draw3=true;
  }

  void displaylvl1() {
    println(health2);
    if  (draw==true) {
      image(image, x, y);
    }
    if  (draw2==true) {
            image(image, x2, y2);
    }
    if  (draw3==true) {
      image(image, x3, y3);
    }
    x += picvel;
    x2 += picvel2;
    x3 += picvel3;
    if (x+40>= width) {
      picvel*=-1;
    }
    if (x-40<=400) {
      picvel*=-1;
    }
    if (x2+40>= 600) {
      picvel2*=-1;
    }
    if (x2-40<=0) {
      picvel2*=-1;
    }
    if (x3+40>= 600) {
      picvel3*=-1;
    }
    if (x3-40<=0) {
      picvel3*=-1;
    }
  }
  void updatelvl1() {
    if (health <=0 ) {
      draw = false;
    }
        if (health2 <=0 ) {
      draw2 = false;
    }
        if (health3 <=0 ) {
      draw3 = false;
    }
  }
  boolean isInContactEnemyfromRight() { 
    if ( dist(x, y, shoot.x, shoot.y) < 10) { 
      health -=1;
      if (health < 1 ) {
        draw = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactEnemyfromRight2() { 
    if ( dist(x2, y2, shoot.x, shoot.y) < 10) { 
      health2 -=1;
      if (health2 < 1 ) {
        draw2 = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactEnemyfromRight3() { 
    if ( dist(x3, y3, shoot.x, shoot.y) < 10) { 
      health3 -=1;
      if (health3 < 1 ) {
        draw3 = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactEnemyfromLeft() { 
    if ( dist(x, y, shoot.x2, shoot.y2) < 10) { 
      health -=1;
      if (health < 1 ) {
        draw = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactEnemyfromLeft2() { 
    if ( dist(x2, y2, shoot.x2, shoot.y2) < 10) { 
      health2 -=1;
      if (health2 < 1 ) {
        draw2 = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactEnemyfromLeft3() { 
    if ( dist(x3, y3, shoot.x2, shoot.y2) < 10) { 
      health3 -=1;
      if (health3 < 1 ) {
        draw3 = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isEnemyinContactWith1() {
   if (health >= 0) {
   if ( dist(player.per.x, player.per.y, x, y) < 70) { 
   player.health -=2;
   }
   return true;
   } else {      
   return false;
   }
   }
   boolean isEnemyinContactWith2() {
   if (health2 >= 0) {
   if ( dist(player.per.x, player.per.y, x2, y2) < 70) { 
   player.health -=2;
   }
   return true;
   } else {      
   return false;
   }
   }
   boolean isEnemyinContactWith3() {
   if (health3 >= 0) {
   if ( dist(player.per.x, player.per.y, x3, y3) < 70) { 
   player.health -=2;
   
   }
   return true;
   } else {      
   return false;
   }
   }
  void bossdisplay() {
  }

  void enemydissapear() {
    if (health == 0) {
      level.xp+=40;
    }
        if (health2 == 0) {
      level.xp+=40;
    }
        if (health3 == 0) {
      level.xp+=40;
    }
  }
  void displaysurvival() {
    imagered = loadImage("enemyred.png");
    //enemydefeat
  }
}