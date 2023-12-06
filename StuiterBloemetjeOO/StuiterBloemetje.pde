class StuiterBloemetje {
  int x; // de x-positie van het bloemetje
  int y; // de y-positie van het bloemetje
  int r; // de grootte van een bloemblad
  int d; // de richting van bewegen

  StuiterBloemetje(int x, int y, int r) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.d = -1; // het bloempje beweegt eerst naar boven
  }

  void display() {
    // teken het bloemetje
    circle(x - r, y - r, 2 * r);
    circle(x - r, y + r, 2 * r);
    circle(x + r, y - r, 2 * r);
    circle(x + r, y + r, 2 * r);
    circle(x, y, 2 * r);
  }
  
  void update() {
    // Detecteer of de rand van het scherm bereikt is
    if (y > height - 2 * this.r) { // de onderrand is geraakt
      d = -1 * d; // draai de beweegrichting om
    } else if (y < 2*r) { // de bovenrand is geraakt
      d = -1 * d; // draai de beweegrichting om
    }

    y = y + d; // beweeg de bloem een stapje in de richting
  }
}
