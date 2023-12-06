KameleonBloemetje bloemetje;

void setup() {
  size(600, 600);
  int r = 50;
  bloemetje = new KameleonBloemetje(300, height - 2 * r, r);
}

void draw() {
  bloemetje.update();
  
  background(123, 242, 90); //<>//
  bloemetje.display(); //<>//
}
