int x; // de x-positie van het bloemetje
int y; // de y-positie van het bloemetje
int r; // de grootte van een bloemblad
int d; // de richting van bewegen

color startBladKleur;
color eindBladKleur;
color bladKleur;
color kernKleur;

void setup() {
  size(600, 600);
  this.r = 50;
  this.x = 300;
  this.y = height - 2 * this.r;
  this.d = -1; // het bloempje beweegt eerst naar boven
  
  this.startBladKleur = #FFFFFF;
  this.eindBladKleur = #75C6F7;
  this.bladKleur = this.startBladKleur;
  this.kernKleur = #F2E711;
}

void draw() {
  background(123, 242, 90);
  
  // teken het bloemetje
  noStroke();
  fill(bladKleur); //<>//
  circle(x - r, y - r, 2 * r);
  circle(x - r, y + r, 2 * r);
  circle(x + r, y - r, 2 * r);
  circle(x + r, y + r, 2 * r);
  fill(kernKleur);
  circle(x, y, 2 * r);
  
  // Detecteer of de rand van het scherm bereikt is
  if (y > height - 2 * this.r) { // de onderrand is geraakt
    d = -1 * d; // draai de beweegrichting om
  } else if (y < 2*r) { // de bovenrand is geraakt
    d = -1 * d; // draai de beweegrichting om
  }
  
  y = y + d; // beweeg de bloem een stapje in de richting
  
  bladKleur = lerpColor(startBladKleur, eindBladKleur, (float)(height - y) / height); //<>//
}
