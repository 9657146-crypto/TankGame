class Obstacle {
  // Member Variable
  float x, y, w, h, speed, health;
  PImage obs1;
  char idir;

  // constructor
  Obstacle(float x, float y, float w, float h, float speed, float health) {
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.health = health;
    if (int(random(4))==2) {
      idir = 'w';
      x = random(width);
      y = height + 100;
    } else if (int(random(3))==1) {
      idir = 'd';
      x = -100;
      y = random(height);
    } else if (int(random(2))==1) {
      idir = 'a';
      x = width+100;
      y = random(height);
    } else {
      idir = 's';
      x = random(width);
      y = height + 100;
    }
    obs1 = loadImage("berry.png");
  }

  void display() {
    fill(128);
    imageMode(CENTER);
    image(obs1, x, y);
  }

  void move() {
    switch(idir) {
      case 'w':
      y=y-speed;
      break;
      case 'a':
      x=x-speed;
    }
  }


  boolean intersect() {
    if (x < 0-w/2 || x > width+w/2 || y < 0-w/2 || y> height+w/2) {
      return true;
    } else {
      return false;
    }
  }
}
