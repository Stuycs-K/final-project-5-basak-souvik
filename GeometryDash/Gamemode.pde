public class Gamemode {
  private Player player;
  private String mode;
  private boolean canJump = true;
  private boolean shipHeld = false;
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
      player.setVelocityY(player.getVelocityY()+gravity);
      if (mode.equals("cube")) {
        if (player.getVelocityY() >= 13.5018) {
          player.setVelocityY(13.5018);
        }
      } else if (mode.equals("ship")) {
        if (shipHeld) {
          player.setVelocityY(player.getVelocityY()-1.1);
        }
        if (player.getVelocityY() <= -5) {
          player.setVelocityY(-5);
        }
        if (player.getVelocityY() >= 5) {
          player.setVelocityY(5);
        }
      }
    }
  }
  public void inputPressed() {
    if (mode.equals("cube")) {
      cubeJump();
    } else if (mode.equals("ship")) {
      shipHeld = true;
    }
  }
  public void inputReleased() {
    shipHeld = false;
  }
  public void cubeJump() {
    if (canJump) {
      player.setVelocityY(-10.07442);
      canJump = false;
    }
  }
}
