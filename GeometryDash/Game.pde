public class Game {
  private Player player;
  private Level levels[];
  private Level currentLevel;
  
  public Game () {
    player = new Player(225,height-15,0,0, "cube");
    levels = new Level[1];
    levels[0] = new Level("stereomadness", player);
    currentLevel = levels[0];
  }
  
  public void playFrame() {
    background(#283EFF);   
    if (currentLevel != null) {
      if (noclip) {
        text("NOCLIP", 20, 20);
      }
      if (paused) {
        text("PAUSED", 20, 40);
      }
      if (!player.isAlive()) {
        player.reset(225);
        currentLevel.reset();
      }
      player.displayPlayer();
      currentLevel.drawMap();
      currentLevel.movePlayer();
    }
  }
  public void playerInput() {
    player.inputPressed();//pixels/frame
  }
}
