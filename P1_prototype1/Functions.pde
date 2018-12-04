void frontScreen() {
  colorMode(HSB);
  tint(backgroundHue, 150, 200);
  image(mw_background, width/2, height/2);
  noTint();
  image(mw_vignette, width/2, height/2);
  image(mw_logo, width/2 + 20, 225);
  tint(foregroundHue, 140, 200);
  image(mw_playButton, width/2, 492);
  image(mw_musicButton, width/2, 552);
  image(mw_settingsButton, width/2, 612);
  noTint();
  colorMode(RGB);
  playButton.mouseDetect();
  musicButton.mouseDetect();
  settingsButton.mouseDetect();
  playButton_hover.playHover();
  musicButton_hover.musicHover();
  settingsButton_hover.settingsHover();
}

void playScreen() {
  image(mw_game, width/2, height/2);
  if (game.available()) {
    game.read();
  }
  image(game, width/2, height/2);
  image(mw_backBtn, width/2, 15);
  backBtn.mouseDetect();
}

void musicScreen() {
  colorMode(HSB);
  tint(backgroundHue, 255, 255);
  image(mw_blurredBackground, width/2, height/2);
  noTint();
  tint(foregroundHue, 255, 255);
  image(mw_musicBox, width/2, height/2);
  noTint();
  colorMode(RGB);
  image(mw_backBtn, width/2, 15);
  backBtn.mouseDetect();
  textAlign(CENTER);
  textFont(tofinoBook);
  text("SONGS", width/2, 230);
  textFont(tofinoLight);
  //for loop to draw buttons with the buttonArray
  for (int i = 0; i < buttonArray.length; i++) {
    buttonArray[i].display();
    fill(255);
    text(musicNames[i], buttonArray[i].Posi.x, buttonArray[i].Posi.y);
  }
}


void settingsScreen() {
  //We change the color mode to be HSB instead of RGB
  colorMode(HSB);
  //foregroundHue is a global variable that is declared to 0, but it gets a value further down.
  tint(backgroundHue, 255, 255);
  image(mw_settingsBackground, width/2, height/2);
  noTint();
  image(mw_colorWheelF, width/2, 300);
  image(mw_colorWheelB, width/2, 600);
  // we reset the color mode back to RGB
  colorMode(RGB);

  //Text
  textAlign(CENTER);
  textFont(tofinoBook);
  textSize(40);
  text("SETTINGS", width/2, 90);
  textFont(tofinoItalic);
  textSize(30);
  text("Foreground", width/2, 170);
  text("Background", width/2, 470);


  image(mw_backBtn, width/2, 15);
  backBtn.mouseDetect();

  //THIS IS FOR THE FOREGROUND WHEEL/////////////////////////////////////////////////////////////////////////////////////////////

  //We declare a vector with the mouseposition
  PVector mousePos = new PVector(mouseX, mouseY);
  //A vector with the colorwheel position
  PVector wheelPos = new PVector(width/2, 300);
  //A vector that calculates the distance between the wheel position and the mouse position
  PVector dist = PVector.sub(wheelPos, mousePos);
  float distance = dist.mag();
  //The radius of the wheel
  float radius = 112.5;
  if (mousePressed) {
    //If the the distance which is the mouse position is within the radius, do this:
    if (distance < radius) {
      float angle;
      //We need a standard vector that point the the right in order to calculate an angle
      if (mouseY > 300) {
        PVector rightVector = new PVector(1, 0);
        //Then we get the angle between the mouse position and the standard vector (rightVector), and declare it to a float
        angle = PVector.angleBetween(rightVector, dist);
        //We need the angle in degrees not radians
        angle = degrees(angle);
        //Now we have the problem that the circle is 360 degress and the HSB only goes to a maximum of 255, so we use the map function to shorten the degrees to only go to 255 
        //We can now set our global variable with the angle that is within the 255
        angle += 180;
      } else {
        PVector leftVector = new PVector(-1, 0);
        angle = PVector.angleBetween(leftVector, dist);
        angle = degrees(angle);
      }
      foregroundHue = map(angle, 0, 360, 0, 255);
    }
  }

  //THIS IS FOR THE FOREGROUND WHEEL/////////////////////////////////////////////////////////////////////////////////////////////

  //We declare a vector with the mouseposition
  PVector mousePos2 = new PVector(mouseX, mouseY);
  //A vector with the colorwheel position
  PVector wheelPos2 = new PVector(width/2, 600);
  //A vector that calculates the distance between the wheel position and the mouse position
  PVector dist2 = PVector.sub(wheelPos2, mousePos2);
  float distance2 = dist2.mag();
  //The radius of the wheel
  float radius2 = 112.5;
  if (mousePressed) {
    //If the the distance which is the mouse position is within the radius, do this:
    if (distance2 < radius2) {
      float angle;
      //We need a standard vector that point the the right in order to calculate an angle
      if (mouseY > 600) {
        PVector rightVector2 = new PVector(1, 0);
        //Then we get the angle between the mouse position and the standard vector (rightVector), and declare it to a float
        angle = PVector.angleBetween(rightVector2, dist2);
        //We need the angle in degrees not radians
        angle = degrees(angle);
        //Now we have the problem that the circle is 360 degress and the HSB only goes to a maximum of 255, so we use the map function to shorten the degrees to only go to 255 
        //We can now set our global variable with the angle that is within the 255
        angle += 180;
      } else {
        PVector leftVector2 = new PVector(-1, 0);
        angle = PVector.angleBetween(leftVector2, dist2);
        angle = degrees(angle);
      }
      backgroundHue = map(angle, 0, 360, 0, 255);
    }
  }
}
