// 1 April 2026 | TankGame by Emmie Frodsham
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
Obstacle o1;
PImage bg1;
int score;
Timer objTimer;
void setup() {
  size(500, 500);
  score = 0;
  bg1=loadImage("treebackground.png");
  t1 = new Tank();
  //o1 = new Obstacle(400, 100, 100, 50, 5, 100);
  objTimer = new Timer(1000);
  objTimer.start();
  // obstacles.add(new Obstacle(300,200,100,100,100,int(random(1,10))));
}


void draw() {
  background(127);
  imageMode(CORNER);
  image(bg1, 0, 0);

  // distribute object on timer
  if (objTimer.isFinished()) {
    // add object
    obstacles.add(new Obstacle(10, 200, 100, 100, int(random(1, 10)), 10));
    //restart Timer
    objTimer.start();
  }
  //render and dectect collision
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    for (int j = 0; j < obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);
      o.display();
      o.move();
      if (p.intersect(o)) {
        score = score +100;
        projectiles.remove(i);
        obstacles.remove(j);
        continue;
      }
    }
 
    p.display();
    p.move();
    if (p.reachedEdge()) {
      projectiles.remove(i);
    }
    //detect colllision to tank
    //impact to change score,health,and obstacle
  }
  t1.display();
}

  //t1.display();

 // scorePanel();
 



void keyPressed() {
  if (key == 'w') {
    t1.move('w');
  } else if (key == 's') {
    t1.move('s');
  } else if (key == 'a') {
    t1.move('a');
  } else if (key == 'd') {
    t1.move('d');
  }
}

void mousePressed() {
  println(projectiles.size());
  float dx = mouseX - t1.x;
  float dy = mouseY - t1.x;
  float mag = sqrt(dx*dx + dy*dy);

  if (mag > 0) {
    dx /= mag;
    dy /= mag;

    float speed = 5;
    projectiles.add(new Projectile(t1.x, t1.y, dx * speed, dy * speed));
  }
}

void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 15, width, 30);
  fill(255);
  textSize(20);
  text("Score:" + score, width/2, 25);
}
