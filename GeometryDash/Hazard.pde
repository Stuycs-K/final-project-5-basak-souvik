public class Hazard extends LevelObject {
  public Hazard(double x, double y, int r, int imageID) {
    super(x, y, r, imageID);
    if (imageID == 8) {
      setHitbox(new Hitbox(x-3,y-4,x+3,y+4));
    } else if (imageID == 39) {
      setHitbox(new Hitbox(x-2,y-2,x+2,y+2));
    } else {
      int spriteWidth = getSprite().width;
      int spriteHeight = getSprite().height;
      setHitbox(new Hitbox(x-spriteWidth/2, y-spriteHeight/2, x+spriteWidth/2, y+spriteHeight/2));
    }
  }
  
  public void collideWithPlayer(Player player) {
    if (getHitbox().collidesWith(player.largeHitbox())) {
      player.setAliveState(false);
    }
  }
}
