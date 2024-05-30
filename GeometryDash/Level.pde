public class Level {
  private Player player;
  private LevelObject objectList[];
  private int drawStartIndex = 0;
  private int collisionStartIndex = 0;
  
  public Level (String levelName, Player player) {
    this.player = player;
    objectList = readLevelFile(levelName+".txt");
  }
  
  public void drawMap() {
    for (int i = drawStartIndex; i < objectList.length; i++) {
      if (objectList[i].getX() < player.getX()-PLAYER_OFFSET) {
        drawStartIndex++;
      } else if (objectList[i].getX()-player.getX()-PLAYER_OFFSET > width) {
        break;
      } else {
        objectList[i].displayObject(player.getX()-PLAYER_OFFSET);
      }
    }
  }
  
  public void calculateCollisions() {
    for (int i = collisionStartIndex; i < objectList.length; i++) {
      if (objectList[i].getX() < player.getX()-45) {
        collisionStartIndex++;
      } else if (objectList[i].getX()-player.getX() > 45) {
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
  
  public void movePlayer() {
    player.setVelocityY(player.getVelocityY()+gravity);
    if (player.getVelocityY() >= 13.5018) {
      player.setVelocityY(13.5018);
    }
    for (int i = 0; i < 10; i++) {
      player.addY(player.getVelocityY()/10);
      calculateCollisions();
    }
    if (!paused && player.isAlive()) {
      player.addX(5.193);//5.193
    }
  }
  
  public void reset() {
    try {
      Thread.sleep(1000);
    } catch (InterruptedException e) {}
    player.reset();
    drawStartIndex = 0;
    collisionStartIndex = 0;
  }
}
