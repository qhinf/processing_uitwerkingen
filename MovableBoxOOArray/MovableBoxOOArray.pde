// Sketch met een box die je met de muis over het scherm kan slepen
// Objectgeörienteerde versie
// Gebaseerd op https://processing.org/examples/mousefunctions.html

int boxCount;
Box[] boxes;

void setup() {
  size(640, 360);
  
  this.boxCount = 10;
  this.boxes = new Box[this.boxCount];
  
  int boxSize = width / (4 * this.boxCount);  
  for (int i = 0; i < this.boxCount; i++) {
    this.boxes[i] = new Box((i + 1) * (width / (this.boxCount + 1)), height / 2, boxSize);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < this.boxCount; i++) {
    this.boxes[i].display();
  }
}

void mouseMoved() {
  for (int i = 0; i < this.boxCount; i++) {
    if (this.boxes[i].isOver(mouseX, mouseY)) {
      this.boxes[i].mouseEntered();
    } else {
      this.boxes[i].mouseLeft();
    }
  }
}

void mousePressed() {
  for (int i = 0; i < this.boxCount; i++) {
    if (this.boxes[i].isOver(mouseX, mouseY)) {
      this.boxes[i].locked(mouseX, mouseY);
    }
  }
}

void mouseDragged() {
  for (int i = 0; i < this.boxCount; i++) {
    if (this.boxes[i].locked) {
      this.boxes[i].dragged(mouseX, mouseY);
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < this.boxCount; i++) {
    this.boxes[i].released();
  }
}
