import processing.sound.*;
SoundFile deathEffect;

int PLAYER_OFFSET = 225;
Game game;
boolean paused = false;
boolean noclip = false;
double FLOOR;

void setup() {
  imageMode(CENTER);
  size(1000,500);
  FLOOR = height-15;
  game = new Game();
  deathEffect = new SoundFile(this, "deathEffect.mp3");
}

void draw() {
  game.playFrame();
}

void keyPressed () {
  if (key == 'p') {
    paused = !paused;
    game.getCurrentLevel().pause();
  }
  if (key == 'n') {
    noclip = !noclip;
  }
  if ((key == ' ' || key == CODED && keyCode == UP) && !paused) {
    game.playerInput();
  }
  if (key == 'e' && paused) {
    game.exitLevel();
  }
  if (key >= '1' && key <= '2') {
    game.selectLevel();
  }
}

void keyReleased() {
  if (key == ' ' || key == CODED && keyCode == UP) {
    game.playerRelease();
  }
}
