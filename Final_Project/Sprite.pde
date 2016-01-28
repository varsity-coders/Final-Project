class Sprite {
  PImage image;//sprite pictures
  PImage imagered;
  PImage life;
  PVector per;//per is the x and y vectors
  int frameRow;
  int frameColumn;
  float frameTime;
  PVector vel;//velocity of sprite (x and y)
  float sp;//speed of sprite
  float ysp;//y speed
  int health =400;//health of sprite
    int health2 =800;//health of sprite 
  int lives = 3;//3 lives                //change to 3 and add life ups
  float a =800, d=800;
  int extralives;

  Sprite() {
    image = loadImage("sprites.png");//loads images of sprites
    imagered = loadImage("spritesred.png");
    life = loadImage("lives.png");
    per = new PVector(905, 0);//location of sprite
    vel = new PVector(2, 10);//vel of sprite 
    frameRow = 0; 
    frameColumn = 0; 
    frameTime = 0;
    sp = 2;//speed starts at 2
    ysp = 15;//y speed starts at 15
  }
  void health() {//health bar of sprite
    noStroke();
    fill(0, 255, 0);//green
    rect(230, height-45, health, 35);//location of bar
    fill(255);//fill of text
    textSize(16);
    text("Health:"+health, 230, height-50);
    text("Lives:", 813, height-30);
    if (lives == 3) {
      image(life, 880, height-30);//changes images depending on lives
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
  void loselife() {//if health is lost then you lose a life
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
  void survivalhealth() {//only 1 live
    lives = 1;
    fill(0, 255, 0);
    noStroke();
    rect(100, height-45, health2, 35);//same bar configuration
    fill(255);
    textSize(16);
    text("Health:"+health2, 150, height-50);
    if (keyPressed) {
      if (key == 't') { //change just for test
        health2-=25;//testing survival still
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