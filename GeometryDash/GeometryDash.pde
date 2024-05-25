Level level;
Player player;

void setup() {
  imageMode(CENTER);
  //Hitbox test1 = new Hitbox(0,0,5,5);
  //Hitbox test2 = new Hitbox(3,0,8,5);
  //Hitbox test3 = new Hitbox(5,5,10,10);
  //Hitbox test4 = new Hitbox(6,6,7,7);
  //println(test3.collidesWith(test4));
  size(1000,600);
  level = new Level(2);
  player = new Player(15,15,0,0, "cube");
}
  
void draw() {
  background(255);
  player.displayPlayer();
  level.drawMap(player.getX());
  player.setX(player.getX()+3.5);
}
