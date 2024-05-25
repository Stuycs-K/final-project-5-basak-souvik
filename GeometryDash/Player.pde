public class Player {
  private double positionX, positionY;
  private double velocityY;
  private int rotation;
  private Hitbox largeHitbox;
  private Hitbox smallHitbox;
  private boolean alive;
  private String gamemode;
  private PImage sprite;
  
  public Player (double x, double y, double velociyY, int r, String gamemode) {
    positionX = x;
    positionY = y;
    this.velocityY = velocityY;
    rotation = r;
    sprite = loadImage("sprites/playerIcon1.png");
    largeHitbox = new Hitbox(x-15, y-15, x+15, y+15);
    smallHitbox = new Hitbox(x-2, y-2, x+2, y+2);
    this.gamemode = gamemode;
  }
  
  public void displayPlayer() {
    image(sprite, 210, (float) (height-positionY));
  }
  
  public double getX() {
    return positionX;
  }
  public double getY() {
    return positionY;
  }
  public void addX(double x) {
    positionX += x;
    largeHitbox.addX(x);
    smallHitbox.addX(x);
  }
  public void addY(double y) {
    positionY += y;
    largeHitbox.addY(y);
    smallHitbox.addY(y);
  }
}
