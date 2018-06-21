# プロセシング {#ref-help}

* プログラミング体験ワークショップ
  * [ステップ1][step1]
  * [ステップ2][step2]
  * [ステップ3][step3]
  * [ステップ4][step4]
* [補足][Addendum]
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

今回のワークショップのテーマはコンピューターに言葉を話させることです。こちらのプログラムを入力してみましょう。

    // 「こんにちは」と話して。 
    speak("こんにちは");

ここに書いてある2行のうち、「//」 から初めの行は人間への説明です。コンピュータはこちらを無視しますので入力を省略しても大丈夫です。コンピューターへの命令は２行目のみです。

    speak("こんにちは");

実行してみましょう。

「こんにちは」の部分を変えてみて、別の言葉を話させてみましょう。

詳しく知りたい人へ：

* `speak(...)` は 「... の中の内容を話して」という命令です。
* “...” の **"** は言葉を囲む記号です。
* **;** は命令の区切りを意味します。

次は[ステップ2][step2]に進みましょう。

# ステップ2 {#ref-step2}

[ステップ1][step1]に戻る。

次にコンピューターに自分の名前を覚えさせてみましょう。プログラムの中で「記憶する」という役割をするのを変数と呼びます。変数はプログラムの実行中で様々のことを記憶することができます。こちらのプログラムにあなたの名前を入れてみましょう。

    // 変数を作ります。
    String name = "太郎";
    // 変数を使うことによって、名前を思い出します。
    speak("こんにちは、" + name);

挨拶を変えてみましょう。または、変数は名前を覚えてくれるので、別のところでも使えます。

    // 変数を作ります。
    String name = "太郎";
    // 変数を使うことによって、名前を思い出します。
    speak("こんにちは、" + name);
    // まだ覚えています。
    text("こんにちは、" + name, 0, 50);

詳しく知りたい人へ：

* 「String namae」 は 「言葉 (String) を記憶する変数を作ります、その変数の名前は 「namae」 です」 という意味です。
* 「=」 は右にあるものを左の変数に記憶しなさいという命令です。全体で、「namae という言葉を格納する変数に “太郎” を記憶しなさい」 という命令になります。
* 「+」 を使うと言葉をつなげることができます。
* 「text(...)」はテキストを表示します。格好のなかの最初のものは表示する言葉です。その後のは2つの数字は表示する場所を表しています。
変数はコンピューターの記憶と考えてもいいです。変数を使うことによって、
コンピューターは様々な情報を覚えてくれます。

次は[ステップ3][step3]に進みましょう。

# ステップ3：配列（はいれつ）{#ref-step3}

[ステップ2][step2]に戻る。

次にいくつかのことをコンピューターに覚えさせてみましょう。もちろん、いくつかのの変数を作れます。

    String sei = "ぷろぷろ";
    String mei = "太郎";
    speak("こんにちは、" + sei + mei);

ただし、覚えさせたいことが多すぎたら、別の方法は必要になります。そこで、配列（はいれつ）というものが役に立ちます。

    // 配列を作る。
    String yotei[] = {"顔洗い", "朝ゴハン", "歯磨き", "登校"};
    speak("明日の最初の予定は" + yotei[0] + "です。");
    speak("次は" + yotei[1] + "です。");
    speak("すべて" + yotei.length + "の予定があります。");

詳しく知りたい人へ：

* 「`String yotei[]`」 の「`[]`」は 「ふくすうの言葉 (String) を記憶する変数を作ります、その変数の名前は 「`yotei`」 です」 という意味です。
* 「`{`」 と「`}`」で覚えてほしい言葉は囲まれています。
* 「`yotei[0]`」と「`yotei[1]`」はふくすうの覚えてるのものから思い出す命令です。「`[0]`」は1つ目と「`[1]`」は二つ目を指します。というわけで、覚えているものは０から数えます。
* 「`yotei.length`」は配列の長さといい、覚えているものの数という意味です。

次は[ステップ4][step4]に進みましょう。

# ステップ4：配列（はいれつ）{#ref-step4}

[ステップ3][step3]に戻る。

