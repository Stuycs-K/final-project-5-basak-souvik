public class Level {
  private Player player;
  private LevelObject objectList[];
  private int startIndex = 0;
  
  public Level (int numObjects) {
    objectList = new LevelObject[numObjects];
    //test
    objectList[0] = new SolidBlock(525,15,0,1);
    objectList[1] = new SolidBlock(555,15,0,1);
    objectList[2] = new Hazard(2000,15,0,1);
  }
  
  public void drawMap(double playerX) {
    for (int i = startIndex; i < objectList.length; i++) {
      if (objectList[i].getX() < playerX-playerOffset) {
        startIndex++;
      } else if (objectList[i].getX()-playerX-playerOffset > width) {
        break;
      } else {
        objectList[i].displayObject(playerX);
      }
    }
  }
  
  public void calculateCollisions() {
    
  }
}
