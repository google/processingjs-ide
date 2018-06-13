# プロセシング {#ref-help}

テキスト式のプログラミングにようこそ。
プロセシングでは画像やアニメーションを簡単に作れます。

* ワークショップ
  * [ステップ1][step1]
  * [ステップ2][step2]
  * [ステップ3][step3]
  * [ステップ4][step4]
  * [ステップ5][step5]
* [デモ][Demos]
* [ゲーム][Games]

たとえば、こちらのスケッチを試してみましょう。「読み込み」にクリックしてから、
「実行」を押してください。

    // キャンワスの大きさを設定する。
    size(300, 300);
    // キャンワスをホワイトで塗る
    background(255);
    // 今度描く色は黒に設定する。
    fill(0);
    // 四角を描く。
    rect(90, 90, 120, 120);

# ステップ1 {#ref-step1}

最初は、コンピューターを話させてみましょう。

    // 「こんにちは」と話して。 
    speak("こんにちは");

他のセリフ入れてみましょう。

次は[ステップ2][step2]に進みましょう。

# ステップ2 {#ref-step2}

[ステップ1][step1]に戻る。

変数はコンピューターの記憶と考えてもいいです。変数を使うことによって、
コンピューターは様々な情報を覚えてくれます。

    // 変数を作ります。
    String name = "太郎";
    // 変数を使うことによって、名前を思い出します。
    speak("こんにちは、" + name);

変数は記憶のようなもので、何回でも使えます。

    // 変数を作ります。
    String name = "太郎";
    // 変数を使うことによって、名前を思い出します。
    speak("こんにちは、" + name);
    // まだ覚えています。
    text("こんにちは、" + name, 0, 50);
    // これから名前を忘れます。
    name = "";

次は[ステップ3][step3]に進みましょう。

# ステップ3 {#ref-step3}

同じ命令を何回も繰り返すためにループを使います。

    for (int i = 1; i <= 5; i++) {　// 1から5まで数えます。
      speak(str(i));
    }

条件を調べることは「if」文でできます。

    for (int i = 1; i <= 5; i++) {　// 1から5まで数えます。
      if (i % 2 == 1) {  // 奇数かどうか調べます
        speak(str(i));
      }
    }

次は[ステップ4][step4]に進みましょう。

# ステップ4 {#ref-step4}

[ステップ3][step3]に戻る。

プログラムの実行中でユーザの入力に対応するにはいくつかの方法ありますが、
こちらで**イベント**を紹介します。ユーザーはマウスクリックしたときに
[mouseClicked()]という関数が呼ばれます。

    // マウスがクリックした時に実行されます。
    void mouseClicked() {　
      int dx = mouseX - 100;　// mouseXはクリックのX座標
      int dy = mouseY - 100;  // mouseYはクリックのY座標
      float dist = sqrt(dx*dx + dy*dy);  // (100, 100) から距離を計算します。
      if (dist <= 40) {  // 円形の中か外か判断します。 
        speak("ピンポン");
      } else {
        speak("ぶぶ");
      }
    }

    // 設定。実行の最初に実行されます。
    void setup() {
      size(200, 200);   // キャンワスの大きさを設定します。
      background(200);　// 灰色に塗ります。
      stroke(0);　　　　 // 筆色を黒にします。
      ellipse(100, 100, 80, 80); // 円形を描きます。
    }

次の[ステップ5][step5]に進みましょう。
    
マウスイベントについてもっと詳しくは[マウス][Mouse]に参考ください。

# ステップ5 {#ref-step5}

ここまでに勉強してきたことを合わせて簡単のゲームを作ってみましょう。
キャンワスに形状を３つ書いて、英語で形状の名前を話して、ユーザー
に形を当てましょう。正しければ「ピンポン」、間違っていれば「ぶぶ」と
コンピューターに話させましょう。

    String shapes[] = new String[3];
    shapes[0] = "circle";
    shapes[1] = "square";
    shapes[2] = "triangle";
    int next = -1;

    void mouseClicked() {
      int x = int(mouseX/100);  // どっちの形状に近いか計算します。
      if (x != next) {  // 間違った場合
        speak("ぶぶ");
        speak("もう一回いいます");
        speak(shapes[next], "en");  // 英語でも話せます！
      } else {          // 正しくあたった場合
        speak("ピンポン");
        next = -1;
      }
    }

    // 設定します。この関数は実行の頭で一回だけ実行されます。
    void setup() {
      size(300, 210);  // 大きさの設定
      background(200); // 灰色で塗ります。
      stroke(0);  // 筆の色を黒にします。
      ellipse(60, 125, 50, 50);　// 円形を描きます。
      rect(120, 100, 50, 50);　// 四角を描きます。
      triangle(240, 100, 210, 150, 270, 150); // 三角を描きます。
    }
    
    void draw() {
      if (next == -1) {
        speak("つぎの問題");
        next = int(random(3));　　// 次の問題を定めます。
        speak(shapes[next], "en");
      }
    }

時間の余裕があれば、他の[デモ][Demos]や[ゲーム][Games]を実行してみましょう。

# setup

`setup()`は実行の初めに一回呼ばれています。そこではキャンワスの大きさの設定などをしましょう。

スケッチの実行はこのように説明できます：

    setup();
    while(noLoop()は呼ばれていない) {
      // frameRate()で定められた頻度どdraw()を呼ぶ。
      draw();
    }

## 参考

* [draw()]
* [noLoop()]
* [loop()]

# draw

スケッチの実行を初めてから`draw()`は繰り返しで呼ばれています。
一回の`draw()`の呼びで一回のフレームを描くと過程しています。
呼ばれる頻度は[frameRate()]で設定できます。

    int i = 0;
    void draw() {
      text(str(millis()/1000), 10, 30);
      i++;
    }

    void setup() {
      frameRate(1);
    }

