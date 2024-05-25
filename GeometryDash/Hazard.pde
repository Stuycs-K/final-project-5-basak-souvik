public class Hazard extends LevelObject {
  public Hazard(double x, double y, int r, int imageID) {
    super(x, y, r, imageID);
    if (imageID == 8) {
      
    }
  }
  
  public void collideWithPlayer(Player player) {
    if (getHitbox().collidesWith(player.largeHitbox())) {
      player.setAliveState(false);
    }
  }
}
