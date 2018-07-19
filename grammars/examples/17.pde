    int i = 0;
    void draw() {
      background(200);
      text(str(int(millis()/1000)), 10, 30);
      i++;
    }

    void setup() {
      frameRate(1);
      fill(0);  // 黒。
      textSize(30);
    }
