class Box {
  // - x en y positie van de box
  float x;
  float y;
  // - grootte van de box
  int size;

  Box(float x, float y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void display() {
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
    rect(this.x, this.y, this.size, this.size);
  }
  
  // TODO: event methodes
}
