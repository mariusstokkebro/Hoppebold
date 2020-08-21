PVector pos = new PVector(60, 60);
PVector velocity = new PVector(2, 2);
PVector gravity = new PVector(0, 0.2);
PVector wind = new PVector(0.1, 0);
int radius = 50;

void edgy() {
  if (pos.x <= 0 + radius/2 || pos.x >= width - radius/2) {
    velocity.x *= -1;
  }
  if (pos.y <= 0 + radius/2 || pos.y >= height - radius/2) {
    velocity.y *= -1;
    //pos.y = height - radius/2 - 1;
  }
}

void gravity() {
  pos.add(gravity);
}
