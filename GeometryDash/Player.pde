public class Player {
  private double positionX, positionY;
  private double velocityY;
  private int rotation;
  private Hitbox largeHitbox;
  private Hitbox smallHitbox;
  private boolean alive;
  private Gamemode gamemode;
  private PImage sprite;
  
  public Player (double x, double y, double velocityY, int r, Gamemode gamemode) {
    positionX = x;
    positionY = y;
    this.velocityY = velocityY;
    rotation = r;
    sprite = loadImage("sprites/playerIcon1.png");
    largeHitbox = new Hitbox(x-15, y-15, x+15, y+15);
    smallHitbox = new Hitbox(x-3, y-3, x+3, y+3);
    this.gamemode = gamemode;
  }
  
  public void displayPlayer() {
    image(sprite, playerOffset, (float) (positionY));
  }
  
  public double getX() {
    return positionX;
  }
  public double getY() {
    return positionY;
  }
  public double getVelocityY() {
    return velocityY;
  }
  public Hitbox largeHitbox() {
    return largeHitbox;
  }
  public Hitbox smallHitbox() {
    return smallHitbox;
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
  public void addVelocityY(double vel) {
    velocityY += vel;
  }
  public void inputPressed () {
    //if gamemode is cube
    
  }
}
