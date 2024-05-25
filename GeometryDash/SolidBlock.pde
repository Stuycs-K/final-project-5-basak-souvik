public class SolidBlock extends LevelObject {
  public SolidBlock(double x, double y, int r, int imageID) {
    super(x, y, r, imageID);
    setHitbox(new Hitbox(x-15, y-15, x+15, y+15));
  }
  
  public void collideWithPlayer(Player player) {
    if (getHitbox().collidesWith(player.largeHitbox())) {
      if (getHitbox().collidesWith(player.smallHitbox())) {
        println("die");
      }
      double hitboxIntersection = player.largeHitbox().y2() - getHitbox().y1();
      println(hitboxIntersection);
    }
  }
}
