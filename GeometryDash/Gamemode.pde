public class Gamemode {
  private String mode;
  
  public Gamemode (String initialMode) {
    mode = initialMode;
  }
  public void setGamemode (String newMode) {
    mode = newMode;
  }
  public void inputPressed(Player player) {
    if (player.canInput()) {
      if (mode.equals("cube")) {
        player.setCanInput(false);
        player.setVelocityY(-1.94);
      }
    }
  }
}
