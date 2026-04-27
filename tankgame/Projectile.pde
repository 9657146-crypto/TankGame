class Projectile {
  // Member Variable
  float x, y, w, h, speed;
  float vx, vy;
  char dir;


  // constructor
  Projectile(float x, float y, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vx = vy;
    this.w = 10;
    this.h = 10;
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
    float distance = dist(x,y,o.x,o.y);
    if(distance < 100) {
      return true;
    } else {
      return false;
    }
  }
  boolean reachedEdge() {
  return x<0 || x>width||y<0||y>height;
  }
}
