public class JumpPad extends LevelObject {
  public JumpPad (double x, double y, int r, int imageID) {
    super(x,y,r,imageID);
    int spriteWidth = getSprite().width;
    int spriteHeight = getSprite().height;
    setHitbox(new Hitbox(x-spriteWidth/2, y-spriteHeight/2, x+spriteWidth/2, y+spriteHeight/2));
  }
  public void collideWithPlayer(Player player){}
}
