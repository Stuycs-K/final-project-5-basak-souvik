public class DecorationBlock extends LevelObject {
  public DecorationBlock(double x, double y, int r, int imageID) {
    super(x, y, r, imageID);
    setHitbox(new Hitbox(0,0,0,0));
  }
  
  public void collideWithPlayer(Player player) {}
}
