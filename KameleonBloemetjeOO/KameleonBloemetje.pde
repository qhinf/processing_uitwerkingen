class KameleonBloemetje {
  int x; // de x-positie van het bloemetje
  int y; // de y-positie van het bloemetje
  int r; // de grootte van een bloemblad
  int d; // de richting van bewegen

  color startBladKleur;
  color eindBladKleur;
  color bladKleur;
  color kernKleur;

  KameleonBloemetje(int x, int y, int r) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.d = -1;
    
    this.startBladKleur = #FFFFFF;
    this.eindBladKleur = #75C6F7;
    this.bladKleur = this.startBladKleur;
    this.kernKleur = #F2E711;
  }

  void display() {
    noStroke();
    fill(bladKleur);
    circle(x - r, y - r, 2 * r);
    circle(x - r, y + r, 2 * r);
    circle(x + r, y - r, 2 * r);
    circle(x + r, y + r, 2 * r);
    fill(kernKleur);
    circle(x, y, 2 * r);
  }

  void beweeg() {
    // Detecteer of de rand van het scherm bereikt is
    if (y > height - 2 * this.r) { // de onderrand is geraakt
      d = -1 * d; // draai de beweegrichting om
    } else if (y < 2*r) { // de bovenrand is geraakt
      d = -1 * d; // draai de beweegrichting om
    }

    y = y + d; // beweeg de bloem een stapje in de richting
  }

  void veranderKleur() {
    bladKleur = lerpColor(startBladKleur, eindBladKleur, (float)(height - y) / height);
  }

  void update() {
    beweeg();
    veranderKleur();
  }
}
