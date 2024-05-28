int playerOffset = 210;
Game game;

void setup() {
  imageMode(CENTER);
  size(1000,600);
  game = new Game();
}

void draw() {
  game.playFrame();
}

void keyPressed () {
  
}
