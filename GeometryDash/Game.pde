public class Game {
  private Player player;
  private Level levels[];
  private Level currentLevel;
  
  public Game () {
    player = new Player(PLAYER_OFFSET,height-15,0,0, "cube");
    levels = new Level[1];
    levels[0] = new Level("stereomadness", player);
    currentLevel = levels[0];
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
      
    }
  }
  public void playerInput() {
    player.inputPressed();//pixels/frame
  }
}
