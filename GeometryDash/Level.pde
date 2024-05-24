public class Level {
  private Player player;
  private LevelObject objectList[];
  
  public Level (int numObjects) {
    objectList = new LevelObject[numObjects];
    //test
    objectList[0] = new SolidBlock(525,15,0,1);
    objectList[1] = new SolidBlock(555,15,0,1);
  }
  
  public void drawMap(double playerX) {
    for (int i = 0; i < objectList.length; i++) {
      objectList[i].displayObject(playerX);
    }
  }
  
  public void calculateCollisions() {
    
  }
}
