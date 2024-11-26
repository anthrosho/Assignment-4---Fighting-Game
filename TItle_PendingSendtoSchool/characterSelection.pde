class characterSelection {

  void select() {
    background(#FAF5E8); 
    fill(#FFDBB7);
    rect(0, 180, 600, 600); // Draw the enclosing rectangle

    // Draw title text
    textAlign(CENTER, CENTER); // Center-align the text horizontally and vertically
    textSize(40); // Set the font size
    fill(#000000); // Set text color
    text("Choose your Fighter!", width / 2, 100); // Display text at the top center

    // Draw rectangles
    int count = 0; // Counter to limit the number of rectangles
    for (int y = 180; y < 780; y += 200) { // Adjust the step for better distribution
      for (int x = 0; x < 600; x += 150) {
        if (count >= 6) break; // Stop once 6 rectangles are drawn
        fill(#FFEBB2); 
        rect(x, y, 150, 200); 
        count++;
      }
      if (count >= 6) break; // Exit the outer loop as well
    }
  }
}
