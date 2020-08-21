class Balls {
PVector velocity = new PVector(2, 2);    
PVector pos = new PVector(60, 60);
int radius = 50;
  Balls(float x, float y ,float xspeed, float yspeed){
  velocity.set(xspeed,yspeed);
  pos.set(x,y);
  }
  void move() {
    pos.add(velocity);
    fill(255);
    circle(pos.x, pos.y, radius);  //placing circle on vector's coords
  }
  void edgy() {
  if (pos.x <= 0 + radius/2 || pos.x >= width - radius/2) {
    velocity.x *= -1;
  }
  if (pos.y <= 0 + radius/2 || pos.y >= height - radius/2) {
    velocity.y *= -1;
    //pos.y = height - radius/2 - 1;
  }
}
}
