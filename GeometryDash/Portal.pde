public class Portal extends LevelObject {
  private String portalType;
  private double gravity;
  
  public Portal(double x, double y, int r, int imageID) {
    super(x, y, r, imageID);
    if (imageID == 13) {
      portalType = "ship";
      gravity = 0.5;
    } else if (imageID == 12) {
      portalType = "cube";
      gravity = 0.7555815;
    }
    setHitbox(new Hitbox(x-15,y-45,x+15,y+45));
  }
  
  public void collideWithPlayer(Player player) {
    if (getHitbox().collidesWith(player.largeHitbox())) {
      player.gamemode().setMode(portalType);
      player.gamemode().setGravity(gravity);
    }
  }
}
