import java.io.File;
import java.util.Scanner;
import java.io.FileNotFoundException;

public class Level {
  private Player player;
  private LevelObject objectList[];
  private int startIndex = 0;
  
  public Level (String levelName, Player player) {
    this.player = player;
    objectList = readLevelFile(levelName+".txt");
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
    String[] lines = loadStrings(filename);
    LevelObject[] output = new LevelObject[lines.length];
    for (int i = 0; i < lines.length; i++) {
      String[] line = lines[i].split(",");
      if (line[0].equals("Hazard")) {
        output[i] = new Hazard(Double.parseDouble(line[1]),height-Double.parseDouble(line[2]),Integer.parseInt(line[3]),Integer.parseInt(line[4]));
      } else if (line[0].equals("DecorationBlock")) {
        output[i] = new DecorationBlock(Double.parseDouble(line[1]),height-Double.parseDouble(line[2]),Integer.parseInt(line[3]),Integer.parseInt(line[4]));
      } else if (line[0].equals("SolidBlock")) {
        output[i] = new SolidBlock(Double.parseDouble(line[1]),height-Double.parseDouble(line[2]),Integer.parseInt(line[3]),Integer.parseInt(line[4]));
      } else if (line[0].equals("Portal")) {
        output[i] = new Portal(Double.parseDouble(line[1]),height-Double.parseDouble(line[2]),Integer.parseInt(line[3]),Integer.parseInt(line[4]));
      }
    }
    return output;
  }
  
  public void reset() {
    startIndex = 0;
  }
}
