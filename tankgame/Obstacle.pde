class Obstacle {
  float x, y, w, h, speed, health;
  PImage obs1;
  char idir;

  // Constructor
  Obstacle(float x, float y, float w, float h, float speed, float health) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.speed=speed;
    this.health=health;
    if (int(random(4))==2) {
      idir = 'w';
      x = random(width);
      y = height + 100;
    } else if (int(random(3))==1) {
      idir = 'd';
      x = -100 ;
      y = random(height);
    } else if (int(random(2))==1) {
      idir = 'a';
      x = width+100;
      y = random(height);
    } else {
      idir = 's';
      x = random(width);
      y =  - 100;
    }
    obs1 = loadImage("Obs1.png");
  }
  void display() {
    fill(128);
    imageMode(CENTER);
    image(obs1, x, y);
  }

  void move() {
    if (idir== 'd') {
      x=x+speed;
    } else if (idir== 'a') {
      x=x-speed;
    } else if (idir== 'w') {
      y=y+speed;
    } else if (idir== 's') {
      y=y-speed;
    }
  }


  boolean offScreen() {
    if (x < 0-w/2 || x > width+w/2 || y < 0-w/2 || y> height+w/2) {
      return true;
    } else {
      return false;
    }
  }
}
