import processing.sound.*;
PFont title;
PFont ChooseFighter;

SoundFile theme;

int selectionBoxX = 50;
int selectionBoxY = 80;
int spacing = 120;
int len = 120;
int selectionBox = 7;

void setup () {
  size(600, 600);

  // Text stuff
  title = createFont("Georgia", 120);
  ChooseFighter = createFont("Georgia", 120);

  theme = new SoundFile(this, "Sword_Fight_On_The_Heights.mp3");
  theme.loop();
}

void draw () {
  background(#FAF5E8);
  textFont(title, 30);
  fill(#030303);
  text("TITLE PENDING!!!!", 180, 100);

  textFont(ChooseFighter, 25);
  fill(#030303);
  text("Choose your Fighter!", 180, 150);
  fill(#F7D882);
  rect(0, 180, 600, 600);
  println(theme.isPlaying());

    fill(#FCFAF5);
  for (int y = 0; y < 2; y++) {
    for (int x = 0; x < 3; x++) {
      rect(x * (len + spacing), y * (len + spacing) + 240, len, len);
    }
  }
}
