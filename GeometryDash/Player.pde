public class Player {
  private double positionX, positionY;
  private double velocityY;
  private int rotation;
  private Hitbox largeHitbox;
  private Hitbox smallHitbox;
  private boolean alive = true;
  private Gamemode gamemode;
  private PImage sprite;
  
  public Player (double x, double y, double velocityY, int r, String mode) {
    positionX = x;
    positionY = y;
    this.velocityY = velocityY;
    rotation = r;
    sprite = loadImage("sprites/cubeIcon1.png");
    largeHitbox = new Hitbox(x-15, y-15, x+15, y+15);
    smallHitbox = new Hitbox(x-3, y-3, x+3, y+3);
    this.gamemode = new Gamemode(this, mode);
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
  public Gamemode gamemode() {
    return gamemode;
  }
  public void setGamemode (Gamemode newMode) {
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
      gamemode.setCanJump(true);
    }
  }
  public void setVelocityY(double vel) {
    velocityY = vel;
  }
  public void setAliveState(boolean newState) {
    if (!noclip || newState) {
      alive = newState;
      if (!newState) {
        deathEffect.play();
      }
    }
  }
  public void setSprite (PImage newSprite) {
    sprite = newSprite;
  }
  public void reset() {
    positionX = PLAYER_OFFSET;
    positionY = height-15;
    velocityY = 0;
    largeHitbox = new Hitbox(positionX-15, positionY-15, positionX+15, positionY+15);
    smallHitbox = new Hitbox(positionX-3, positionY-3, positionX+3, positionY+3);
    gamemode = new Gamemode(this, "cube");
    alive = true;
    sprite = loadImage("sprites/cubeIcon1.png");
  }
}
