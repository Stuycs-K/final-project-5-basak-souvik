public class SolidBlock extends LevelObject {
  public SolidBlock(double x, double y, int r, int imageID) {
    super(x, y, r, imageID);
    //hitbox is 31 by 31 pixels
    setHitbox(new Hitbox(x-15, y-15, x+15, y+15));
  }
  
  public void collideWithPlayer(Player player) {
    if (getHitbox().collidesWith(player.largeHitbox())) {
      if (getHitbox().collidesWith(player.smallHitbox())) {
        if (!noclip) player.setAliveState(false);
      }
      double hitboxIntersection = player.largeHitbox().y2() - getHitbox().y1();
      if (hitboxIntersection <= 6) {
        player.addY(-hitboxIntersection);
        player.setVelocityY(0);
      }
    }
  }
}
