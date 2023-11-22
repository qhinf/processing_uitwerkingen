int x = 200;
int y = 200;
boolean clicked = false;

void setup() {
  size(400, 400);
}

void draw() {
  noStroke();
  
  background(255, 255, 255);
  fill(0, 0, 0);
  square(20, 20, 360);
  fill(255, 255, 255);
  circle(200, 200, 340);
  if (clicked) {
    fill(255, 0, 0);
    circle(200, 200, 320);
  }
  
  x = mouseX;
  y = mouseY;
  fill(222, 203, 143);
  triangle(x, y, x - 40, y - 40, x + 40, y - 40);
  fill(255, 0, 0);
  triangle(x, y, x - 20, y - 20, x + 20, y - 20);
  rect(x - 40, y - 140, 80, 100);
}

void mouseClicked() {
  clicked = true;
}
