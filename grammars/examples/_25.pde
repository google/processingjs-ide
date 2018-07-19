    // JumpingBallTemplate

    int width = 512;
    int skyHeight = 256;
    int groundHeight = 10;

    // ボール
    // 壁

    void setup() {
      // サイズの設定
      // ボールを作る
      // 壁のコンテイナーを作る
    }

    void draw() {
      // 背景を設定

      // 壁を作る

      // 壁を更新
      // 壁を描く

      // ぶつかるのを判定

      // 地面を描く

      // ボールを更新
      // ボールを描く
    }

    void mouseClicked() {
      // ボールに速度を与える
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
