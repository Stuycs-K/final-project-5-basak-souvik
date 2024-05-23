public class Hitbox {
  private double x1,y1,x2,y2;
  
  public Hitbox(double x1, double y1, double x2, double y2) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  }
  
  public boolean collidesWith(Hitbox other) {
    if (other.x2() < x1 || x2 < other.x1() ||
       (other.y2() < y1 || y2 < other.y1())) return false;
    return true;
  }
  
  public double x1() {return x1;}
  public double y1() {return y1;}
  public double x2() {return x2;}
  public double y2() {return y2;}
}
