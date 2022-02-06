class Player {
  float xpos;

  float ypos;

  int lives = 3;

  Player(int screen_y) {
    xpos = SCREEN_X / 2;
    ypos = screen_y;
  }

  void move(float x) {
    if (x > SCREEN_X - PADDLE_WIDTH) {
      xpos = SCREEN_X - PADDLE_WIDTH;
    } else {
      xpos = x;
    }
  }

  void decreaseLives() {
    lives--;
  }

  void moveTowardsBall() {
    if (theBall.x > (xpos + 50)) {
      move(xpos + difficulty);
    } 
    else if (theBall.x < (xpos + 50)) {
      move(xpos - difficulty);
    }
  }


  void draw(int textX, int textY, color colour) {
    fill(colour);
    rect(xpos, ypos, PADDLE_WIDTH, PADDLE_HEIGHT);
    PFont myFont = loadFont("DialogInput.bold-48.vlw");
    textFont(myFont);
    text(lives, textX, textY);
  }
}
