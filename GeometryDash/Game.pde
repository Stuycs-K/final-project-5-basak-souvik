public class Game {
  private Player player;
  private Level levels[];
  private Level currentLevel;
  private PImage title;
  
  public Game () {
    player = new Player(PLAYER_OFFSET,height-15,0,0, "cube");
    levels = new Level[2];
    levels[0] = new Level("stereomadness", player);
    levels[1] = new Level("minichallenge", player);
    //currentLevel = levels[0];
    title = loadImage("sprites/title.png");
  }
  
  public void playFrame() {
    background(#283EFF);
    if (currentLevel != null) {//currently playing a level
      if (noclip) {
        text("NOCLIP", 20, 20);
      }
      if (paused) {
        text("PAUSED", 20, 40);
      }
      if (!player.isAlive()) {
        currentLevel.reset();
      }
      player.displayPlayer();
      currentLevel.drawMap();
      currentLevel.movePlayer();
    } else {//in menu
      image(title, width/2, 50);
    }
  }
  public void playerInput() {
    player.gamemode().inputPressed();//pixels/frame
  }
  public void playerRelease() {
    player.gamemode().inputReleased();
  }
}
