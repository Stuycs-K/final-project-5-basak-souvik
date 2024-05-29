int playerOffset = 210;
Game game;
boolean paused = false;
PImage test;

void setup() {
  imageMode(CENTER);
  size(1000,500);
  game = new Game();
  test = loadImage("sprites/8_0.png");
}

void draw() {
  game.playFrame();
}

void keyPressed () {
  if (key == 'p') {
    paused = !paused;
  }
}
