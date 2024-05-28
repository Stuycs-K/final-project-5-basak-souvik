public abstract class LevelObject {
  private double positionX;
  private double positionY;
  private int rotation;
  private PImage sprite;
  private Hitbox hitbox;
  
  public LevelObject(double x, double y, int r, int imageID) {
    positionX = x;
    positionY = y;
    rotation = r;
    sprite = loadImage("sprites/" + imageID + "_" + r + ".png");
  }
  
  public void displayObject(double xOffset){
    if (sprite != null) {
      image(sprite, (float) (positionX-xOffset), (float) (positionY));
    }
  }
  
  public abstract void collideWithPlayer(Player player);
  
  public double getX() {
    return positionX;
  }
  public double getY() {
    return positionY;
  }
  public int getRotation() {
    return rotation;
  }
  public PImage getSprite() {
    return sprite;
  }
  public Hitbox getHitbox() {
    return hitbox;
  }
  //called in child classes
  public void setHitbox(Hitbox box) {
    hitbox = box;
  }
}
