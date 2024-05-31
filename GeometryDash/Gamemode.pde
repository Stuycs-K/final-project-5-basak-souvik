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
  
  public void move() {
    if (player.isAlive() && !paused) {
      player.addX(5.193);
      player.setVelocityY(player.getVelocityY()+gravity);
      if (mode.equals("cube")) {
        
      } else if (mode.equals("ship")) {
        
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
