int x;
int y;
int r;

void setup() {
  size(600, 600);
  this.r = 50;
  this.x = 300;
  this.y = height - 2 * this.r;
}

void draw() {
  background(123, 242, 90);
  
  circle(x - r, y - r, 2 * r);
  circle(x - r, y + r, 2 * r);
  circle(x + r, y - r, 2 * r);
  circle(x + r, y + r, 2 * r);
  circle(x, y, 2 * r);
  
  if (y > 2 * this.r) {
    y = y - 1;
  }
}
