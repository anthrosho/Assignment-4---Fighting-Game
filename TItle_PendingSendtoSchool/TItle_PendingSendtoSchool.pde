import processing.sound.*;

PFont title;
PFont ChooseFighter;
PFont Subtitle;
PFont Play;
int selectionBoxX = 50;
int selectionBoxY = 80;
int spacing = 120;
int len = 120;
int selectionBox = 7;

boolean buttonPressed = false; // Correctly define as a boolean

PImage Kyle;
PImage Julia;
PImage Ravandu;
PImage Liam;
PImage David;
PImage Kraig;

characterSelection transition;
SoundFile theme;

void setup() {
  size(600, 600);
  transition = new characterSelection();

  // Text fonts
  title = createFont("Georgia", 120);
  ChooseFighter = createFont("Georgia", 120);
  Subtitle = createFont("Georgia", 120);
  Play = createFont("Georgia", 20); // Fixed font size for Play

  // Music
  theme = new SoundFile(this, "Sword_Fight_On_The_Heights.mp3");
  theme.loop();

  // Load images
  Kyle = loadImage("KyleDefault-removebg-preview.png");
  Julia = loadImage("JuliaDefault-removebg-preview.png");
  Ravandu = loadImage("Ravandu-removebg-preview.png");
  Liam = loadImage("Liam-removebg-preview.png");
  David = loadImage("David-removebg-preview.png");
  Kraig = loadImage("Kraig_CharSelect-removebg-preview.png");
}

void draw() {
  background(#FAF5E8);

  // Text
  textFont(title, 30);
  fill(#030303);
  text("TITLE PENDING!!!!", 140, 80);

  textFont(Subtitle, 20);
  fill(#030202);
  text("Names not decided.", 20, 160);
  fill(#DBD9D9);
  rect(0, 280, 150, 100); // Play button background

  textFont(Play, 20);
  fill(#030303);
  text("Play", 50, 340);

  // Images
  image(Kyle, 70, 100);
  image(Julia, 150, 100);
  image(Ravandu, 200, 100);
  image(Liam, 250, 100);
  image(David, 300, 100);
  image(Kraig, 320, 120);

  // Transition logic
  if (buttonPressed) {
    background(255);
    transition.select();
  }
}

void mousePressed() {
  // Detect if the Play button is clicked
  if (mouseX >= 0 && mouseX <= 150 && mouseY >= 280 && mouseY <= 380) {
    buttonPressed = true; // Set buttonPressed to true
  }
}
