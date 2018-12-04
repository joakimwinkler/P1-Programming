//Milky Wavezzz

import processing.video.*;

//Name for playMovie
Movie game;

//Importing sound library
import processing.sound.*;

//Giving sounds a name
SoundFile pop;

//naming font class
PFont tofinoBook;
PFont tofinoItalic;
PFont tofinoLight;

//images
PImage mw_background;
PImage mw_settingsBackground;
PImage mw_colorWheelB;
PImage mw_colorWheelF;
PImage mw_vignette;
PImage mw_logo;
PImage mw_playButton;
PImage mw_playButton_hover;
PImage mw_musicButton;
PImage mw_settingsButton;
PImage mw_game;
PImage mw_backBtn;
PImage mw_musicButton_hover;
PImage mw_settingsButton_hover;
PImage mw_musicBox;
PImage mw_blurredBackground;

//This is for the settingspage with the color wheel
float foregroundHue = 210;
float backgroundHue = 210;

//variables
int screen = 0;

//Using buttons class to create buttons
Buttons playButton;
Buttons musicButton;
Buttons settingsButton;
Buttons backBtn;
Buttons playButton_hover;
Buttons musicButton_hover;
Buttons settingsButton_hover;

//array for the 6 buttons on the music page
Buttons[] buttonArray = new Buttons[6];

//Array for the 6 buttons' names on the music page
String[] musicNames = {"Daze", "SUTMIG", "PENOIS", "YEET", "FGT", "YIKERS",};

void setup() {
  //Loop used to evenly space out the buttons
  for (int i = 0; i < buttonArray.length; i++) {
    buttonArray[i] = new Buttons(width/2, 270+i*45);
  }
    imageMode(CENTER);
    size(405, 720);

    //Creating new movie
    game = new Movie(this, "playgif.mov");
    game.loop();


    //load images
    mw_background = loadImage("mw_backgroundB&W.png");
    mw_settingsBackground = loadImage("mw_blurredBackgroundB&W.png");
    mw_colorWheelB = loadImage("mw_backgroundColorWheel.png");
    mw_colorWheelF = loadImage("mw_foregroundColorWheel.png");
    mw_vignette = loadImage("mw_vignette.png");
    mw_logo = loadImage("mw_logo.png");
    mw_playButton = loadImage("mw_playButton.png");
    mw_musicButton = loadImage("mw_musicButton.png");
    mw_settingsButton = loadImage("mw_settingsButton.png");
    mw_game = loadImage("game.png");
    mw_backBtn = loadImage("backBtn.png");
    mw_playButton_hover = loadImage("mw_playButton_hover.png");
    mw_musicButton_hover = loadImage("mw_musicButton_hover.png");
    mw_settingsButton_hover = loadImage("mw_settingsButton_hover.png");
    mw_musicBox = loadImage("musicBox.png");
    mw_blurredBackground = loadImage("mw_blurredBackgroundB&W.png");

    //resizing the images
    mw_background.resize(width, height);
    mw_settingsBackground.resize(width, height);
    mw_colorWheelB.resize(225,225);
    mw_colorWheelF.resize(225,225);
    mw_vignette.resize(width, height);
    mw_logo.resize(313, 166);
    mw_playButton.resize(256, 47);
    mw_musicButton.resize(256, 47);
    mw_settingsButton.resize(256, 47);
    mw_game.resize(width, height);
    mw_backBtn.resize(width, 30);
    mw_playButton_hover.resize(256, 47);
    mw_musicButton_hover.resize(256, 47);
    mw_settingsButton_hover.resize(256, 47);
    mw_musicBox.resize(338, 387);
    mw_blurredBackground.resize(width, height);


    //Creating the button for playButton,musicButton, and settingsButton
    playButton = new Buttons(width/2, 492);
    musicButton = new Buttons(width/2, 552);
    settingsButton = new Buttons(width/2, 612);
    backBtn = new Buttons(width/2, 20);
    playButton_hover = new Buttons(width/2, 492);
    musicButton_hover = new Buttons(width/2, 552);
    settingsButton_hover = new Buttons(width/2, 612);

    //loading sounds
    pop = new SoundFile(this, "pop.wav");

    //creating font
    tofinoBook = createFont("Book.vlw", 30);
    tofinoLight = createFont("Light.vlw", 30);
    tofinoItalic = createFont("lightitalic.vlw", 30);
  }

  void draw() {
    //front page
    if (screen == 0) {
      frontScreen();
    }
    if (screen == 1) {
      playScreen();
    }
    if (screen == 2) {
      musicScreen();
    }
    if (screen == 3) {
      settingsScreen();
    }
  }

  void mouseReleased() {
    if (playButton.mouseDetect() && screen == 0) {
      screen = 1;
      pop.play();
    }
    if (screen == 1) {
      if (backBtn.mouseDetect()) {
        screen = 0;
        pop.play();
      }
    }
    if (musicButton.mouseDetect() && screen == 0) {
      for (int i = 0; i < buttonArray.length; i++) {
      buttonArray[i].mouseDetect();
      screen = 0;
      }
      screen = 2;
      pop.play();
    }
    if (screen == 2) {
      if (backBtn.mouseDetect()) {
        screen = 0;
        pop.play();
      }
    }
    if (settingsButton.mouseDetect() && screen == 0) {
      screen = 3;
      pop.play();
    }
    if (screen == 3) {
      if (backBtn.mouseDetect()) {
        screen = 0;
        pop.play();
      }
    }
  }
