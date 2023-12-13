MijnCreatie mijnCreatie;

void setup() {
  size(400, 400);
  mijnCreatie = new MijnCreatie(200, 200);
}

void draw() {
  background(255, 255, 255);
  mijnCreatie.display();
}

void mousePressed() {
  mijnCreatie.ogenDicht();
}

void mouseReleased() {
  mijnCreatie.ogenOpen();
}
