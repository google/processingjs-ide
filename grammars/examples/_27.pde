    // TouchTheNumber

    int N = 3;
    int numbers[][];

    // Draw the rectangles.
    void rectangles() {
      fill(200);
      for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
          rect(50+120*i, 50+120*j, 100, 100);
        }
      }
    }

    void printNumbers() {
      fill(0);
      textSize(50);
      for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
          text(str(numbers[i][j]), 85+120*i, 118+120*j);
        }
      }
    }

    void shuffle() {
      for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
          int x = int(random(N));
          int y = int(random(N));
          if (x != i || y != j) {
            int tmp = numbers[i][j];
            numbers[i][j] = numbers[x][y];
            numbers[x][y] = tmp;
          }
        }
      }
    }

    void setup() {
      size(440, 440);
      background(240);
      textSize(50);
      numbers = new int[N][];
      for (int i = 0; i < N; i++) {
        numbers[i] = new int[N];
        for (int j = 0; j < N; j++) {
          numbers[i][j] = i*3 + j + 1;
        }
      }
      shuffle();
      rectangles();
      printNumbers();
    }

    int current = 1;
    int started = false;
    int started_ms = 0;

    void draw() {
      noLoop();
    }

    void mouseOver() {
      if (!started) {
        started = true;
        background(240);
        rectangles();
        started_ms = millis();
      }
    }

    void mouseClicked() {
      if (current == 10) {
        background(240);
        rectangles();
        shuffle();
        printNumbers();
        current = 1;
        started = false;
        return;
      }
      int x = int((mouseX-60)/120);
      int y = int((mouseY-60)/120);
      if (x < 0) x = 0;
      if (x >= N) x = N-1;
      if (y < 0) y = 0;
      if (y >= N) y = N-1;
      //fill(240); stroke(240);
      //rect(20, 20, 50, 20);
      //textSize(20); fill(0); stroke(0);
      //text(str(mouseX) + " " + str(mouseY)+" : " + str(x) + " " + str(y), 20, 20);
      if (numbers[x][y] == current) {
        textSize(50);
        fill(0); 
        text(str(numbers[x][y]), 85+120*x, 118+120*y);
        current++;
        if (current == 10) {
          background(240);
          int t = millis() - started_ms;
          fill(0); textSize(50);
          text(str(int(t/1000)) + "." + str((int(t/100))%10) + str((int(t/10))%10) + "s", 100, 100);
        }
      }
    }
