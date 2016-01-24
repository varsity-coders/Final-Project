class Enemy {
  PImage image, imagered;
  PImage blast;  
  PVector x, y, picvel;
  PVector x2, y2, picvel2;
  PVector x3, y3, picvel3;
  PVector x5, y5, picvel5;
  PVector x6, y6, picvel6;
  PVector x7, y7, picvel7;
  PVector x8, y8, picvel8;

  Enemy() {
    blast = loadImage("blast.png");
    x = new PVector(random(30, width-30), 0);
    x2 = new PVector(random(30, width-30), 0);
    x3 = new PVector(random(30, width-30), 0);
    x5 = new PVector(random(30, width-30), 0);
    x6 = new PVector(random(30, width-30), 0);
    x7 = new PVector(random(30, width-30), 0);
    x8 = new PVector(random(30, width-30), 0);
    y = new PVector(0, height/2);
    picvel = new PVector(-random(2, 3), 0);
    picvel2 = new PVector(random(2, 3), 0);
    picvel3 = new PVector(random(2, 3), 0);
    picvel5 = new PVector(random(2, 3), 0);
    picvel6 = new PVector(random(2, 3), 0);
    picvel7 = new PVector(random(2, 3), 0);
    picvel8 = new PVector(random(2, 3), 0);
    y2 = new PVector(0, height/2-200);
    y3 = new PVector(0, height/2+200);
    y5 = new PVector(0, height/2+650);
    y6 = new PVector(0, height/2+475);
    y7 = new PVector(0, height/2+275);
    y8 = new PVector(0, height/2+75);
  }

  void displaylvl1() {
        image  = loadImage("enemy.png");
    imagered = loadImage("enemyred.png");
    image(image, x.x, y.y); //flip image
    image(image, x2.x, y2.y);
    image(image, x3.x, y3.y);
        x.add(picvel);
    x2.add(picvel2);
    x3.add(picvel3);
    if (x.x+40>= width) {
      picvel.x*=-1;
    }
    if (x.x-40<=0) {
      picvel.x*=-1;
    }
    if (x2.x+40>= width) {
      picvel2.x*=-1;
    }
    if (x2.x-40<=0) {
      picvel2.x*=-1;
    }
    if (x3.x+40>= width) {
      picvel3.x*=-1;
    }
    if (x3.x-40<=0) {
      picvel3.x*=-1;
    }
  }

  void bossdisplay() {
  }

  boolean isInContactEnemy(Sprite player) { //find out if there is an easier way to make each individual enemy and fix contact and if you can only have one contact (maybe array)
    if ( player.per.dist(x) < 100) { 
      println("Contact!!!!!!!");
      return true;
    } else {
      println("NO Contact");
      return false;
    }
  }
  void enemydissapear() {
    //if ("enemydissapear"){
    //level.xp+=10;
    // }
  }
  void displaysurvival(){
    //enemydefeat
  }
}