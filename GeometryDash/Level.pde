import java.io.File;
import java.util.Scanner;
import java.io.FileNotFoundException;

public class Level {
  private Player player;
  private LevelObject objectList[];
  private int startIndex = 0;
  
  public Level (String levelName, Player player) {
    this.player = player;
    objectList = readLevelFile(levelName);
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
  
  public LevelObject[] readLevelFile(String filename) {
    String[] lines = loadStrings("stereomadness.txt");
    LevelObject[] output = new LevelObject[lines.length];
    for (int i = 0; i < lines.length; i++) {
      
    }
    return null;
  }
}
