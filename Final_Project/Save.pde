class Save {
  float o = 255;
  PrintWriter output;
  int c =1;
  float x = 100, y = 100, r =100, h = 100;
  float load = x, loadfin = 0;
  int saving;
  float loadcolorr = 255, loadcolorg = 0;
  Save() {
    output = createWriter("Save_" + c +".txt"); //change to .pde
  }
  void display() {
    fill(loadcolorr, loadcolorg, 0, o);
    textSize(32);
    text("Saving Game...", width/2-100, height/2);
  }

  void savegame() {
    noStroke();
    fill(255);
    rect(x, y, r, h);
    textSize(16);
    fill(0);
    text("Save Game", 110, 155);
    fill(loadcolorr, loadcolorg, 0);
    rect(load, r+h, loadfin, 20);
    if (loadfin >= 99) {
      loadcolorr = 0;
      loadcolorg = 255;
      fill(0, loadcolorg, 0);
            textSize(32);
      text("Game Saved", width/2-100, height/2);
      loadfin = 99;
      o =0;
    }
    output.println(c);
    if (mouseX > x && mouseY > y && mouseX < x+r && mouseY < y+h) {
        saving = 1;
        load();
        output.flush();
        output.close();
    }
  }
  void load() {
    display();
  }
  void mouseReleased() {
    loadfin++;
  }
}