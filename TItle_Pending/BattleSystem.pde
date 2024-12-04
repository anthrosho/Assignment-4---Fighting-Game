PImage arena;

class BattleSystem {
  String player1Action = "";
  String player2Action = "";
  boolean player1Input = false;
  boolean player2Input = false;
  boolean gameOver = false; // Track if the game is over
  boolean resetGame = false; // Flag to manage resetting the game
  
  characterSelection selection = new characterSelection();  // Instance of character selection

  void ActionEconomy() {


    image(arena, 0, 0, width, height);
    image(character1, 25, 100);

    WeareFighting = 1;

    player1Health.display();
    player2Health.display();

    if (player1Input && player2Input) {
      resolveActions();
    }

    // Check if the game is over (either player's HP is 0)
    if (player1Health.currentHP <= 0 || player2Health.currentHP <= 0) {
      gameOver = true;
      Over(); // Call Over when the game is over
    }
  }

  void playerAction(char key) {
    if (gameOver) {
      return; // No actions allowed if the game is over
    }

    if (!player1Input && !gameOver) {
      player1Action = keyToAction(key);
      player1Input = true;
    } else if (!player2Input && !gameOver) {
      player2Action = keyToAction(key);
      player2Input = true;
    }
  }

  String keyToAction(char key) {
    if (key == 'a' || key == 'j') return "Attack";
    if (key == 's' || key == 'k') return "Defend";
    if (key == 'd' || key == 'l') return "Special";
    return "";
  }

  void resolveActions() {
    int damage = 0;

    if (player1Action.equals("Attack") && player2Action.equals("Special")) {
      damage = 5;
      player2Health.decreaseHP(damage);
    } else if (player1Action.equals("Defend") && player2Action.equals("Attack")) {
      damage = 3;
      player2Health.decreaseHP(damage);
    } else if (player1Action.equals("Special") && player2Action.equals("Defend")) {
      damage = 5;
      player2Health.decreaseHP(damage);
    } else if (player2Action.equals("Attack") && player1Action.equals("Special")) {
      damage = 5;
      player1Health.decreaseHP(damage);
    } else if (player2Action.equals("Defend") && player1Action.equals("Attack")) {
      damage = 3;
      player1Health.decreaseHP(damage);
    } else if (player2Action.equals("Special") && player1Action.equals("Defend")) {
      damage = 5;
      player1Health.decreaseHP(damage);
    }

    player1Input = false;
    player2Input = false;
  }

  void Over() {
    gameOver = true; 
    // Display reset button when game is over
    fill(255, 0, 0);
    rect(250, 500, 100, 50);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Reset", 300, 525);
  }

  // Reset player 1 character based on current selection
  void resetCharacter1() {
    if (character1 == DFKyle || character1 == FSKyle || character1 == FBKyle || character1 == SSKyle) {
      character1 = DKyle; 
    } else if (character1 == DFJulia || character1 == FSJulia || character1 == FBJulia || character1 == SSJulia) {
      character1 = DJulia;
    } else if (character1 == DFRavandu || character1 == FSRavandu || character1 == FBRavandu || character1 == SSRavandu) {
      character1 = DRavandu;
    } else if (character1 == DFLiam || character1 == FSLiam || character1 == FBLiam || character1 == SSLiam) {
      character1 = DLiam;
    } else if (character1 == DFDavid || character1 == FSDavid || character1 == FBDavid || character1 == SSDavid) {
      character1 = DDavid;
    } else if (character1 == DFKraig || character1 == FSKraig || character1 == FBKraig || character1 == SSKraig) {
      character1 = DKraig;
    }
  }

  // Reset player 2 character based on current selection
  void resetCharacter2() {
    if (character2 == DFKyle || character2 == FSKyle || character2 == FBKyle || character2 == SSKyle) {
      character2 = DKyle; 
    } else if (character2 == DFJulia || character2 == FSJulia || character2 == FBJulia || character2 == SSJulia) {
      character2 = DJulia;
    } else if (character2 == DFRavandu || character2 == FSRavandu || character2 == FBRavandu || character2 == SSRavandu) {
      character2 = DRavandu;
    } else if (character2 == DFLiam || character2 == FSLiam || character2 == FBLiam || character2 == SSLiam) {
      character2 = DLiam;
    } else if (character2 == DFDavid || character2 == FSDavid || character2 == FBDavid || character2 == SSDavid) {
      character2 = DDavid;
    } else if (character2 == DFKraig || character2 == FSKraig || character2 == FBKraig || character2 == SSKraig) {
      character2 = DKraig;
    }
  }
}
