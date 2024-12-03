class FighterSelection {

  void Battle() {
    WeareFighting = 1;

    background(255);
    image(character1, 50, 100);
    character1.resize(300, 600);


    pushMatrix();
    scale(-1, 1);
    image(character2, -1000 + 400, 100);
    character2.resize(300, 600);
    popMatrix();
  }
}
