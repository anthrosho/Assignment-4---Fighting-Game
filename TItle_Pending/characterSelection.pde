class characterSelection {

  void select() {
    background(#FAF5E8);
    fill(#FFDBB7);
    rect(0, 200, 600, 600); // Draw the enclosing rectangle

    // image location
    Kyle = loadImage("KyleDefault-removebg-preview.png");
    Kyle.resize(100, 200);

    Julia = loadImage("JuliaDefault-removebg-preview.png");
    Julia.resize(100, 200);

    Ravandu = loadImage("Ravandu-removebg-preview.png");
    Ravandu.resize(100, 200);

    Liam = loadImage("Liam-removebg-preview.png");
    Liam.resize(100, 200);

    David = loadImage("David-removebg-preview.png");
    David.resize(100, 200);

    Kraig = loadImage("Kraig_CharSelect-removebg-preview.png");
    Kraig.resize(100, 200);



    // Draw title text
    textAlign(CENTER, CENTER); // Center-align the text horizontally and vertically
    textSize(40); // Set the font size
    fill(#000000); // Set text color
    text("Choose your Fighter!", width / 2, 100); // Display text at the top center

    // Draw rectangles
    int count = 0; // Counter to limit the number of rectangles
    for (int y = 200; y < 780; y += 200) { // Adjust the step for better distribution
      for (int x = 0; x < 600; x += 150) {
        if (count >= 6) break; // Stop once 6 rectangles are drawn
        fill(#FFEBB2);
        rect(x, y, 150, 200);
        count++;
      }
      //image locations
      image(Kyle, 0, 200);
      image(Julia, 180, 200);
      image(Ravandu, 340, 200);
      image(Liam, 480, 200);
      image(David, 25, 390);
      image(Kraig, 180, 390);
      if (count >= 6) break; // Exit the outer loop as well
    }
  }
  
}
