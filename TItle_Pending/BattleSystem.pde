PImage arena;  

class BattleSystem {
  String player1Action = "";
  String player2Action = "";
  boolean player1Input = false;
  boolean player2Input = false;

  void ActionEconomy() {
    image(arena, 0, 0, width, height); 

    image(character1, 25, 100); 


    WeareFighting = 1;

    player1Health.display();
    player2Health.display();

    if (player1Input && player2Input) {
      resolveActions();
    }
  }

  void playerAction(char key) {
    if (!player1Input) {
      player1Action = keyToAction(key);
      player1Input = true;
    } else if (!player2Input) {
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

    println("Player 1: " + player1Action + ", Player 2: " + player2Action);
    println("Damage dealt: " + damage);

    player1Input = false;
    player2Input = false;
  }


}
