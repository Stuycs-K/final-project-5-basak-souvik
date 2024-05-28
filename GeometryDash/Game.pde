public class Game {
  private Player player;
  private Level levels[];
  private Level currentLevel;
  
  public Game () {
    player = new Player(225,height-15,0,0, new Gamemode("cube"));
    levels = new Level[1];
    levels[0] = new Level("Stereo Madness", player);
    currentLevel = levels[0];
  }
  
  public void playFrame() {
    background(#283EFF);
    if (currentLevel != null) {
      player.displayPlayer();
      currentLevel.drawMap();
      currentLevel.calculateCollisions();
      //if (player.isAlive()) {
        player.addX(8);//5.193
      //}
    }
  }
}
