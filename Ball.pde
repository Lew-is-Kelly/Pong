class Ball {

  float dx; 

  float dy;

  float x;

  float y;

  float speedX = 5;

  float speedY = 5;

  int radius;

  Ball() {
    x = random(SCREEN_X / 4, SCREEN_X / 2);
    y = random(SCREEN_Y / 4, SCREEN_Y / 2);
    dx = speedX;
    dy = speedY;
    radius = 10;
  }

  void collide(Player thePlayer, Player theOpponent) {
    if (x - radius <= 0) {
      println("collided!");
      dx = -dx;
    } else if (x + radius >= SCREEN_X) {
      println("collided!");
      dx = -dx;
    }

    if (y + radius >= thePlayer.ypos &&
      y - radius < thePlayer.ypos + PADDLE_HEIGHT &&
      x >= thePlayer.xpos &&
      x <= thePlayer.xpos + PADDLE_WIDTH) {
      println("collided!");
      dy = -dy;
    }

    if (y + radius >= theOpponent.ypos &&
      y - radius < theOpponent.ypos + PADDLE_HEIGHT &&
      x >= theOpponent.xpos &&
      x <= theOpponent.xpos + PADDLE_WIDTH) {
      println("collided!");
      diffMin *= 1.1;
      diffMax *= 1.1;
      difficulty = random(diffMin, diffMax);
      dy = -dy;
    }

    if (x + radius >= thePlayer.xpos &&
      x - radius < thePlayer.xpos + PADDLE_WIDTH &&
      y >= thePlayer.ypos &&
      y <= thePlayer.ypos + PADDLE_HEIGHT) {
      println("collided!");
      dx = -dx;
    }
    
    if (x + radius >= theOpponent.xpos &&
      x - radius < theOpponent.xpos + PADDLE_WIDTH &&
      y >= theOpponent.ypos &&
      y <= theOpponent.ypos + PADDLE_HEIGHT) {
      println("collided!");
      diffMin *= 1.1;
      diffMax *= 1.1;
      difficulty = random(diffMin, diffMax);
      dy = -dy;
    }
  }

  void move() {
    x = x + dx; 
    y = y + dy;
  }

  void draw() {
    fill(white);
    ellipse(int(x), int(y), radius, radius);
    dx = dx * 1.001;
    dy = dy * 1.001;
    float speed = sqrt(pow(dx, 2) + pow(dy, 2));
    fill(white);
    text("Speed:" + nf(speed, 1, 2), SCREEN_X / 2 - 460, 675);
  }
}
