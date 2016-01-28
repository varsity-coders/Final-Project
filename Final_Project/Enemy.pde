class Enemy {
  PImage image, imagered, boss;
  float x, y; //x and y coordinates of enemy
  float vel;//picture of it in motion
  float health;//health of all 3 enemies
  float minX, maxX;

  float xboss, yboss, bossvel, bosshealth;//variables for the boss enemy
  boolean alive;

  boolean drawboss;

  Enemy(float tx, float ty, float tvel, float tminX, float tmaxX) {
    x = tx;
    y = ty;
    vel = tvel;
    image  = loadImage("enemy.png");
    alive=true;
    minX = tminX;
    maxX = tmaxX;

    //x = random(400, 560);//gives x movement to enemies (back and forth)
    //x2 = random(440, 960);
    //x3 = random(400, 560);
    //x4 = random(440, 960);
    //x5 =  random(40, 660);
    //x6 =  random(40, 960);
    //picvel = -random(1, 2);
    //picvel2 = random(1, 2);
    //picvel3 = random(1, 2.5);
    //picvel4 = -random(1, 2);
    //picvel5 = random(1.25, 2);
    //picvel6 = random(1.5, 2.5);
    //y = height/2-255;//heights of various enemies (makes them seem to walk on platforms)
    //y2 =height/2-55;
    //y3 = height/2+145;
    //y4 = height/2-255;
    //y5 = height/2-55;
    //y6 = height/2+145;
    //health = 10;//health of enemies
    //health2 = 20;
    //health3 = 30;
    //health4 = 20;
    //health5 = 30;
    //health6 = 30;

    // draw2=true;
    // draw3=true;
    // draw4=true;
    // draw5=true;
    // draw6=true;
    // xboss = 800;//where boss starts out
    // yboss = 353;
    // bossvel = 4;//velocity of boss
    // bosshealth = 100;//health of boss
    // drawboss = true;
  }

  void display() {
    image(image, x, y);
  }

  void move() {
    x += vel;
    if (x < minX || x > maxX) {
      vel *= -1;
    }
  }

  //void displaylvl1() {
  //  println(enemy.health3); //fix enemy health 3
  //  if  (draw==true) {
  //    image(image, x, y);
  //  }
  //  if  (draw2==true) {
  //    image(image, x2, y2);
  //  }
  //  if  (draw3==true) {
  //    image(image, x3, y3);
  //  }
  //  x += picvel;
  //  x2 += picvel2;
  //  x3 += picvel3;

  //  if (x+40>= 600 || x-40<=0) {
  //    picvel*=-1;
  //  }
  //  if (x2+40>= width || x2-40<=400) {
  //    picvel2*=-1;
  //  }

  //  if (x3+40>= width || x3-40<=0) {
  //    picvel3*=-1;
  //  }
  //}
  //void displaylvl2() {
  //  if  (draw4==true) {
  //    image(image, x4, y4);
  //  }
  //  if  (draw5==true) {
  //    image(image, x5, y5);
  //  }
  //  if  (draw6==true) {
  //    image(image, x6, y6);
  //  }
  //  x4 += picvel4;
  //  x5 += picvel5;
  //  x6 += picvel6;
  //  if (x4+40>= width || x4-40<=400) {
  //    picvel4*=-1;
  //  }
  //  if (x5+40>= 700 || x5-40<=0) {
  //    picvel5*=-1;
  //  }

  //  if (x6+40>= width || x6-40<=0) {
  //    picvel6*=-1;
  //  }
  //}

  void updateboss() {
    if (bosshealth <= 0) {
      drawboss = false;
    }
  }
  boolean isInContactEnemyfromRight() { 
    if ( dist(x, y, shoot.x, shoot.y) < 10) { 
      health -=shoot.powerstat;
      if (health < 1 ) {
        alive = false;
      }
      return true;
    } else {      
      return false;
    }
  }

  boolean isInContactEnemyfromLeft() { 
    if ( dist(x, y, shoot.x2, shoot.y2) < 10) { 
      health -=shoot.powerstat;
      if (health < 1 ) {
        alive = false;
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
  void bossdisplay() {
    boss = loadImage("BOSS.png");
    if (drawboss == true) {
      image(boss, xboss, yboss);
    }
    xboss += bossvel;
    if (xboss+100>= width || xboss-100<=0) {
      bossvel*=-1;
    }
  }
  boolean isBOSSinContactWith() {
    if (bosshealth >= 0) {
      if ( dist(player.per.x, player.per.y, xboss, yboss+50) < 70) { 
        player.health -=2;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactBOSSfromRight() { 
    if ( dist(xboss, yboss+50, shoot.x, shoot.y) < 40) { 
      bosshealth -= shoot.powerstat;
      if (bosshealth < 1 ) {
        drawboss = false;
      }
      return true;
    } else {      
      return false;
    }
  }
  boolean isInContactBOSSfromLeft() { 
    if ( dist(xboss, yboss+50, shoot.x2, shoot.y2) < 40) { 
      bosshealth -=shoot.powerstat;
      if (bosshealth < 1 ) {
        drawboss = false;
      }
      return true;
    } else {      
      return false;
    }
  }

  //void enemydissapearlvl1() {
  //  if (health == 0) {
  //    level.xp+=60;
  //    picvel = 0;
  //  }
  //  if (health2 == 0) {
  //    level.xp+=80;
  //    picvel2 = 9;
  //  }
  //  if (health3 == 0) {
  //    level.xp+=100;
  //    player.lives+=1;
  //    picvel3 = 0;
  //  }
  //}
  //void enemydissapearlvl2() {
  //  if (health4 == 0) {
  //    level.xp+=80;
  //    picvel4 = 0;
  //  }
  //  if (health5 == 0) {
  //    level.xp+=100;
  //    picvel5 = 0;
  //  }
  //  if (health6 == 0) {
  //    level.xp+=120;
  //    picvel6 = 0;
  //  }
  //}
  void bossdissapear() {
    if (bosshealth == 0) {
      background(0);
      fill(255);
      textAlign(CENTER);
      textSize(32);
      text("YOU BEAT CAMPAIGN Mode!", width/2, height/2);
      text("Now go enjoy yourself in Survival Mode", width/2, height/2+100);
      if (keyPressed) {
        if (key == ' ') {
          stage = 2;
        }
      }
    }
  }
}