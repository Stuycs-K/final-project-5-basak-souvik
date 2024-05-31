public class SolidBlock extends LevelObject {
  public SolidBlock(double x, double y, int r, int imageID) {
    super(x, y, r, imageID);
    int spriteWidth = getSprite().width;
    int spriteHeight = getSprite().height;
    setHitbox(new Hitbox(x-spriteWidth/2, y-spriteHeight/2, x+spriteWidth/2, y+spriteHeight/2));
  }
  
  public void collideWithPlayer(Player player) {
    if (getHitbox().collidesWith(player.largeHitbox())) {
      if (getHitbox().collidesWith(player.smallHitbox())) {
        player.setAliveState(false);
      }
      double hitboxIntersection = player.largeHitbox().y2() - getHitbox().y1();
      if (hitboxIntersection <= 6) {
        player.addY(-hitboxIntersection);
        player.setVelocityY(0);
        player.setCanInput(true);
      }
    }
  }
}
