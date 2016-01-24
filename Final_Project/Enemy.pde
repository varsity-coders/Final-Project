class Enemy {
  PImage image, imagered;
  float x, y; 
  float picvel;
  float x2, y2;
  float picvel2;
  float x3, y3; 
  float picvel3;
  float health2;
  boolean draw1;
  Enemy() {
    x = 441;
    x2 = 41;
    x3 = 41;
    picvel = -random(1, 2);
    picvel2 = random(1, 2);
    picvel3 = random(1, 2);
    y = height/2-55;
    y2 =height/2-255;
    y3 = height/2+145;
    health2 = 10;
  }

  void displaylvl1() {
          println(health2);
    image  = loadImage("enemy.png");
    draw1=true;
    if  (draw1==true) {
      image(image, x2, y2);
    }
    image(image, x, y);
    image(image, x3, y3);
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
  void updatelvl1(){
        if (health2 <=0 ){
  health2 = 0;
  draw1 = false;
}
  }
  boolean isInContactEnemyfromRight() { 
    if ( dist(x2, y2, shoot.x, shoot.y) < 5) { 
      health2 -=1;
      return true;
    } else {      
      return false;
    }
  }
      boolean isInContactEnemyfromLeft() { 
        if ( dist(x2, y2, shoot.x2, shoot.y2) < 5) { 
      health2 -=1;
      return true;
    } else {      
      return false;
    }
  }
  boolean isEnemyinContactWith() { 
    if ( dist(player.per.x, player.per.y, x2, y2) < 80) { 
      player.health -=2;
      return true;
    } else {      
      return false;
    }
  }
  void bossdisplay() {
  }

  void enemydissapear() {
    if (health2 == 0){
    level.xp+=10;
     }
  }
  void displaysurvival() {
        imagered = loadImage("enemyred.png");
    //enemydefeat
  }
}