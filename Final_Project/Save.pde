class Save {
  float o = 255;
  PrintWriter output;
  int c =1;
  float x = 25, y = 25, r =80, h = 50;
  float load = x, loadfin = 0;
  int saving;
  float loadcolorr = 255, loadcolorg = 0;
  Save() {
    output = createWriter("Save_" + c +".txt"); //change to .pde
  }
  void display() {
    fill(loadcolorr, loadcolorg, 0, o);
    textSize(32);
    text("Saving Game...", width/2-100, 100);
  }

  void savegame() {
    noStroke();
    fill(255);
    rect(x, y, r, h);
    textSize(12);
    fill(0);
    text("Save Game", 35, 55);
    fill(loadcolorr, loadcolorg, 0);
    rect(load, 65, loadfin, 10);
    if (loadfin >= 80) {
      loadcolorr = 0;
      loadcolorg = 255;
      fill(0, loadcolorg, 0);
            textSize(32);
      text("Game Saved", width/2-100, 100);
      loadfin = 80;
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