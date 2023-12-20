// Sketch met een box die je met de muis over het scherm kan slepen
// Gebaseerd op https://processing.org/examples/mousefunctions.html

// We hebben in deze sketch één box.
Box box;

void setup() {
  size(640, 360);
  
  // Maak een nieuwe box en zet die in het midden bij de start 
  // van het programma.
  box = new Box(width / 2, height / 2, 75);
}

// De draw is heel simpel: we hoeven alleen de box te tekenen.
void draw() {
  background(0);
  box.display();
}

// Hier gebeurt het echt: met deze event handlers zorgen we ervoor
// dat je de box over het scherm kunt slepen.

// Deze handler wordt uitgevoerd als de muis verplaatst wordt, en 
// die kunnen we dus gebruiken om te zien of de muis nu over de box
// hangt.
void mouseMoved() {
  if (box.isOver(mouseX, mouseY)) {
    // Als de muis over deze box hangt, dan zeggen we dat de box 
    // "in focus" is.
    box.enterFocus();
  } else {
    // En zodra de muis de box verlaat, dan is de box "uit focus".
    box.leaveFocus();
  }
}

// Deze handler wordt uitgevoerd als je de linkermuisknopt indrukt, die
// gebruiken we om de box vast te pakken.
void mousePressed() {
  // Als we boven de box zijn,
  if (box.isOver(mouseX, mouseY)) {
    // dan pakken we de box vast op deze positie.
    box.locked(mouseX, mouseY);
  }
}

// Deze handler wordt uitgevoerd als we met de muis slepen, dus bewegen
// terwijl de muisknop is ingedrukt. Met deze handler bewegen we de box.
void mouseDragged() {
  // Als deze box op dit moment vastgepakt is,
  if (box.locked) {
    // dan verslepen we de box naar de nieuwe muispositie.
    box.dragged(mouseX, mouseY);
  }
}

// En als laatste: als we de muis loslaten,
void mouseReleased() {
  // dan laten we de box los.
  box.unlocked();
}
