public class SolidBlock extends LevelObject {
  public SolidBlock(double x, double y, int r, int imageID) {
    super(x, y, r, imageID);
    setHitbox(new Hitbox(x-15, y-15, x+15, y+15));
  }
}
