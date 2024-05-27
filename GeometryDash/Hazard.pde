public class Hazard extends LevelObject {
  public Hazard(double x, double y, int r, int imageID) {
    super(x, y, r, imageID);
    if (imageID == 8) {
      setHitbox(new Hitbox(x-3,y-4,x+3,y+4));
    } else if (imageID == 39) {
      setHitbox(new Hitbox(x-3,y-3,x+3,y+3));
    }  else {
      setHitbox(new Hitbox(0,0,0,0));
    }
  }
  
  public void collideWithPlayer(Player player) {
    if (getHitbox().collidesWith(player.largeHitbox())) {
      player.setAliveState(false);
    }
  }
}
