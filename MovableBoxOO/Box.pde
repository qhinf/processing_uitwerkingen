class Box {
  float x, y;
  int size;
  boolean highlighted, locked;
  float lockedOffsetX, lockedOffsetY;

  Box(float x, float y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;

    this.highlighted = false;
    this.locked = false;
    this.lockedOffsetX = 0.0;
    this.lockedOffsetY = 0.0;
  }

  void display() {
    rectMode(RADIUS);

    if (this.locked) {
      fill(#ffffff);
    } else if (this.highlighted) {
      stroke(#ffffff);
      strokeWeight(2);
      fill(#dedede);
    } else {
      strokeWeight(0);
      fill(#dedede);
    }

    rect(this.x, this.y, this.size, this.size);
  }

  boolean isOver(float x, float y) {
    return
      x > this.x - this.size && x < this.x + this.size
      && y > this.y - this.size && y < this.y + this.size;
  }

  void mouseEntered() {
    this.highlighted = true;
  }

  void mouseLeft() {
    this.highlighted = false;
  }

  void locked(float mousePositionX, float mousePositionY) {
    this.locked = true;
    this.lockedOffsetX = mousePositionX - this.x;
    this.lockedOffsetY = mousePositionY - this.y;
  }

  void dragged(float newMouseX, float newMouseY) {
    this.x = newMouseX - lockedOffsetX;
    this.y = newMouseY - lockedOffsetY;
  }

  void released() {
    this.locked = false;
  }
}
