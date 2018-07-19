    void setup() {
      background(255);  // キャンバスを白で塗ります
      fill(0);
      textSize(20);
      text("2秒を待って", 10, 50);
    }

    void draw() {
      if (millis() > 2000) {  // 2000ミリ秒=2秒
        background(255);
        fill(255, 0, 0); // 赤
        ellipse(50, 50, 55, 55);
        noLoop(); // アニメーションを止めます。
      }
    }
