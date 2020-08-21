Balls[] b;

void setup() {
  size(1000, 700);
  frameRate(120);
  b = new Balls[5];
  for (int i = 0; i<5; i++) {
    b[i] = new Balls(random(10,500),random(50,200),random(2,5),random(2,5));
  }
  
}

void draw() {
  environment();
  for (int i = 0; i < b.length; i++) {
    b[i].edgy();
    bund();
    b[i].move();
  }
  //gravity();
}
