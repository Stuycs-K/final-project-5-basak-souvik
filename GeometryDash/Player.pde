public class Player {
  private double positionX, positionY;
  private double velocityY;
  private int rotation;
  private Hitbox largeHitbox;
  private Hitbox smallHitbox;
  private boolean alive;
  private Gamemode gamemode;
  
  public Player (double x, double y, double velociyY, int r, Gamemode gamemode) {
    positionX = x;
    positionY = y;
    this.velocityY = velocityY;
    rotation = r;
    largeHitbox = new Hitbox(x-15, y-15, x+15, y+15);
    smallHitbox = new Hitbox(x-2, y-2, x+2, y+2);
  }
}