今回はいままでのステップで学んだことを活かして「いつだれがどこで何した」というゲームを作ってみましょう。プログラムは長くなりましたので、タイピング代わりにヘルプの画面で
「トップ」→「ステップ4」を押してから「読み込む」ボタンを押してプログラムを読み込みましょう。

    String itsu[] = {"昨日", "2年前", "今朝"};
    String darega[] = {"太郎が", "花子が"};
    String dokode[] = {"外で", "学校で", "とつぜん", "大きく"};
    String doushita[] = {"起きました",  "叫びました",  "転びました",  "輝きました"};

    size(400, 200);
    fill(0);
    textSize(25);

    int itsuIndex = int(random(itsu.length));
    int daregaIndex = int(random(darega.length));
    int dokodeIndex = int(random(dokode.length));
    int doushitaIndex = int(random(doushita.length));

    String phrase = itsu[itsuIndex] + darega[daregaIndex] + dokode[dokodeIndex] + doushita[doushitaIndex];
    text(phrase, 10, 100);
    speak(phrase);

文しょうを作るのための部分を変えてみましょう。

詳しく知りたい人へ：

* 「random(...)」は乱数といい、実行するごとに違う数字を返します。例えば、「random(5)」は0から5までの数字を返します。
* 「int(...)」は数字の整数部分を抽出します。例えば、「int(4.5)」= 4。「random」は整数ではない数字を返しますが、配列にアクセスするには整数は必要です。

それでプログラミング体験のステップ終わりです。
もし、時間の余裕と興味があったら、[補足][Addendum]を見てみてください。
または、[デモ][Demos]や[ゲーム][Games]を実行してみましょう。

# 補足 {#ref-Addendum}

プログラミングに興味があったらこちらの補足情報もご覧ください。

* [繰り返し（ループ）][Loop]
* [イベント][Events]

# 補足：繰り返し（ループ） {#ref-Loop}

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

# 補足：イベント {#ref-Events}

プログラムの実行中でユーザの入力に対応するにはいくつかの方法ありますが、
こちらで**イベント**を紹介します。ユーザーはマウスクリックしたときに
[mouseClicked()]という関数が呼ばれます。

    // マウスがクリックした時に実行されます。
    void mouseClicked() {　
      // 四角の中か外か判断する。 
      if (60 <= mouseX && mouseX <= 140 &&
          60 <= mouseY && mouseY <= 140) {
        speak("ピンポン");
      } else {
        speak("ぶぶ");
      }
    }

    // 設定。実行の最初に実行されます。
    void setup() {
      size(200, 200);   // キャンワスの大きさを設定する。
      background(200);　// 灰色に塗る。
      stroke(0);　　　　 // 筆色を黒にする。
      rect(60, 60, 80, 80);  // 四角を描く。
    }

マウスイベントについてもっと詳しくは[マウス][Mouse]に参考ください。

# 形状ゲーム {#ref-ShapeGame}

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

* [RandomSentenceGenerator]
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

# ゲーム {#ref-Games}

* [JumpingBall (未完成)][JumpingBallTemplate]
* [JumpingBall (完成)][JumpingBallCompleted]
* [TouchTheNumber]
* [形状ゲーム][ShapeGame]


# JumpingBall (未完成) {#ref-JumpingBallTemplate}

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


# JumpingBall (完成) {#ref-JumpingBallCompleted}

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

他の言語に話させたいときは、テキストのあとに`"en"`, `"it"`などの言語コードを指定できます。

    speak("Ciao!", "it");
    speak("Hallo!", "en_GB");
    speak("Hello!", "en_US");

### 注意

`speak()`は標準なProcessing.jsの一部ではありません。このシステム以外のProcessing.jsの環境は対応しません。

# RandomSentenceGenerator

    // RandomSentenceGenerator

    String names[] = {
      "太郎", "花子"
    };

    String how[] = {
      "早く", "とつぜん", "外で"
    };

    String verbs[] = {
      "叫びました",
      "きのこになりました",
      "ふられました"
    };

    size(400, 200);
    fill(0);
    textSize(25);

    int nameIndex = int(random(names.length));
    int howIndex = int(random(how.length));
    int verbIndex = int(random(verbs.length));

    String phrase = names[nameIndex] + how[howIndex] + verbs[verbIndex];
    text(phrase, 10, 100);
    speak(phrase);
