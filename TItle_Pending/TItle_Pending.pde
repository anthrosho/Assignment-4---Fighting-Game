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
int fighterCount = 0;


boolean buttonPressed = false;
boolean characterSelect = false;

PImage Kyle;
PImage Julia;
PImage Ravandu;
PImage Liam;
PImage David;
PImage Kraig;

PImage character1;
PImage character2;



//Objects
characterSelection transition;
FighterSelection transition2;
SoundFile theme;

void setup() {
  size(600, 600);
  transition = new characterSelection();
  transition2= new FighterSelection(); 


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
  rect(0, 280, 150, 100);

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
  
  
  

 //<>//

  // Transition
  if (buttonPressed) {
    transition.select();
  }
}


void mousePressed() {

  // Character Selection
  if (buttonPressed) {
    // Character selection rectangle checks
    if (mouseX >= 0 && mouseX <= 150 && mouseY >= 180 && mouseY <= 380) {
      if (fighterCount == 0) {
        character1 = Kyle;
        println("character1 is KYLE");
        
      } else if (fighterCount == 1) {
        character2 = Kyle;
        println("character2 is KYLE");
        
      }
      fighterCount++; 
      
    } else if (mouseX >= 150 && mouseX <= 300 && mouseY >= 180 && mouseY <= 380) {
      if (fighterCount == 0) {
        character1 = Julia;
        println("character1 is JULIA");
      } else if (fighterCount == 1) {
        character2 = Julia;
        println("character2 is JULIA");
      }
      
      fighterCount++;
    } else if (mouseX >= 300 && mouseX <= 450 && mouseY >= 180 && mouseY <= 380) {
      if (fighterCount == 0) {
        character1 = Ravandu;
        println("character1 is RAVANDU");
      } else if (fighterCount == 1) {
        character2 = Ravandu;
        println("character2 is RAVANDU");
      }
      
      fighterCount++;
    } else if (mouseX >= 450 && mouseX <= 600 && mouseY >= 180 && mouseY <= 380) {
      if (fighterCount == 0) {
        character1 = Liam;
        println("character1 is LIAM");
      } else if (fighterCount == 1) {
        character2 = Liam;
        println("character2 is LIAM");
      }
      
      fighterCount++;
    } else if (mouseX >= 0 && mouseX <= 150 && mouseY >= 380 && mouseY <= 580) {
      if (fighterCount == 0) {
        character1 = David;
        println("character1 is DAVID");
      } else if (fighterCount == 1) {
        character2 = David;
        println("character2 is DAVID");
        
      }
      
      fighterCount++;
    } else if (mouseX >= 150 && mouseX <= 300 && mouseY >= 380 && mouseY <= 580) {
      if (fighterCount == 0) {
        character1 = Kraig;
        println("character1 is KRAIG");
      } else if (fighterCount == 1) {
        character2 = Kraig;
        println("character2 is KRAIG");
      }
      fighterCount++;
    }
  } else if (mouseX >= 0 && mouseX <= 150 && mouseY >= 280 && mouseY <= 380) {
    // Play button clicked
    buttonPressed = true;
    characterSelect = true;
  }
}
