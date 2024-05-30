public class Player {
  private double positionX, positionY;
  private double velocityY;
  private int rotation;
  private Hitbox largeHitbox;
  private Hitbox smallHitbox;
  private boolean alive;
  private String gamemode;
  private PImage sprite;
  private boolean canInput;
  
  public Player (double x, double y, double velocityY, int r, String gamemode) {
    positionX = x;
    positionY = y;
    this.velocityY = velocityY;
    rotation = r;
    sprite = loadImage("sprites/playerIcon1.png");
    largeHitbox = new Hitbox(x-15, y-15, x+15, y+15);
    smallHitbox = new Hitbox(x-3, y-3, x+3, y+3);
    this.gamemode = gamemode;
    canInput = true;
    alive = true;
  }
  
  public void displayPlayer() {
    image(sprite, PLAYER_OFFSET, (float) (positionY));
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
  public String gamemode() {
    return gamemode;
  }
  public void setGamemode (String newMode) {
    gamemode = newMode;
  }
  public boolean isAlive() {
    return alive;
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
    
    if (positionY > FLOOR) {
      largeHitbox.addY(FLOOR-positionY);
      smallHitbox.addY(FLOOR-positionY);
      positionY = FLOOR;
      velocityY = 0;
      canInput = true;
    }
  }
  public void setVelocityY(double vel) {
    velocityY = vel;
  }
  public void setAliveState(boolean newState) {
    alive = newState;
  }
  public void setCanInput(boolean newVal) {
    canInput = newVal;
  }
  public void reset(double startX) {
    positionX = startX;
    positionY = height-15;
    velocityY = 0;
    largeHitbox = new Hitbox(positionX-15, positionY-15, positionX+15, positionY+15);
    smallHitbox = new Hitbox(positionX-3, positionY-3, positionX+3, positionY+3);
    gamemode = "cube";
    alive = true;
  }
  
  public void inputPressed() {
    if (gamemode.equals("cube")) {
      println("successful jump");
      cubeJump();
    } else {
      println(positionX);
      paused = true;
    }
  }
  public void cubeJump() {
    if (canInput) {
      velocityY = -10.07442;
      canInput = false;
    }
  }
}
