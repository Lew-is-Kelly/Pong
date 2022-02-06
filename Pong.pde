Player thePlayer;

Ball theBall;

Player theOpponent;

color red = color(255, 0, 0);

color white = color(255);

color blue = color(0, 0, 255);

boolean resetBool = true;

float difficulty;

float diffMax = 6;

float diffMin = 5;

void settings() {
  size(SCREEN_X, SCREEN_Y);
}

void setup() {
  frameRate(60);
  thePlayer = new Player(SCREEN_Y-MARGIN-PADDLE_HEIGHT);
  theBall = new Ball();
  theOpponent = new Player(MARGIN);
  ellipseMode(RADIUS);
  difficulty = random(diffMin, diffMax);
}

void mousePressed() {
  loop();
  resetBool = false;
}

void reset() {
  diffMax = 6;
  diffMin = 4;
  resetBool = true;
  theBall = new Ball();
}

void draw() {
  background(0);
  fill(75);
  rect(-10, SCREEN_Y / 2, 9999, 5);

  theBall.move();
  theOpponent.moveTowardsBall();
  thePlayer.move(mouseX);

  theBall.collide(thePlayer, theOpponent);

  thePlayer.draw(1225, 675, blue);
  theOpponent.draw(65, 65, red);
  theBall.draw();

  if (resetBool) {
    noLoop();
  }

  if (theBall.y - theBall.radius >= SCREEN_Y) {
    thePlayer.decreaseLives();
    reset();
  }
  if (theBall.y + theBall.radius <= 0) {
    theOpponent.decreaseLives();
    reset();
  }
  textAlign(CENTER);
  if (thePlayer.lives <= 0) {
    fill(white);
    text("You Lose!", SCREEN_X / 2, SCREEN_Y / 2 - 20);
    noLoop();
    setup();
  }
  if (theOpponent.lives <= 0) {
    fill(white);
    text("You Win!", SCREEN_X / 2, SCREEN_Y / 2 - 20);
    noLoop();
    setup();
  }
}
