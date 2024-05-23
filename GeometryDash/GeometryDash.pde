void setup() {
  Hitbox test1 = new Hitbox(0,0,5,5);
  Hitbox test2 = new Hitbox(3,0,8,5);
  println(test1.collidesWith(test2));
}
