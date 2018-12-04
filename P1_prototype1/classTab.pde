class Buttons {
  PVector Posi = new PVector(width/2, 492);
  PVector Size = new PVector(256, 47);
  Buttons(int x, int y) {
    Posi.x = x;
    Posi.y = y;
  }
  boolean mouseDetect () {
    if (mouseX > Posi.x - Size.x/2 && mouseX< Posi.x + Size.x/2 && mouseY > Posi.y - Size.y/2 && mouseY < Posi.y + Size.y/2 && mouseButton == LEFT) {
      return true;
    } else {
      return false;
    }
  }
  void playHover() {
    if (mouseX > Posi.x - Size.x/2 && mouseX< Posi.x + Size.x/2 && mouseY > Posi.y - Size.y/2 && mouseY < Posi.y + Size.y/2) {
      image(mw_playButton_hover, width/2, 492);
    }
  } 

  void musicHover() {
    if (mouseX > Posi.x - Size.x/2 && mouseX< Posi.x + Size.x/2 && mouseY > Posi.y - Size.y/2 && mouseY < Posi.y + Size.y/2) {
      image(mw_musicButton_hover, width/2, 552);
    }
  }

  void settingsHover() {
    if (mouseX > Posi.x - Size.x/2 && mouseX< Posi.x + Size.x/2 && mouseY > Posi.y - Size.y/2 && mouseY < Posi.y + Size.y/2) {
      image(mw_settingsButton_hover, width/2, 612);
    }
  }
  void display() {
    fill(0);
    rect(Posi.x, Posi.y, 257, 40);
    rectMode(CENTER);
  }
}
