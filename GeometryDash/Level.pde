public class Level {
  private Player player;
  private LevelObject objectList[];
  private int startIndex = 0;
  
  public Level (int numObjects, Player player) {
    objectList = new LevelObject[numObjects];
    this.player = player;
    //test
    objectList[0] = new SolidBlock(525,height+9,0,1);
    objectList[1] = new SolidBlock(555,height+3,0,1);
    objectList[2] = new SolidBlock(585,height-3,0,1);
    objectList[3] = new SolidBlock(615,height-9,0,1);
    objectList[4] = new SolidBlock(645,height-15,0,1);
  }
  
  public void drawMap() {
    for (int i = startIndex; i < objectList.length; i++) {
      if (objectList[i].getX() < player.getX()-playerOffset) {
        startIndex++;
      } else if (objectList[i].getX()-player.getX()-playerOffset > width) {
        break;
      } else {
        objectList[i].displayObject(player.getX()-playerOffset);
      }
    }
  }
  
  public void calculateCollisions() {
    for (int i = startIndex; i < objectList.length; i++) {
      if (objectList[i].getX() < player.getX()-playerOffset) {
        startIndex++;
      } else if (objectList[i].getX()-player.getX()-playerOffset > width) {
        break;
      } else {
        objectList[i].collideWithPlayer(player);
      }
    }
  }
}
