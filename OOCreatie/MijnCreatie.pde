class MijnCreatie {
  float x;
  float y;
  boolean ogenDicht;
  
  
  MijnCreatie(float x, float y) {
    this.x = x;
    this.y = y;
    this.ogenDicht = false;
  }
  
  void ogenOpen() {
    this.ogenDicht = false;
  }
  
  void openDicht() {
    this.ogenDicht = true;
  }
  
  void display() {
    noStroke();
    fill(#F0D90A);
    circle(this.x, this.y, 200);
    
    stroke(0, 0, 0);
    strokeWeight(5);
    noFill();
    arc(this.x, this.y, 120, 120, 0.2 * PI, 0.8 * PI);
    
    if (ogenDicht) {
      line(this.x - 50, this.y - 20, this.x - 20, this.y - 20);
      line(this.x + 20, this.y - 20, this.x + 50, this.y - 20);
    } else {
      strokeWeight(2);
      fill(255, 255, 255);
      ellipse(this.x - 35, this.y - 20, 30, 40);
      ellipse(this.x + 35, this.y - 20, 30, 40);
      fill(0, 0, 0);
      circle(this.x - 35, this.y - 20, 7);
      circle(this.x + 35, this.y - 20, 7);
    }
  }
}
