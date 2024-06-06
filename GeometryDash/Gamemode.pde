public class Gamemode {
  private Player player;
  private String mode;
  private boolean canJump = true;
  private boolean inputHeld = false;
  private double gravity;
  
  public Gamemode (Player player, String mode) {
    this.player = player;
    this.mode = mode;
    if (mode.equals("cube")) {
      gravity = 0.7555815;
    } else if (mode.equals("ship")) {
      gravity = 0.5;
    }
  }
  
  public boolean canJump() {
    return canJump;
  }
  public void setCanJump(boolean newVal) {
    canJump = newVal;
  }
  public String getMode () {
    return mode;
  }
  public void setMode (String newMode) {
    mode = newMode;
  }
  public void setGravity(double newVal) {
    gravity = newVal;
  }
  
  public void updateVelocity() {
    if (player.isAlive() && !paused) {
      if (mode.equals("cube")) {
        if (inputHeld && canJump) {
          player.setVelocityY(-10.07442);
          canJump = false;
        }
        if (player.getVelocityY() >= 13.5018) {
          player.setVelocityY(13.5018);
        }
      } else if (mode.equals("ship")) {
        if (inputHeld) {
          player.setVelocityY(player.getVelocityY()-1.3);
        }
        if (player.getVelocityY() <= -5) {
          player.setVelocityY(-5);
        }
        if (player.getVelocityY() >= 5) {
          player.setVelocityY(5);
        }
      }
      player.setVelocityY(player.getVelocityY()+gravity);
    }
  }
  public void inputPressed() {
    inputHeld = true;
  }
  public void inputReleased() {
    inputHeld = false;
  }
  public boolean getInputHeld () {
    return inputHeld;
  }
}
