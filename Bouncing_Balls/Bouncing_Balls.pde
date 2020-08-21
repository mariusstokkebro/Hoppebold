Balls[] b;
Balls ball = new Balls();
void setup() {
  size(1000, 700);
  frameRate(120);
  //b = new
}

void draw() {
  environment();
  ball.edgy();
  bund();
  //for (int i = 0; i < b.length; i++) {
  ball.move();
  //}
  //gravity();
}
