public class Game {
  private Player player;
  private Level levels[];
  private Level currentLevel;
  private PImage title;
  private PImage background;
  private PImage levelIcon1;
  private PImage levelIcon2;
  private PImage levelIcon3;
  private PImage instruction;
  
  public Game () {
    player = new Player(PLAYER_OFFSET,height-15,0,0, "cube");
    levels = new Level[3];
    levels[0] = new Level("stereomadness", player);
    levels[1] = new Level("backontrack", player);
    levels[2] = new Level("minichallenge", player);
    title = loadImage("sprites/title.png");
    background = loadImage("sprites/menuBackground.png");
    levelIcon1 = loadImage("sprites/levelIcon1.png");
    levelIcon2 = loadImage("sprites/levelIcon2.png");
    levelIcon3 = loadImage("sprites/levelIcon3.png");
    instruction = loadImage("sprites/instructions.png");
  }
  public Level getCurrentLevel() {
    return currentLevel;
  }
  public void playFrame() {
    if (currentLevel != null) {//currently playing a level
      image(currentLevel.getBackground(), width/2, height/2);
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
      image(background, width/2, height/2);
      image(title, width/2, 50);
      image(levelIcon1, 600, 160);
      image(levelIcon2, 600, 295);
      image(levelIcon3, 600, 430);
      image(instruction, 165, 160);
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
