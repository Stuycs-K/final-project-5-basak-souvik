public abstract class LevelObject {
  private double positionX;
  private double positionY;
  private int rotation;
  private PImage sprite;
  private Hitbox hitbox;
  
  public LevelObject(double x, double y, int r, PImage img) {
    positionX = x;
    positionY = y;
    rotation = r;
    sprite = img;
  }
  
  public void displayObject(){
    image(sprite, (float) positionX-15, (float) (height-positionY-15));
  }
  //public abstract void collideWithPlayer(Player player);
  
  public double getX() {return positionX;}
  public double getY() {return positionY;}
  public int getRotation() {return rotation;}
  public PImage getSprite() {return sprite;}
  public Hitbox getHitbox() {return hitbox;}
}
