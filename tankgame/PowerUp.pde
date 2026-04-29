class PowerUp {
  float x, y, w, h, speed;
  //PImage obs1;
  char type;

  // Constructor
  PowerUp() {
    w = 100;
    h = 100;
    speed=3;

    if (int(random(4))==2) {
      type = 'h';
      x = random(width);
      y = - 100;
    } else if (int(random(3))==1) {
      type = 't';
      x = -100 ;
      y = random(width);
    } else {
      type = 'a';
      x =random (width);
      y = - 100;
    }
  }
  // obs1 = loadImage("Obs1.png");

  void display() {
    if (type == 'h') {
      fill(0, 200, 0);
      ellipse(x, y, w, h);
      fill(255);
      textAlign(CENTER, CENTER);
      text("health", x, y);
    } else  if (type == 'a') {
      fill(0, 0, 200);
      ellipse(x, y, w, h);
      fill(255);
      textAlign(CENTER, CENTER);
      text("ammo", x, y);
    } else  if (type == 't') {
      fill(0, 200, 0);
      ellipse(x, y, w, h);
      fill(255);
      textAlign(CENTER, CENTER);
      text("turret", x, y);


      // imageMode(CENTER);
      // image(obs1, x, y);
    }
  }

  void move() {
    y = y + speed;
  }


  boolean offscreen() {
    if (x < 0-w/2 || x > width+w/2 || y < 0-w/2 || y> height+w/2) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Tank t) {
    float distance = dist(x, y, t.x, t.y);
    if (distance < w/2) {
      return true;
    } else {
      return false;
    }
  }
}
