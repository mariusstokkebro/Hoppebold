
Balls[] b;
int ballCount = 10;

void setup() {
  size(1000, 700);
  frameRate(120);
  b = new Balls[ballCount];
  for (int i = 0; i<b.length; i++) {
    b[i] = new Balls(random(30, 500), random(50, 200), random(2, 3), random(2, 3));  //giver alle bolde tilfældige start-positioner og -hastigheder
  }
}

void draw() {
  environment();
  for (int i = 0; i < b.length; i++) {  //for-loop bruges, så at alle funktioner køres for alle bolde, i stedet for én enkelt bold
    b[i].edgy();
    b[i].collision();
    b[i].move();
  }
  if(mousePressed){
  setup();
  }
  //gravity();
}
