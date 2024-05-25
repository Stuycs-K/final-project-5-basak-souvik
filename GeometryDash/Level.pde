public class Level {
  private Player player;
  private LevelObject objectList[];
  private int startIndex = 0;
  
  public Level (int numObjects, Player player) {
    objectList = new LevelObject[numObjects];
    this.player = player;
    //test
    objectList[0] = new SolidBlock(525,height-15,0,8);
    objectList[1] = new SolidBlock(975,height-6,0,39);
    objectList[2] = new SolidBlock(1005,height-15,0,8);
    objectList[3] = new SolidBlock(1485,height-15,0,8);
    objectList[4] = new SolidBlock(1455,height-15,0,8);
    objectList[5] = new SolidBlock(1515,height-15,0,1);
    objectList[6] = new SolidBlock(1545,height-2,0,9);
    objectList[7] = new SolidBlock(1575,height-2,0,9);
    objectList[8] = new SolidBlock(1635,height-45,0,1);
    objectList[9] = new SolidBlock(1605,height-2,0,9);
    objectList[10] = new SolidBlock(1635,height-2,0,9);
    objectList[11] = new SolidBlock(1665,height-2,0,9);
    objectList[12] = new SolidBlock(1635,height-15,0,7);
    objectList[13] = new SolidBlock(1695,height-2,0,9);
    objectList[14] = new SolidBlock(1725,height-2,0,9);
    objectList[15] = new SolidBlock(1755,height-75,0,1);
    objectList[16] = new SolidBlock(1755,height-45,0,7);
    objectList[17] = new SolidBlock(1755,height-15,0,7);
    objectList[18] = new SolidBlock(2385,height-15,0,8);
    objectList[19] = new SolidBlock(2415,height-15,0,8);
    objectList[20] = new SolidBlock(2595,height-15,0,3);
    objectList[21] = new SolidBlock(2625,height-15,0,2);
    objectList[22] = new SolidBlock(2655,height-15,0,2);
    objectList[23] = new SolidBlock(2685,height-15,0,2);
    objectList[24] = new SolidBlock(2715,height-15,0,2);
    objectList[25] = new SolidBlock(2745,height-15,0,2);
    objectList[26] = new SolidBlock(2775,height-15,0,2);
    objectList[27] = new SolidBlock(2805,height-15,0,3);
    objectList[28] = new SolidBlock(2835,height-2,0,9);
    objectList[29] = new SolidBlock(2865,height-2,0,9);
    objectList[30] = new SolidBlock(2895,height-2,0,9);
    objectList[31] = new SolidBlock(2925,height-15,0,3);
    objectList[32] = new SolidBlock(2955,height-15,0,2);
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