# frameRate

`frameRate(x)`は`draw()`を呼ばれる頻度を設定します。
たとえば、`frameRate(10)`では、`draw()`の実行を終わってから
次の`draw()`を呼ぶまで0.1秒をまっています。`frameRate(1)`では、
1秒をまっています。

# インデックス {#ref-index}

## 実行

* [setup()]
* [draw()]
* [noLoop()]
* [loop()]

## キャンワス

* [background()]
* [size()]

## 形状

* [ellipse()]
* [rect()]
* [triangle()]

## 筆の設定

* [fill()]
* [stroke()]

## テキスト

* [textSize()]
* [text()]

## スピーチ

* [speak()]

# size

`size(x_size, y_size)`はキャンワスの大きさを定めています。スケッチの実行の最初に一回だけ呼ばなければ行けない関数です。

    // キャンワスを300×200に設定します。
    size(300, 200);
    // キャンワスをピンクに塗ります。
    background(250, 200, 200);

# background

キャンワスを一つの色で塗ります。色は2つの方法で指定来ます。
一つの数字を指定すれば、黒→灰色→白の中から明るさを指定します。例えば

    // キャンワスを灰色に塗ります。
    background(150);

または、3つの数字を指定すれば、RGBモデルで任意の色を指定できます。

    // キャンワスを赤で塗ります。
    background(255, 0, 0);

# loop

スケッチの実行ループは止まっているときに、`loop()`を呼べば実行ループを再開します。

## 参考

* [draw()]
* [noLoop()]

# noLoop

スケッチの実行ループを停止します。なお、マウスなどイベントは実行し続けるので、
スケッチを完全には止まりません。

## 参考

* [draw()]
* [loop()]

# Demos

* [Drawing]
* [ChaseTheCircle]

# Drawing

このスケッチでマウスで描くことができます。

    // Drawing
    void setup() {
      size(300, 300);
      stroke(200, 0, 0);
      strokeCap(ROUND);
      strokeWeight(10);
    }

    int penDown = false;

    void mousePressed() {
      if (mouseButton == RIGHT) {
        background(200);
        return;
      }
      penDown = true;
    }

    void mouseReleased() {
      penDown = false;
    }

    int prevX = 0;
    int prevY = 0;

    void draw() {
      if (penDown) {
        if (prevX != 0) {
          line(prevX, prevY, mouseX, mouseY);
        }
      }
      prevX = mouseX;
      prevY = mouseY;
    }

# ChaseTheCircle

    // ChaseTheCircle

    // Coordinates of the first circle.
    float x1 = 250;
    float y1 = 250;
    // Coordinates of the second circle.
    float x2 = 250;
    float y2 = 250;
    // Larger -> faster.
    float easing = 0.1;

    void setup() {
      size(500, 500);
      frameRate(60);
      stroke(0);
    }

    void draw() { 
      // Paint the background.
      background(40, 40, 100);

      // The first circle chases the mouse cursor.
      float dx1 = mouseX - x1;
      x1 += dx1 * easing;
      float dy1 = mouseY - y1;
      y1 += dy1 * easing;

      // Draw the first circle.
      fill(0, 220, 0);
      ellipse(x1, y1, 66, 66);

      // The second circle chases the first circle.
      float dx2 = x1 - x2;
      x2 += dx2 * easing;
      float dy2 = y1 - y2;
      y2 += dy2 * easing;

      // Draw the second circle.
      fill(255, 40, 40);
      ellipse(x2, y2, 66, 66);
    }

# Games

* [JumpingBall]
* [TouchTheNumber]

# JumpingBall

    // JumpingBall

    Ball b;
    width = 512;
    height = 256;
    ArrayList<Wall> walls;
    bool stop;

    void setup() {
      size(width, height);
      b = new Ball(40, 20, 20);  
      walls = new ArrayList<Wall>();
      stop = false;
    }

    void draw() {
      if (stop) return;
      background(255, 255, 255);
      
      if (frameCount % 50 == 0 && random(100) < 50) {
        walls.add(new Wall(width, random(height / 2)));
      }
      
      for (int i = 0; i < walls.size(); ++i) {
        walls.get(i).update();
        if (b.hit(walls.get(i))) {
          stop = true;
        }
        if (walls.get(i).x < 0) {
          walls.remove(i);
            i--;
            continue;
        }
        walls.get(i).draw();
      }
      
      b.update();
      b.draw();
    }

    void mouseClicked() {
      b.v = 20;
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
            ellipse(x, height - 1 - y, r*2, r*2);
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
        rect(x, height - 1 - y, 5, y);
      }
    }

# TouchTheNumber

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

# ellipse

円形またはエリプスを描きます。呼び方は

    ellipse(x, y, width, height)
    // x --- X座標
    // y --- Y座標
    // width --- 横幅
    // height --- 高さ

お手本のスケッチ

    background(200); // 灰色
    fill(255, 0, 0); // 赤
    // 横に細長い赤いエリプスを描きます。
    ellipse(50, 10, 100, 20);
    fill(0, 0, 255); // 青
    // 縦の細長いエリプスを描きます。
    ellipse(10, 50, 20, 100);
    fill(255);  // 白
    ellipse(50, 50, 40, 40);

# speak

声を足してテキストを読み上げます。

    // こんにちはと言います。
    speak("こんにちは");

他の言語に話させたいときは、テキストのあとに`"en"`, `"ru"`などの言語コードを指定できます。

    speak("Привет!", "ru");
    speak("Hallo!", "en");
    speak("Hello!", "en_US");

