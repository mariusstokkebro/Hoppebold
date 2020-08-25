class Balls {
  PVector pos = new PVector(60, 60);
  PVector velocity = new PVector(2, 2);
  int diameter = 30;
  float minDist;
  float groundMinDist;
  float speedLoss = 0.05;  //bruges senere til at regulere farten af bolde efter sammenstød

  Balls(float x, float y, float xSpeed, float ySpeed) {  //constructor, der bruger input-værdier til at definere en positions- og hastighedsvektor
    pos.set(x, y);
    velocity.set(xSpeed, ySpeed);
  }

  void move() {
    pos.add(velocity);
    fill(255);
    circle(pos.x, pos.y, diameter);  //placing circle on vector's coords
  }

  void edgy() {
    if (pos.x <= 0 + diameter/2 || pos.x >= width - diameter/2) {
      velocity.x *= -1;
    }
    if (pos.y <= 0 + diameter/2 || pos.y >= height - diameter/2) {
      velocity.y *= -1;
    }
    if (this.pos.x != width*0.5 || this.pos.y != height*1.2857) {
      if (sqrt(sq(this.pos.x - width*0.5) + sq(this.pos.y - height*1.2857)) < this.diameter/2 + 900/2) {
        float dx = width*0.5 - this.pos.x;
        float dy = height*1.2857 - this.pos.y;

        float distance = dist(this.pos.x, this.pos.y, width*0.5, height*1.2857);  //nuværende distance mellem to bolde

        groundMinDist = 900+this.diameter+5;

        if (distance <= groundMinDist) {  //basically, "hvis boldene kommer inden for hinandens radius
          float angle = atan2(dy, dx);  //find vinkel mellem bolde

          float targetX = this.pos.x + cos(angle) * groundMinDist;  //koordinater splittes fra nu af op i x- og y-komposanter, fordi x bruger cos() og y bruger sin()
          float targetY = this.pos.y + sin(angle) * groundMinDist;  //

          float newX = (targetX - width*0.5) * 0.001;  //beregner hvor meget fart en bold vil miste/modtage 
          float newY = (targetY - height*1.2857) * 0.001;  //

          velocity.x -= newX;      //
          velocity.y -= newY;      //finder ny hastighed for begge bolde, der støder sammen
          //b[i].velocity.x += newX; //
          //b[i].velocity.y += newY; //
        }
      }
    }
    }

    void collision() {
      for (int i = 0; i < b.length; i++) {      
        if (this.pos.x != b[i].pos.x || this.pos.y != b[i].pos.y) {  //Sidenote - "this.___" refererer til en bestemt bold der observeres og "b[i].___" refererer til alle andre bolde, end den der observeres
          if (sqrt(sq(this.pos.x - b[i].pos.x) + sq(this.pos.y - b[i].pos.y)) < this.diameter/2 + b[i].diameter/2) {  //denne og forrige linje tjekker bare om to bolde rammer hinanden
            float dx = b[i].pos.x - this.pos.x;
            float dy = b[i].pos.y - this.pos.y;

            float distance = dist(this.pos.x, this.pos.y, b[i].pos.x, b[i].pos.y);  //nuværende distance mellem to bolde

            minDist = this.diameter + 2;

            if (distance <= minDist) {  //basically, "hvis boldene kommer inden for hinandens radius
              float angle = atan2(dy, dx);  //find vinkel mellem bolde

              float targetX = this.pos.x + cos(angle) * minDist;  //koordinater splittes fra nu af op i x- og y-komposanter, fordi x bruger cos() og y bruger sin()
              float targetY = this.pos.y + sin(angle) * minDist;  //

              float newX = (targetX - b[i].pos.x) * speedLoss;  //beregner hvor meget fart en bold vil miste/modtage 
              float newY = (targetY - b[i].pos.y) * speedLoss;  //

              velocity.x -= newX;      //
              velocity.y -= newY;      //finder ny hastighed for begge bolde, der støder sammen
              b[i].velocity.x += newX; //
              b[i].velocity.y += newY; //
            }
          }
        }
      }
    }
  }
