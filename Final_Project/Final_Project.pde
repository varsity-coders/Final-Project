Sprite player;
Map map;
Save save;
float l = 0;
float r = 0;
float down = 0;
float up = 0;
float grav = .5;
float floor = 750;
float speedStat = 2;
float playerlevel = 1;
void setup() {
  size(1000, 800);
  player = new Sprite();
  map = new Map();
  save = new Save();
  player.image = loadImage("sprites.png");
  player.per = new PVector(600, floor);
  player.vel = new PVector(0, 0);
  player.frameRow = 0; 
  player.frameColumn = 0; 
  player.frameTime = 0;
  player.sp = 2;
  player.ysp = 13;
}

void draw() {
  background(100);
  //player.display();
  map.display();
  save.savegame();
  if (save.saving == 1) {
    if (mouseX > save.x && mouseY > save.y && mouseX < save.x+save.r && mouseY < save.y+save.h) {
      save.mouseReleased();
    }
  }
  if (player.per.y >= map.y && player.per.x < map.w) {
    player.per.y = height/2+152;
    grav = 0;
  }
  if (player.per.x-30>= width){
    background(0,0,255);
    save.savegame();
    player.per.x = 0;
  }
  player.vel.x = player.sp * (l + r);
  player.per.add(player.vel);
  if (player.per.y < floor) {
    player.vel.y += grav;
  } else {
    player.vel.y = 0;
  }
  if (player.per.y >= floor && up != 0) {
    player.vel.y = -player.ysp;
  }
  player.frameTime += .25; 
  if (player.frameTime >= 8) { 
    player.frameTime = 1;
  }
  player.frameColumn = (int)player.frameTime;

  if (player.vel.x == 0 && player.vel.y == 0) {
    player.frameColumn = 0;
  }

  if (l != 0) {
    player.frameRow = 0;
  }
  if (r != 0) {
    player.frameRow = 1;
  } 
  if (playerlevel == 1) {
    if (player.sp > 4 || player.sp<1) {
      player.sp = 2;
    }
  }
  if (playerlevel == 2) {
    speedStat = 4;
    if (player.sp > 8 || player.sp<1) {
      player.sp = 2;  //add other levels to game
    }
  }
  pushMatrix();
  translate(player.per.x, player.per.y);
  imageMode(CENTER);

  PImage frameImage = getSubImage(player.image, player.frameRow, player.frameColumn, 100, 105);

  // Draw this image instead of player.image
  image(frameImage, 0, 0);

  popMatrix();
}
// Our function to return a new smaller crop from the spritesheet.
PImage getSubImage(PImage image, int row, int column, int frameWidth, int frameHeight) {
  return image.get(column * frameWidth, row * frameHeight, frameWidth, frameHeight);
}

void keyPressed() {
  if (keyCode == RIGHT) {
    r = 1;
  }
  if (keyCode == LEFT) {
    l = -1;
  }
  if (keyCode == UP) {
    up = -1;
  }
  if (key == 'z') {
    player.sp += speedStat;
  }
}

void keyReleased() {
  if (keyCode == RIGHT) {
    r = 0;
    player.frameTime = 1;
  }
  if (keyCode == LEFT) {
    l = 0;
  }
  if (keyCode == UP) {
    up = 0;
  }
  if (key == 'z') {
    player.sp -= speedStat;
  }
} 