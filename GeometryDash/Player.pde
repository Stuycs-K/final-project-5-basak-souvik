public class Player {
  private double positionX, positionY;
  private double velocityY;
  private int rotation;
  private Hitbox largeHitbox;
  private Hitbox smallHitbox;
  private boolean alive;
  private Gamemode gamemode;
  private PImage sprite;
  private boolean canInput;
  
  public Player (double x, double y, double velocityY, int r, Gamemode gamemode) {
    positionX = x;
    positionY = y;
    this.velocityY = velocityY;
    rotation = r;
    sprite = loadImage("sprites/playerIcon1.png");
    largeHitbox = new Hitbox(x-15, y-15, x+15, y+15);
    smallHitbox = new Hitbox(x-3, y-3, x+3, y+3);
    this.gamemode = gamemode;
    canInput = true;
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
  public boolean canInput() {
    return canInput;
  }
  public void setCanInput (boolean newVal) {
    canInput = newVal;
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
  public void setVelocityY(double vel) {
    velocityY = vel;
  }
  public void inputPressed () {
    //if gamemode is cube
    gamemode.inputPressed(this);
  }
}
