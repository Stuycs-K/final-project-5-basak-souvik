public class Game {
  private Player player;
  private Level levels[];
  private Level currentLevel;
  private PImage title;
  
  public Game () {
    player = new Player(PLAYER_OFFSET,height-15,0,0, "cube");
    levels = new Level[3];
    levels[0] = new Level("stereomadness", player);
    levels[1] = new Level("backontrack", player);
    levels[2] = new Level("minichallenge", player);
    title = loadImage("sprites/title.png");
  }
  public Level getCurrentLevel() {
    return currentLevel;
  }
  public void playFrame() {
    background(#283EFF);
    if (currentLevel != null) {//currently playing a level
      if (noclip) {
        text("NOCLIP", 20, 20);
      }
      if (paused) {
        text("PAUSED. Press e to exit to main menu", 20, 40);
      }
      if (!player.isAlive()) {
        currentLevel.reset(true);
      }
      player.displayPlayer();
      currentLevel.drawMap();
      if (currentLevel.movePlayer()) {
        exitLevel();
      }
    } else {//in menu
      image(title, width/2, 50);
      textSize(30);
      text("Press 1 to play Stereo Madness", 60, 120);
      text("Press 2 to play Back on Track", 60, 170);
      text("Press 3 to play a challenge level", 60, 220);
      textSize(12);
    }
  }
  public void playerInput() {
    player.gamemode().inputPressed();
  }
  public void playerRelease() {
    player.gamemode().inputReleased();
  }
  public void selectLevel() {
    if (currentLevel == null) {
      currentLevel = levels[key - '0'-1];
      currentLevel.getSong().cue(0);
      currentLevel.getSong().play();
    }
  }
  public void exitLevel() {
    currentLevel.reset(false);
    currentLevel = null;
    paused = false;
  }
}
