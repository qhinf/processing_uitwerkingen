class Box {
  // De box heeft een aantal eigenschappen:
  // - x en y positie van de box
  float x;
  float y;
  // - grootte van de box
  int size;

  // - of de box op dit moment de focus heeft
  boolean inFocus;

  // - of de box op dit moment vastgepakt is
  boolean locked;
  // - en op welke x en y positie hij vastgepakt is
  float lockedOffsetX;
  float lockedOffsetY;

  Box(float x, float y, int size) {
    // Positie en grootte krijgen we via de constructor
    this.x = x;
    this.y = y;
    this.size = size;

    // Focus en lock status zijn standaard false
    this.inFocus = false;
    this.locked = false;
  }

  void display() {
    // Teken rechthoeken met (x, y) als middelpunt
    rectMode(RADIUS);

    // Als de wordt vast gehouden, maken we de box wit
    if (this.locked) {
      fill(#ffffff);
    // Als de box in focus is, geven we hem een witte rand
    // en tekenen we de box verder in het grijs
    } else if (this.inFocus) {
      stroke(#ffffff);
      strokeWeight(2);
      fill(#dedede);
    // Anders tekenen we de box zonder rand en in het grijs
    } else {
      strokeWeight(0);
      fill(#dedede);
    }

    // Teken de box op de juiste positie
    rect(this.x, this.y, this.size, this.size);
  }

  // Controleer of posX en posY binnen de randen van de box vallen
  boolean isOver(float posX, float posY) {
    return (
      // Als de x positie groter is dan de linkerkant van de box
      // en kleiner dan de rechterkant van de box
      posX > this.x - this.size && posX < this.x + this.size
      // en de y positie groter is dan de bovenkant van de box
      // en kleiner is dan de onderkant van de box
      && posY > this.y - this.size && posY < this.y + this.size
      // dan valt deze positie binnen de box.
      );
  }

  // Deze methode wordt aangeroepen wanneer de box in focus komt
  void enterFocus() {
    this.inFocus = true;
  }

  // en deze als de box weer uit focus raakt.
  void leaveFocus() {
    this.inFocus = false;
  }

  // Pak de box vast. posX en posY zijn de x en y positie
  // op het scherm waar de box vastgepakt wordt.
  void locked(float posX, float posY) {
    this.locked = true;
    this.lockedOffsetX = posX - this.x;
    this.lockedOffsetY = posY - this.y;
  }

  // Laat de box weer los.
  void unlocked() {
    this.locked = false;
  }

  // Versleep deze box naar een nieuwe x en y positie.
  void dragged(float newX, float newY) {
    // De nieuwe positie van de box is deze nieuwe positie,
    // gecorigeerd voor het feit dat we de box niet in het midden hoeven te
    // pakken door de offset.
    box.x = newX - lockedOffsetX;
    box.y = newY - lockedOffsetY;
  }
}
