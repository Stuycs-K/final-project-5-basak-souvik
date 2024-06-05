public class Level {
  private Player player;
  private LevelObject objectList[];
  private int drawStartIndex = 0;
  private int collisionStartIndex = 0;
  private SoundFile song;
  
  public Level (String levelName, Player player) {
    this.player = player;
    try {
      objectList = readLevelFile(levelName+".txt");
      song = new SoundFile(GeometryDash.this, "data/"+levelName+".mp3");
    } catch (Exception e) {}
  }
  public SoundFile getSong() {
    return song;
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
      } else if (line[0].equals("JumpPad")) {
        output[i] = new JumpPad(Double.parseDouble(line[1]),height-Double.parseDouble(line[2]),Integer.parseInt(line[3]),Integer.parseInt(line[4]));
      }
    }
    return output;
  }
  
  public boolean movePlayer() {
    if (!paused) {
      player.gamemode().updateVelocity();
      for (int i = 0; i < 10; i++) {
        player.addY(player.getVelocityY()/10);
        calculateCollisions();
        if (player.getVelocityY() == 0) {
          player.gamemode().setCanJump(true);
        } else {
          player.gamemode().setCanJump(false);
        }
      }
      player.addX(5.193);
    }
    return player.getX() > objectList[objectList.length-1].getX()+210;
  }
  
  public void reset(boolean respawn) {
    song.cue(0);
    if (respawn) {
      try {
        Thread.sleep(1000);
      } catch (InterruptedException e) {}
    }
    player.reset();
    drawStartIndex = 0;
    collisionStartIndex = 0;
    if (respawn) {
      song.play();//when respawn is false, player is exiting the level
    }
  }
  public void pause () {
    if (paused) {
      song.pause();
    } else {
      song.play();
    }
  }
}
