class hpBar {
  float x, y, width, height;
  int currentHP;
  int maxHP;

  hpBar(float tempx, float tempy, int tempmaxHP) {
    x = tempx;
    y = tempy;
    maxHP = tempmaxHP;
    currentHP = maxHP;
    width = 200;
    height = 20;
    
    
    
  }

  void decreaseHP(int amount) {
    currentHP = max(0, currentHP - amount);
  }

  void increaseHP(int amount) {
    currentHP = min(maxHP, currentHP + amount);
  }

  void display() {
    fill(150); 
    rect(x, y, width, height);

    fill(0, 255, 0);
    float hpWidth = map(currentHP, 0, maxHP, 0, width);
    rect(x, y, hpWidth, height);

    fill(0);
    textSize(12);
    textAlign(CENTER, CENTER);
    text(currentHP + "/" + maxHP, x + width / 2, y + height / 2);
  }
}
