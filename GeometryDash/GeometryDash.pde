int PLAYER_OFFSET = 210;
Game game;
boolean paused = false;
boolean noclip = false;
double FLOOR;
double gravity = 4.533489/6;

void setup() {
  imageMode(CENTER);
  size(1000,500);
  FLOOR = height-15;
  game = new Game();
}

void draw() {
  game.playFrame();
}

void keyPressed () {
  if (key == 'p') {
    paused = !paused;
  }
  if (key == 'n') {
    noclip = !noclip;
  }
  if (key == ' ') {
    game.playerInput();
  }
}
