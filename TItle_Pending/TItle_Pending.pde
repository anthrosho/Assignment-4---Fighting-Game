import processing.sound.*; //<>// //<>//

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

PImage character1Default;
PImage character2Default;

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


PImage FDKyle;
PImage FDJulia;
PImage  FDRavandu;
PImage  FDLiam;
PImage  FDDavid;
PImage FDKraig;

PImage character1;
PImage character2;

//Objects
characterSelection transition;
FighterSelection transition2;
BattleSystem actions;
hpBar player1Health;
hpBar player2Health;



SoundFile theme;

void setup() {
  size(600, 600);
  transition = new characterSelection();
  transition2 = new FighterSelection();
  actions = new BattleSystem();

  player1Health = new hpBar(50, 30, 20);
  player2Health = new hpBar(350, 30, 20);

  character1Default = character1;
  character2Default = character2;



  // Load images
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


//Load Defence Images 


 DFKyle =  loadImage("KyleDefence.png");
 DFJulia = loadImage("JuliaDefence.png");
 DFRavandu =  loadImage("RavanduDefence.png");
 DFLiam =  loadImage("LiamDefence.png");
 DFDavid =  loadImage("DavidDefence.png");
 DFKraig =  loadImage("KraigDefence.png");




  // Music

  theme = new SoundFile(this, "Sword_Fight_On_The_Heights.mp3");
  theme.loop();
}

void draw() {
  background(#FAF5E8);

  image(DFKyle, 300, 600);
  image(DFJulia, 150, 100);
  image(DFRavandu, 200, 100);
  image(DFLiam, 250, 100);
  image(DFDavid, 300, 100);
  image(DFKraig, 320, 120);

  // Text fonts
  title = createFont("Georgia", 120);
  ChooseFighter = createFont("Georgia", 120);
  Subtitle = createFont("Georgia", 120);
  Play = createFont("Georgia", 20); // Fixed font size for Play



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
  image(Kyle, 100, 100);
  image(Julia, 150, 100);
  image(Ravandu, 200, 100);
  image(Liam, 250, 100);
  image(David, 300, 100);
  image(Kraig, 320, 120);
  println(battleCount);



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
  }
}

void keyPressed() {
  if (WeareFighting == 1) {
    if (battleCount == 0) {  // Player A Attack
      if (key == 'a') {
        if (character1 == DFKyle) {
          character1 = FSKyle;
          println("Player A changes to attack pose: FSKyle");
        } else if (character1 == DFJulia) {
          character1 = FSJulia;
          println("Player A changes to attack pose: FSJulia");
        } else if (character1 == DFRavandu) {
          character1 = FSRavandu;
          println("Player A changes to attack pose: FSRavandu");
        } else if (character1 == DFLiam) {
          character1 = FSLiam;
          println("Player A changes to attack pose: FSLiam");
        } else if (character1 == DFDavid) {
          character1 = FSDavid;
          println("Player A changes to attack pose: FSDavid");
        } else if (character1 == DFKraig) {
          character1 = FSKraig;
          println("Player A changes to attack pose: FSKraig");
        }
            battleCount = 1;  // Switch to Player B's turn
  
    }
    } else if (battleCount == 0) {  // Player A's Defence
      if (key == 's') {
        // Set the correct attack image for Player A
        if (character1 == DFKyle) {
          character1 = FDKyle;
          println("Player A changes to attack pose: FSKyle");
        } else if (character1 == DFJulia) {
          character1 = FDJulia;
          println("Player A changes to attack pose: FSJulia");
        } else if (character1 == DFRavandu) {
          character1 = FDRavandu;
          println("Player A changes to attack pose: FSRavandu");
        } else if (character1 == DFLiam) {
          character1 = FDLiam;
          println("Player A changes to attack pose: FSLiam");
        } else if (character1 == DFDavid) {
          character1 = FDDavid;
          println("Player A changes to attack pose: FSDavid");
        } else if (character1 == DFKraig) {
          character1 = FDKraig;
          println("Player A changes to attack pose: FSKraig");
        }

      }
    } else if (battleCount == 0) {  // Player A's Specia; 
      if (key == 'd') {
        // Set the correct attack image for Player A
        if (character1 == DFKyle) {
          character1 = FSKyle;
          println("Player A changes to attack pose: FSKyle");
        } else if (character1 == DFJulia) {
          character1 = FSJulia;
          println("Player A changes to attack pose: FSJulia");
        } else if (character1 == DFRavandu) {
          character1 = FSRavandu;
          println("Player A changes to attack pose: FSRavandu");
        } else if (character1 == DFLiam) {
          character1 = FSLiam;
          println("Player A changes to attack pose: FSLiam");
        } else if (character1 == DFDavid) {
          character1 = FSDavid;
          println("Player A changes to attack pose: FSDavid");
        } else if (character1 == DFKraig) {
          character1 = FSKraig;
          println("Player A changes to attack pose: FSKraig");
        }

        println("Next turn: Player B");
      }
    } else if (battleCount == 1) {  // Player B's turn
      if (key == 'j') {  // Player B presses 'j'
        // Set the correct attack image for Player B
        if (character2 == DFKyle) {
          character2 = FSKyle;
          println("Player B changes to attack pose: FSKyle");
        } else if (character2 == DFJulia) {
          character2 = FSJulia;
          println("Player B changes to attack pose: FSJulia");
        } else if (character2 == DFRavandu) {
          character2 = FSRavandu;
          println("Player B changes to attack pose: FSRavandu");
        } else if (character2 == DFLiam) {
          character2 = FSLiam;
          println("Player B changes to attack pose: FSLiam");
        } else if (character2 == DFDavid) {
          character2 = FSDavid;
          println("Player B changes to attack pose: FSDavid");
        } else if (character2 == DFKraig) {
          character2 = FSKraig;
          println("Player B changes to attack pose: FSKraig");
        }
      }
      battleCount++;
    }

    // Reset when spacebar is pressed and both players have attacked
    if (battleCount == 2 && key == ' ') {
      // Reset images for both players to fighting stance (DF images)
      if (character1 == FSKyle) {
        character1 = DFKyle;
        println("Player A resets to DFKyle");
      } else if (character1 == FSJulia) {
        character1 = DFJulia;
        println("Player A resets to DFJulia");
      } else if (character1 == FSRavandu) {
        character1 = DFRavandu;
        println("Player A resets to DFRavandu");
      } else if (character1 == FSLiam) {
        character1 = DFLiam;
        println("Player A resets to DFLiam");
      } else if (character1 == FSDavid) {
        character1 = DFDavid;
        println("Player A resets to DFDavid");
      } else if (character1 == FSKraig) {
        character1 = DFKraig;
        println("Player A resets to DFKraig");
      }

      if (character2 == FSKyle) {
        character2 = DFKyle;
        println("Player B resets to DFKyle");
      } else if (character2 == FSJulia) {
        character2 = DFJulia;
        println("Player B resets to DFJulia");
      } else if (character2 == FSRavandu) {
        character2 = DFRavandu;
        println("Player B resets to DFRavandu");
      } else if (character2 == FSLiam) {
        character2 = DFLiam;
        println("Player B resets to DFLiam");
      } else if (character2 == FSDavid) {
        character2 = DFDavid;
        println("Player B resets to DFDavid");
      } else if (character2 == FSKraig) {
        character2 = DFKraig;
        println("Player B resets to DFKraig");
      }

      println("Both players have reset to fighting stance.");
      battleCount = 0; // Reset battleCount for the next round
    }
  }
}
