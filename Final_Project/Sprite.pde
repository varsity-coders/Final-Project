class Sprite {
  PImage image;
  PImage imagered;
  PImage life;
  PVector per;
  int frameRow;
  int frameColumn;
  float frameTime;
  PVector vel;
  float sp;
  float ysp;
  int health =400;
    int health2 =800;
  int lives;                //change to 3 and add life ups
  float a =800, d=800;
  int extralives;

  Sprite() {
    image = loadImage("sprites.png");
    imagered = loadImage("spritesred.png");
    life = loadImage("lives.png");
    per = new PVector(150, 200);
    vel = new PVector(0, 0);
    frameRow = 0; 
    frameColumn = 0; 
    frameTime = 0;
    sp = 2;
    ysp = 14;
  }
  void health() {
    per = new PVector(150, 100);
    lives = 5;
    fill(0, 255, 0);
    rect(230, height-45, health, 35);
    fill(255);
    textSize(16);
    text("Health:"+health, 230, height-50);
    if (keyPressed) {
      if (key == 't') { //change just for test
        health-=25;
      }
    }
    text("Lives:", 813, height-30);
    if (lives == 3) {
      image(life, 880, height-30);
      image(life, 920, height-30);
      image(life, 960, height-30);
    }

    if (lives == 2) {
      image(life, 880, height-30);
      image(life, 920, height-30);
    }
    if (lives == 4) {
      extralives = 4;
      image(life, 880, height-30);
      text("X" +extralives, 905, height-30);
    }
    if (lives == 5) {
      extralives = 5;
      image(life, 880, height-30);
      text("X" +extralives, 905, height-30);
    }
    if (lives == 1) {
      image(life, 880, height-30);
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
    if (lives == 0) {
      if (mousePressed) { //change to button
        lives = 4;
      }
    }
  }
  void survivalhealth() {
    per = new PVector(150, 200);
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