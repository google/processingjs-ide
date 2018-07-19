    // JumpingBall

    int width = 512;
    int skyHeight = 256;
    int groundHeight = 10;

    ArrayList<Wall> walls;
    Ball ball;

    void setup() {
      size(width, skyHeight + groundHeight);
      ball = new Ball(40, 20, 20);
      walls = new ArrayList<Wall>();
    }

    void draw() {
      background(255, 255, 255);

      if (frameCount % 50 == 0 && random(100) < 50) {
       walls.add(new Wall(width, int(random(skyHeight / 2))));
      }

      for (int i = 0; i < walls.size(); ++i) {
       walls.get(i).update();
        if (ball.hit(walls.get(i))) {
          alert("ゲームオーバー");
          speak("ゲームオーバー");
          noLoop();
        }
        if (walls.get(i).x < 0) {
          walls.remove(i);
          i--;
          continue;
        }
        walls.get(i).draw();
      }

      drawGround();
      ball.update();
      ball.draw();
    }

    void mouseClicked() {
      if (ball.y <= ball.r) {
       ball.v = 20;
      }
    }

    void drawGround() {
      for (int start = -(4 * frameCount % 11); start < width; start += 11) {
        fill(100, 100, 100);
        rect(start, skyHeight, 11, groundHeight);
      }
    }

    class Ball {
      int x, y, r;
      int v;

      Ball(int init_x, int init_y, int init_r) {
        x = init_x;
        y = init_y;
        r = init_r;
        v = 0;
      }

      void update() {
        if (v < 0 && y - r <= 0) {
          v = 0;
          y = r;
        } else {
          y += v;
          v--;
        }
      }

      bool hit(Wall w) {
        if (w.x > x + r || w.x < x - r) return false;
        return y - r < w.y;
      }

      void draw() {
        fill(0, 0, 0);
        ellipse(x, skyHeight - 1 - y, r*2, r*2);
      }
    }

    class Wall {
      int x, y;

      Wall(int init_x, int init_y) {
        x = init_x;
        y = init_y;
      }

      void update() {
        x -= 4;
      }

      void draw() {
        fill(0, 255, 0);
        rect(x, skyHeight - 1 - y, 5, y);
      }
    }
