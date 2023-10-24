// Sketch met een box die je met de muis over het scherm kan slepen
// Objectgeörienteerde versie
// Gebaseerd op https://processing.org/examples/mousefunctions.html

Box box1;
Box box2;

void setup() {
  size(640, 360);
  box1 = new Box(width / 3, height / 2, 75);
  box2 = new Box(width / 3 * 2, height / 2, 75);
}

void draw() {
  background(0);
  box1.display();
  box2.display();
}

void mouseMoved() {
  if (box1.isOver(mouseX, mouseY)) {
    box1.mouseEntered();
  } else {
    box1.mouseLeft();
  }
  if (box2.isOver(mouseX, mouseY)) {
    box2.mouseEntered();
  } else {
    box2.mouseLeft();
  }
}

void mousePressed() {
  if (box1.isOver(mouseX, mouseY)) {
    box1.locked(mouseX, mouseY);
  } else if (box2.isOver(mouseX, mouseY)) {
    box2.locked(mouseX, mouseY);
  }
}

void mouseDragged() {
  if (box1.locked) {
    box1.dragged(mouseX, mouseY);
  } else if (box2.locked) {
    box2.dragged(mouseX, mouseY);
  }
}

void mouseReleased() {
  box1.released();
  box2.released();
}
