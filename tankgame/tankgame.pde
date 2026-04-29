// 1 April 2026 | TankGame by Emmie Frodsham
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
Obstacle o1;
PImage bg1;
int score;
Timer objTimer, puTimer;
void setup() {
  size(500, 500);
  score = 0;
  bg1=loadImage("treebackground.png");
  t1 = new Tank();
  //o1 = new Obstacle(400, 100, 100, 50, 5, 100);
  objTimer = new Timer(1000);
  objTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
  //obstacles.add(new Obstacle(300,200,100,100,100,int(random(1,10))));
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

  // distribute object on timer
  if (puTimer.isFinished()) {
    // add a powerUp
    powerups.add(new PowerUp());
    //restart Timer
    puTimer.start();
  }
  for (int i = 0; i <powerups.size(); i++) {
    PowerUp pu  = powerups.get(i);
    pu.display();
    pu.move();
    if (pu.offscreen()) {
      powerups.remove(pu);
    }
    if (pu.intersect(t1)) {
      //Turret
      if (pu.type == 't') {
        t1.turretCount++;
      } else if (pu.type =='a') {
        t1.laserCount = t1.laserCount + 100;
      } else if (pu.type =='h') {
        t1.laserCount = t1.laserCount + 100;
      }
    }
  }

      //render and dectect collision
      for (int i = 0; i < projectiles.size(); i++) {
        Projectile p = projectiles.get(i);
        for (int j = 0; j < projectiles.size(); j++) {
          Projectile p = projectiles.get(i);
          if (p.intersect(o)) {
            score = score +10;
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

      scorePanel();
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
        if (t1.turretCount == 1 && t1.laserCount > 0) {
          projectiles.add(new Projectile(t1.x, t1.y, dx * speed, dy * speed));
          t1. laserCount = t1.laserCount - 1;
        } else if (t1.turretCount == 2 && t1. laserCount >2) {
          projectiles.add(new Projectile(t1.x-20, t1.y, dx * speed, dy * speed));
          projectiles.add(new Projectile(t1.x+20, t1.y, dx * speed, dy * speed));
          t1. laserCount = t1. laserCount - 2;
        }
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
      text("Health:" + t1.health, width/2-150, 25);
      text("Ammo:" + t1.laserCount, width/2+150, 25);
    }
