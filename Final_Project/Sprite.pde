class Sprite {
  PImage image;
  PImage imagered;
  PImage life;
  PVector per;
  float xpos,ypos;
  int frameRow;
  int frameColumn;
  float frameTime;
  PVector vel;
  float sp;
  float ysp;
  int health =400;
    int health2 =800;
  int lives =5;                //change to 3 and add life ups
  float a =800, d=800;
  int extralives;

  Sprite() {
    image = loadImage("sprites.png");
    imagered = loadImage("spritesred.png");
    life = loadImage("lives.png");
    per = new PVector(xpos, ypos);
    vel = new PVector(2, 10);
    frameRow = 0; 
    frameColumn = 0; 
    frameTime = 0;
    sp = 2;
    ysp = 15;
    xpos = 0;
    ypos = 10;
  }
  void health() {
    noStroke();
    fill(0, 255, 0);
    rect(230, height-45, health, 35);
    fill(255);
    textSize(16);
    text("Health:"+health, 230, height-50);
    text("Lives:", 813, height-30);
    if (lives == 3) {
      image(life, 880, height-30);
      image(life, 920, height-30);
    }

    if (lives == 2) {
      image(life, 880, height-30);
    }
    if (lives == 4) {
      extralives = 3;
      image(life, 880, height-30);
      text("X" +extralives, 905, height-30);
    }
    if (lives == 5) {
      extralives = 4;
      image(life, 880, height-30);
      text("X" +extralives, 905, height-30);
    }
  }
  void loselife() {
    if (lives == 5) {
      if (health <= 0) {
        health = 400;
        lives = 4;
      }
    }
    if (lives == 4) {
      if (health <= 0) {
        health = 400;
        lives = 3;
      }
    }
    if (lives == 3) {
      if (health <= 0) {
        health = 400;
        lives = 2;
      }
    }
    if (lives == 2) {
      if (health <= 0) {
        health = 400;
        lives = 1;
      }
    }
    if (lives == 1) {
      if (health <= 0) {
        health = 0;
        lives = 0;
      }
    
    }
  }
  void survivalhealth() {
    lives = 1;
    fill(0, 255, 0);
    noStroke();
    rect(100, height-45, health2, 35);
    fill(255);
    textSize(16);
    text("Health:"+health2, 150, height-50);
    if (keyPressed) {
      if (key == 't') { //change just for test
        health2-=25;
      }
    }
    if (lives == 1) {
      if (health2 <= 0) {
        health2 = 0;
        lives = 0;
      }
    }
    if (lives == 0) {
      if (mousePressed) { //change to button
        lives = 4;
      }
    }
  }
}