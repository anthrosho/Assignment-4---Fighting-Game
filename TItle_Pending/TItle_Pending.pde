import processing.sound.*; //<>//

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
int WeareFighting = 0;
int battleCount = 0;
int attackDelay = 0;

boolean buttonPressed = false;
boolean characterSelect = false;
boolean gameOver = false;

PImage character1;
PImage character2;

PImage Kyle;
PImage Julia;
PImage Ravandu;
PImage Liam;
PImage David;
PImage Kraig;

PImage DFKyle;
PImage DFJulia;
PImage DFRavandu;
PImage DFLiam;
PImage DFDavid;
PImage DFKraig;

PImage FSKyle;
PImage FSJulia;
PImage FSRavandu;
PImage FSLiam;
PImage FSDavid;
PImage FSKraig;

PImage FBKyle;
PImage FBJulia;
PImage  FBRavandu;
PImage  FBLiam;
PImage  FBDavid;
PImage FBKraig;

PImage SSKyle;
PImage SSJulia;
PImage SSRavandu;
PImage SSLiam;
PImage SSDavid;
PImage SSKraig;

PImage VKyle;
PImage VJulia;
PImage VRavandu;
PImage VLiam;
PImage VDavid;
PImage VKraig;

PImage DKyle;
PImage DJulia;
PImage DRavandu;
PImage DLiam;
PImage DDavid;
PImage DKraig;

// Objects
characterSelection transition;
FighterSelection transition2;
BattleSystem actions;
hpBar player1Health;
hpBar player2Health;

SoundFile theme;

// Variables for bouncing circle
float circleX = 300; // Initial X position
float circleY = 150; // Initial Y position
float circleRadius = 30; // Radius of the circle
float xSpeed = 2.5; // Speed of the circle in X direction
float ySpeed = 2; // Speed of the circle in Y direction

void setup() {
  size(600, 600);
  transition = new characterSelection();
  transition2 = new FighterSelection();
  actions = new BattleSystem();
  
  player1Health = new hpBar(50, 30, 20);
  player2Health = new hpBar(350, 30, 20);
  
  // Load images and assets
  Kyle = loadImage("KyleDefault-removebg-preview.png");
  Julia = loadImage("JuliaDefault-removebg-preview.png");
  Ravandu = loadImage("Ravandu-removebg-preview.png");
  Liam = loadImage("Liam-removebg-preview.png");
  David = loadImage("David-removebg-preview.png");
  Kraig = loadImage("Kraig_CharSelect-removebg-preview.png");

  // Load Fight Images
  DFKyle = loadImage("KyleFight.png");
  DFJulia = loadImage("JuliaFight.png");
  DFRavandu = loadImage("RavanduFight.png");
  DFLiam = loadImage("LiamFight.png");
  DFDavid = loadImage("DavidFight.png");
  DFKraig = loadImage("KraigFight.png");

  // Load Fighting Images
  FSKyle = loadImage("KyleAttack.png");
  FSJulia = loadImage("JuliaAttack.png");
  FSRavandu = loadImage("RavanduAttack.png");
  FSLiam = loadImage("LiamAttack.png");
  FSDavid = loadImage("DavidAttack.png");
  FSKraig = loadImage("KraigAttack.png");

  // Load Block Images
  FBKyle = loadImage("KyleBlock.png");
  FBJulia = loadImage("JuliaBlock.png");
  FBRavandu = loadImage("RavanduDefence.png");
  FBLiam = loadImage("LiamBlock.png");
  FBDavid = loadImage("DavidBlock.png");
  FBKraig = loadImage("KraigBlock.png");

  // Load Special Images
  SSKyle= loadImage("KyleSpecial.png");
  SSJulia= loadImage("JuliaSpecial.png");
  SSRavandu= loadImage("RavanduSpecial.png");
  SSLiam= loadImage("LiamSpecial.png");
  SSDavid= loadImage("DavidSpecial.png");
  SSKraig= loadImage("KraigSpecial.png");

  // Load Victory Images
  VKyle= loadImage("KyleVictory.png");
  VJulia= loadImage("JuliaVictory.png");
  VRavandu= loadImage("RavanduVictory.png");
  VLiam= loadImage("LiamVictory.png");
  VDavid= loadImage("DavidVictory.png");
  VKraig= loadImage("KraigVictory.png");

  // Load Defeat Images
  DKyle= loadImage("KyleDefeat.png");
  DJulia= loadImage("JuliaDefeat.png");
  DRavandu= loadImage("RavanduDefeat.png");
  DLiam= loadImage("LiamDefeat.png");
  DDavid= loadImage("DavidDefeat.png");
  DKraig= loadImage("KraigDefeat.png");

  // Load arena image
  arena = loadImage("BattleArena.png");

  // Music
  theme = new SoundFile(this, "Sword_Fight_On_The_Heights.mp3");
  theme.loop();
}

