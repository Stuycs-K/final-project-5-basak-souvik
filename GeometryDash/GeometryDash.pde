Level level;
Player player;
int playerOffset = 210;

void setup() {
  imageMode(CENTER);
  //Hitbox test1 = new Hitbox(0,0,5,5);
  //Hitbox test2 = new Hitbox(3,0,8,5);
  //Hitbox test3 = new Hitbox(5,5,10,10);
  //Hitbox test4 = new Hitbox(6,6,7,7);
  //println(test3.collidesWith(test4));
  size(1000,600);
  player = new Player(225,height-15,0,0, new Gamemode("cube"));
  level = new Level(33, player);
}
  
void draw() {
  background(#0000FF);
  player.displayPlayer();
  level.drawMap();
  level.calculateCollisions();
  player.addX(3.5);
  player.addY(player.getVelocityY());
}

void keyPressed () {
  if (key == ' ') {
    
  }
}
