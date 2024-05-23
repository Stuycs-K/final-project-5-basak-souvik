void setup() {
  Hitbox test1 = new Hitbox(0,0,5,5);
  Hitbox test2 = new Hitbox(3,0,8,5);
  Hitbox test3 = new Hitbox(5,5,10,10);
  Hitbox test4 = new Hitbox(9,2,14,7);
  println(test3.collidesWith(test4));
}
