public class Portal extends LevelObject {
  private String portalType;
  private double gravity;
  private PImage newSprite;
  
  public Portal(double x, double y, int r, int imageID) {
    super(x, y, r, imageID);
    if (imageID == 13) {
      portalType = "ship";
      gravity = 0.5;
      newSprite = loadImage("sprites/shipIcon1.png");
    } else if (imageID == 12) {
      portalType = "cube";
      gravity = 0.7555815;
      newSprite = loadImage("sprites/cubeIcon1.png");
    }
    setHitbox(new Hitbox(x-15,y-45,x+15,y+45));
  }
  
  public void collideWithPlayer(Player player) {
    if (getHitbox().collidesWith(player.largeHitbox())) {
      player.gamemode().setMode(portalType);
      player.gamemode().setGravity(gravity);
      player.setSprite(newSprite);
    }
  }
}
