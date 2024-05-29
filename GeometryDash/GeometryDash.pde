int playerOffset = 210;
Game game;
boolean paused = false;

void setup() {
  imageMode(CENTER);
  size(1000,500);
  game = new Game();
}

void draw() {
  game.playFrame();
}

void keyPressed () {
  if (key == 'p') {
    paused = !paused;
  }
}
