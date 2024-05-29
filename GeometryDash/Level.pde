import java.io.File;
import java.util.Scanner;
import java.io.FileNotFoundException;

public class Level {
  private Player player;
  private LevelObject objectList[];
  private int startIndex = 0;
  
  public Level (String levelName, Player player) {
    this.player = player;
    if (levelName.equals("stereomadness")) {
      objectList = new StereoMadness().objectList;
    }
  }
  
  public void drawMap() {
    for (int i = startIndex; i < objectList.length; i++) {
      if (objectList[i].getX() < player.getX()-playerOffset) {
        //startIndex++;
      } else if (objectList[i].getX()-player.getX()-playerOffset > width) {
        //break;
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
    //try {
    //  File file = new File("stereomadness.txt");
    //  Scanner in = new Scanner(file);
    //  int numObjects = in.nextInt();
    //  LevelObject[] output = new LevelObject[numObjects];
    //  for (int i = 0; i < numObjects; i++) {
    //    String[] line = in.nextLine().split(",");
    //    if (line[0].equals("Hazard")) {
    //      output[i] = new Hazard(Double.parseDouble(line[1]), Double.parseDouble(line[2]), Integer.parseInt(line[3]), Integer.parseInt(line[4]));
    //    }
    //  }
    //  in.close();
    //  return output;
    //} catch (FileNotFoundException e) {println("not found");}
    //return null;
    //String[] lines = loadStrings("stereomadness.txt");
    //LevelObject[] output = new LevelObject[lines.length];
    //for (int i = 0; i < lines.length; i++) {
    //  String[] line = lines[i].split(",");
      
    //}
    return null;
  }
}
