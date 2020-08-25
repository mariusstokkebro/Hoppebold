void environment() {

  background(66, 173, 245);  //the sky

  fill(255, 255, 0);  //the sun
  circle(width*0.98, height*0.02, 200);

  fill(255);  //clouds
  ellipse(width*0.24, height*0.18, 250, 70);
  ellipse(width*0.74, height*0.28, 250, 70);

  fill(30, 200, 0);  //the ground
  circle(width*0.5, height*1.2857, 900);
}
