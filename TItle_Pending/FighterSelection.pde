class FighterSelection {

  void Battle() {
    //Fight Images
    image(DFKyle, 300, 600);
    image(DFJulia, 150, 100);
    image(DFRavandu, 200, 100);
    image(DFLiam, 250, 100);
    image(DFDavid, 300, 100);
    image(DFKraig, 320, 120);

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
