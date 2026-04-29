class Projectile {
  float x, y, w, h, speed;
  float vx, vy;
  char dir;


  // Constructor
  Projectile(float x, float y, float vx, float vy) {
    this.x=x;
    this.y=y;
    this.vx = vx;
    this.vy = vy;
    this.w = 5;
    this.h = 5;
    speed = 10;
    dir = 'u';
  }

  void display() {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }

  void move() {
    x += vx;
    y += vy;
  }


  boolean intersect(Obstacle o) {
    float distance = dist(x, y, o.x, o.y);
    if (distance < w/2) {
      return true;
    } else {
      return false;
    }
  }
  boolean reachedEdge() {

    return x<0||x>width||y<0||y>height;
  }
}
