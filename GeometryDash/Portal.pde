public class Portal extends LevelObject {
  private String portalType;
  
  public Portal(double x, double y, int r, int imageID) {
    super(x, y, r, imageID);
    if (imageID == 13) {
      portalType = "ship";
    } else if (imageID == 12) {
      portalType = "cube";
    }
  }
  
  public void collideWithPlayer(Player player) {
    player.setGamemode(portalType);
  }
}
