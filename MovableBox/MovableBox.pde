// Sketch met een box die je met de muis over het scherm kan slepen
// Gebaseerd op https://processing.org/examples/mousefunctions.html

// Variabelen die we nodig hebben in dit programma:
// - x en y positie van de box
float boxX, boxY;
// - grootte van de box
int boxSize;
// - booleans die aangeven of
//   - de muis op dit moment over de box hangt
//   - de muis op dit moment de box vasthoudt (door te klikken)
boolean mouseOverBox, mouseLockedOnBox;
// - als de muis de box vasthoudt, op welke afstand van het midden
//   van de box de muis zit (dat moeten we weten om de box weer op 
//   de juiste plek te zetten bij het slepen)
float lockedOffsetX, lockedOffsetY;

void setup() {
  size(640, 360);
  
  // Zet de box in het midden bij de start van het programma
  boxX = width / 2;
  boxY = height / 2;
  boxSize = 75;
  
  // Initialiseer de variabelen voor het slepen
  mouseOverBox = false;
  mouseLockedOnBox = false;
  lockedOffsetX = 0.0;
  lockedOffsetY = 0.0;
  
  rectMode(RADIUS);
}

// De draw is heel simpel: we hoeven alleen de box te tekenen
// aan de hand van de variabelen die we hebben
void draw() {
  background(0);
  
  // Als de muis de box vasthoudt, maken we de box wit
  if (mouseLockedOnBox) {
    fill(#ffffff);
  // Als de muis over de box zweeft, geven we de box een witte rand
  // en tekenen we de box verder in het grijs
  } else if (mouseOverBox) {
    stroke(#ffffff);
    strokeWeight(2);
    fill(#dedede);
  // Anders tekenen we de box zonder rand en in het grijs
  } else {
    strokeWeight(0);
    fill(#dedede);
  }
  
  // Teken de box op de juiste positie
  rect(boxX, boxY, boxSize, boxSize);
}

// Hier gebeurt het echt: met deze event handlers zorgen we ervoor
// dat je de box over het scherm kunt slepen

// Deze handler wordt uitgevoerd als de muis verplaatst wordt, en 
// die kunnen we dus gebruiken om te zien of de muis nu over de box
// hangt
void mouseMoved() {
  // Als de x positie van de muis groter is dan de linkerkant van de box
  // en kleiner dan de rechterkant van de box
  if (mouseX > boxX - boxSize && mouseX < boxX + boxSize
      // en de y positie van de muis groter is dan de bovenkant van de box
      // en kleiner is dan de onderkant van de box
      && mouseY > boxY - boxSize && mouseY < boxY + boxSize) {
    // Dan is de muis op dit moment boven de box!
    mouseOverBox = true;
  } else {
    // En anders niet
    mouseOverBox = false;
  }
}

// Deze handler wordt uitgevoerd als je de linkermuisknopt indrukt, die
// gebruiken we om de box vast te pakken
void mousePressed() {
  // Als we boven de box zijn,
  if (mouseOverBox) {
    // dan kunnen we de box vastpakken
    mouseLockedOnBox = true;
    // We onthouden ook waar we de box vasthouden: als de offset 0 is,
    // dan hebben we de box precies in het midden, maar we kunnen de box
    // ook op een andere plek vastpakken. De offset is dan de afstand
    // vanaf de muis tot aan het midden.
    lockedOffsetX = mouseX - boxX;
    lockedOffsetY = mouseY - boxY;
  }
}

// Deze handler wordt uitgevoerd als we met de muis slepen, dus bewegen
// terwijl de muisknop is ingedrukt. Met deze handler bewegen we de box.
void mouseDragged() {
  // We bewegen de box alleen als we de box vasthouden bij het slepen
  // (en we dus de muisknop ingedrukt hebben terwijl we boven de box waren).
  if (mouseLockedOnBox) {
    // Dan is de nieuwe positie van de box de huidige positie van de muis,
    // gecorigeerd voor het feit dat we de box niet in het midden hoeven te
    // pakken door de offset.
    boxX = mouseX - lockedOffsetX;
    boxY = mouseY - lockedOffsetY;
  }
}

// En als laatste: als we de muis loslaten,
void mouseReleased() {
  // dan hebben we de box dus niet meer vast...
  mouseLockedOnBox = false;
}
