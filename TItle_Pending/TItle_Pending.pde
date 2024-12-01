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

boolean buttonPressed = false;
boolean characterSelect = false;

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
  rect(0, 280, 150, 100); // Creates button

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

  // Transition
  if (buttonPressed) {
    transition.select(); // Call the select method in the transition object
  }
}

void mousePressed() {
  if (buttonPressed) { 
    // Character selection rectangle checks
    if (mouseX >= 0 && mouseX <= 150 && mouseY >= 180 && mouseY <= 380) {
      println("KYLE");
    } else if (mouseX >= 150 && mouseX <= 300 && mouseY >= 180 && mouseY <= 380) {
      println("JULIA");
    } else if (mouseX >= 300 && mouseX <= 450 && mouseY >= 180 && mouseY <= 380) {
      println("RAVANDU");
    } else if (mouseX >= 450 && mouseX <= 600 && mouseY >= 180 && mouseY <= 380) {
      println("LIAM");
    } else if (mouseX >= 0 && mouseX <= 150 && mouseY >= 380 && mouseY <= 580) {
      println("DAVID");
    } else if (mouseX >= 150 && mouseX <= 300 && mouseY >= 380 && mouseY <= 580) {
      println("KRAIG");
    }
  } else if (mouseX >= 0 && mouseX <= 150 && mouseY >= 280 && mouseY <= 380) {

    buttonPressed = true; 
    characterSelect = true;
  }
}