void draw() {
  
  println(gameOver); 
  // MENU
  background(#FAF5E8);
  title = createFont("Georgia", 120);
  ChooseFighter = createFont("Georgia", 120);
  Subtitle = createFont("Georgia", 120);
  Play = createFont("Georgia", 20); // Fixed font size for Play
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

  // Images (Character images)
  image(Kyle, 100, 100);
  image(Julia, 150, 100);
  image(Ravandu, 200, 100);
  image(Liam, 250, 100);
  image(David, 300, 100);
  image(Kraig, 320, 120);

  // Add the bouncing circle
  drawBouncingCircle();

  // Transition logic
  if (buttonPressed) {
    transition.select();
  }
}

void drawBouncingCircle() {
  // Draw the bouncing circle
  fill(0, 150, 255); // Blue color for the circle
  noStroke();
  ellipse(circleX, circleY, circleRadius * 2, circleRadius * 2);

  // Update the circle's position
  circleX += xSpeed;
  circleY += ySpeed;

  // Bounce the circle off the edges of the screen
  if (circleX > width - circleRadius || circleX < circleRadius) {
    xSpeed *= -1; // Reverse direction on X axis
  }

  if (circleY > height - circleRadius || circleY < circleRadius) {
    ySpeed *= -1; // Reverse direction on Y axis
  }
}

void mousePressed() {
  // Character Selection
  if (buttonPressed) {
    // Character selection rectangle checks
    if (mouseX >= 0 && mouseX <= 150 && mouseY >= 180 && mouseY <= 380) {
      if (fighterCount == 0) {
        character1 = DFKyle;
        println("character1 is KYLE");
      } else if (fighterCount == 1) {
        character2 = DFKyle;
        println("character2 is KYLE");
      }
      fighterCount++;
    } else if (mouseX >= 150 && mouseX <= 300 && mouseY >= 180 && mouseY <= 380) {
      if (fighterCount == 0) {
        character1 = DFJulia;
        println("character1 is JULIA");
      } else if (fighterCount == 1) {
        character2 = DFJulia;
        println("character2 is JULIA");
      }

      fighterCount++;
    } else if (mouseX >= 300 && mouseX <= 450 && mouseY >= 180 && mouseY <= 380) {
      if (fighterCount == 0) {
        character1 = DFRavandu;
        println("character1 is RAVANDU");
      } else if (fighterCount == 1) {
        character2 = DFRavandu;
        println("character2 is RAVANDU");
      }

      fighterCount++;
    } else if (mouseX >= 450 && mouseX <= 600 && mouseY >= 180 && mouseY <= 380) {
      if (fighterCount == 0) {
        character1 = DFLiam;
        println("character1 is LIAM");
      } else if (fighterCount == 1) {
        character2 = DFLiam;
        println("character2 is LIAM");
      }

      fighterCount++;
    } else if (mouseX >= 0 && mouseX <= 150 && mouseY >= 380 && mouseY <= 580) {
      if (fighterCount == 0) {
        character1 = DFDavid;
        println("character1 is DAVID");
      } else if (fighterCount == 1) {
        character2 = DFDavid;
        println("character2 is DAVID");
      }

      fighterCount++;
    } else if (mouseX >= 150 && mouseX <= 300 && mouseY >= 380 && mouseY <= 580) {
      if (fighterCount == 0) {
        character1 = DFKraig;
        println("character1 is KRAIG");
      } else if (fighterCount == 1) {
        character2 = DFKraig;
        println("character2 is KRAIG");
      }
      fighterCount++;
    }
  } else if (mouseX >= 0 && mouseX <= 150 && mouseY >= 280 && mouseY <= 380) {
    // Play button clicked
    buttonPressed = true;
    characterSelect = true;
    rect(0, 280, 150, 100);
  }
  if (gameOver && mouseX >= 250 && mouseX <= 350 && mouseY >= 500 && mouseY <= 550) {
    // Reset the game
    battleCount = 0; // Reset battle state
  }
}
void keyPressed() {
  if (WeareFighting == 1) {
    if (battleCount == 0) {
      // Player A's turn (Attack, Block, Special)
      if (key == 'a') {
        if (character1 == DFKyle) {
          character1 = FSKyle;
        } else if (character1 == DFJulia) {
          character1 = FSJulia;
        } else if (character1 == DFRavandu) {
          character1 = FSRavandu;
        } else if (character1 == DFLiam) {
          character1 = FSLiam;
        } else if (character1 == DFDavid) {
          character1 = FSDavid;
        } else if (character1 == DFKraig) {
          character1 = FSKraig;
        }
        battleCount = 1;
      } else if (key == 's') {  // Block action
        if (character1 == DFKyle) {
          character1 = FBKyle;
        } else if (character1 == DFJulia) {
          character1 = FBJulia;
        } else if (character1 == DFRavandu) {
          character1 = FBRavandu;
        } else if (character1 == DFLiam) {
          character1 = FBLiam;
        } else if (character1 == DFDavid) {
          character1 = FBDavid;
        } else if (character1 == DFKraig) {
          character1 = FBKraig;
        }
        battleCount = 1;
      } else if (key == 'd') {  // Special action
        if (character1 == DFKyle) {
          character1 = SSKyle;
        } else if (character1 == DFJulia) {
          character1 = SSJulia;
        } else if (character1 == DFRavandu) {
          character1 = SSRavandu;
        } else if (character1 == DFLiam) {
          character1 = SSLiam;
        } else if (character1 == DFDavid) {
          character1 = SSDavid;
        } else if (character1 == DFKraig) {
          character1 = SSKraig;
        }
        battleCount = 1;
      }
    } else if (battleCount == 1) {  // Player B's Attack
      if (key == 'j') {
        if (character2 == DFKyle) {
          character2 = SSKyle;
        } else if (character2 == DFJulia) {
          character2 = FSJulia;
        } else if (character2 == DFRavandu) {
          character2 = FSRavandu;
        } else if (character2 == DFLiam) {
          character2 = FSLiam;
        } else if (character2 == DFDavid) {
          character2 = FSDavid;
        } else if (character2 == DFKraig) {
          character2 = FSKraig;
        }
        battleCount = 2;
      } else if (key == 'k') {
        if (character2 == DFKyle) {
          character2 = FBKyle;
        } else if (character2 == DFJulia) {
          character2 = FBJulia;
        } else if (character2 == DFRavandu) {
          character2 = FBRavandu;
        } else if (character2 == DFLiam) {
          character2 = FBLiam;
        } else if (character2 == DFDavid) {
          character2 = FBDavid;
        } else if (character2 == DFKraig) {
          character2 = FBKraig;
        }
        battleCount = 2;
      } else if (key == 'l') {
        if (character2 == DFKyle) {
          character2 = SSKyle;
        } else if (character2 == DFJulia) {
          character2 = SSJulia;
        } else if (character2 == DFRavandu) {
          character2 = SSRavandu;
        } else if (character2 == DFLiam) {
          character2 = SSLiam;
        } else if (character2 == DFDavid) {
          character2 = SSDavid;
        } else if (character2 == DFKraig) {
          character2 = SSKraig;
        }
        battleCount = 2;
      }
    }

    // Reset both players when spacebar is pressed
    if (battleCount == 2 && key == ' ') {
      // Reset both characters to their default images
      if (character1 == FSKyle || character1 == FBKyle || character1 == SSKyle) {
        character1 = DFKyle;
      } else if (character1 == FSJulia || character1 == FBJulia || character1 == SSJulia) {
        character1 = DFJulia;
      } else if (character1 == FSRavandu || character1 == FBRavandu || character1 == SSRavandu) {
        character1 = DFRavandu;
      } else if (character1 == FSLiam || character1 == FBLiam || character1 == SSLiam) {
        character1 = DFLiam;
      } else if (character1 == FSDavid || character1 == FBDavid || character1 == SSDavid) {
        character1 = DFDavid;
      } else if (character1 == FSKraig || character1 == FBKraig || character1 == SSKraig) {
        character1 = DFKraig;
      }

      if (character2 == FSKyle || character2 == FBKyle || character2 == SSKyle) {
        character2 = DFKyle;
      } else if (character2 == FSJulia || character2 == FBJulia || character2 == SSJulia) {
        character2 = DFJulia;
      } else if (character2 == FSRavandu || character2 == FBRavandu || character2 == SSRavandu) {
        character2 = DFRavandu;
      } else if (character2 == FSLiam || character2 == FBLiam || character2 == SSLiam) {
        character2 = DFLiam;
      } else if (character2 == FSDavid || character2 == FBDavid || character2 == SSDavid) {
        character2 = DFDavid;
      } else if (character2 == FSKraig || character2 == FBKraig || character2 == SSKraig) {
        character2 = DFKraig;
      }

      // Reset the battle count for the next round
      battleCount = 0;
    }
  }
  if (WeareFighting == 1) {
    actions.playerAction(key);
  }
}
