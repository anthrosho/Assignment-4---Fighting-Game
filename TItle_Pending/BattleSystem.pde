PImage arena;  // Declare the PImage variable

class BattleSystem {
  void ActionEconomy() {
    image(arena, 0, 0, width, height);  // Display the arena image as the background
    
    image(character1, 25, 100);  

    WeareFighting = 1;

    player1Health.display();
    player2Health.display();
  }
}
