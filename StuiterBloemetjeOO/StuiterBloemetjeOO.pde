StuiterBloemetje bloemetje;

void setup() {
  size(600, 600);
  bloemetje = new StuiterBloemetje(300, height - 2 * 50, 50);
}

void draw() {
  bloemetje.update();
  
  background(123, 242, 90);
  bloemetje.display();
}
