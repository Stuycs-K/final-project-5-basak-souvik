import processing.sound.*;
SoundFile deathEffect;

int PLAYER_OFFSET = 225;
Game game;
PImage loadingScreen;
boolean paused = false;
boolean noclip = false;
double FLOOR;

void setup() {
  imageMode(CENTER);
  size(1000,500);
  loadingScreen = loadImage("sprites/loadingScreen.png");
  FLOOR = height-15;
  deathEffect = new SoundFile(this, "deathEffect.mp3");
}

void draw() {
  if (game == null) {
    image(loadingScreen, width/2, height/2);
    if (frameCount > 1) {
      game = new Game();
    }
  } else {
    game.playFrame();
  }
}

void keyPressed () {
  if (key == 'p') {
    paused = !paused;
    if (game.getCurrentLevel() != null) {
      game.getCurrentLevel().pause();
    }
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
  if (key >= '1' && key <= '3') {
    game.selectLevel();
  }
}

void keyReleased() {
  if (key == ' ' || key == CODED && keyCode == UP) {
    game.playerRelease();
  }
}
