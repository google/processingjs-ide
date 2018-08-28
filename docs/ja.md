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

    // キャンバスの大きさを設定する。
    size(300, 300);
    // キャンバスをホワイトで塗る
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

次にコンピューターに自分の名前を覚えさせてみましょう。プログラムの中で「記憶する」という役割をするのを[変数][Variable]と呼びます。変数はプログラムの実行中で様々のことを記憶することができます。こちらのプログラムにあなたの名前を入れてみましょう。

    // 変数を作ります。
    String namae = "太郎";
    // 変数を使うことによって、名前を思い出します。
    speak("こんにちは、" + namae);

挨拶を変えてみましょう。または、変数は名前を覚えてくれるので、別のところでも使えます。

    // 変数を作ります。
    String namae = "太郎";
    // 変数を使うことによって、名前を思い出します。
    speak("こんにちは、" + namae);
    // まだ覚えています。
    text("こんにちは、" + namae, 0, 50);

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

次にいくつかのことをコンピューターに覚えさせてみましょう。もちろん、いくつかのの[変数][Variable]を作れます。

    String sei = "ぷろぷろ";
    String mei = "太郎";
    speak("こんにちは、" + sei + mei);

ただし、覚えさせたいことが多すぎたら、別の方法は必要になります。そこで、[配列][Array]（はいれつ）というものが役に立ちます。

    // 配列を作る。
    String yotei[] = {"顔洗い", "朝ゴハン", "歯磨き", "登校"};
    speak("明日の最初の予定は" + yotei[0] + "です。");
    speak("次は" + yotei[1] + "です。");
    speak("全部で" + yotei.length + "つの予定があります。");

詳しく知りたい人へ：

* 「`String yotei[]`」 の「`[]`」は 「ふくすうの言葉 (String) を記憶する変数を作ります、その変数の名前は 「`yotei`」 です」 という意味です。
* 「`{`」 と「`}`」で覚えてほしい言葉は囲まれています。
* 「`yotei[0]`」と「`yotei[1]`」はふくすうの覚えてるのものから思い出す命令です。「`[0]`」は1つ目と「`[1]`」は二つ目を指します。というわけで、覚えているものは０から数えます。
* 「`yotei.length`」は配列の長さといい、覚えているものの数という意味です。

次は[ステップ4][step4]に進みましょう。

# ステップ4：「いつだれがどこでどうした」ゲーム {#ref-step4}

[ステップ3][step3]に戻る。

今回はいままでのステップで学んだことを活かして「いつだれがどこでどうした」というゲームを作ってみましょう。プログラムは長くなりましたので、タイピング代わりにヘルプの画面で
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
* 「int(...)」は数字の整数部分を抽出します。例えば、「int(4.5)」= 4。「random」は整数ではない数字を返しますが、[配列][Array]にアクセスするには整数は必要です。

それでプログラミング体験のステップ終わりです。
もし、時間の余裕と興味があったら、[補足][Addendum]を見てみてください。
または、[デモ][Demos]や[ゲーム][Games]を実行してみましょう。

# 補足 {#ref-Addendum}

プログラミングに興味があったらこちらの補足情報もご覧ください。

* [顔を描く][DrawFace]
* [繰り返し（ループ）][Loop]
* [イベント][Events]


# 補足：顔を描く {#ref-DrawFace}

左側にあるプログラムを実行したら、右側にある実行キャンバスにさまざまな
絵や形状を描けます。位置を指定のために座標を使います。左上は(0,0)です。
座標の最初の数は左右を表して、最後の数は上下を表しています。

    size(200, 200);
    fill(0);
    textSize(10);

    ellipse(0, 0, 10, 10);
    text("(0, 0)", 10, 10);

    ellipse(200, 0, 10, 10);
    text("(200, 0)", 160, 10);

    ellipse(0, 200, 10, 10);
    text("(0, 200)", 10, 190);

では、丸を描きましょう。丸を描くために`ellipse()`という関数を使います。
`ellipse()`を呼ぶときは4つの数を指定します。最初2つの数は中心の座標を表します。
最後の2つの数は横幅と高さを表しています。例えば、縦の長い丸を描いてみましょう。
顔に似ているでしょうか？

    size(200, 200);
    fill(255, 200, 180); // 肌色
    ellipse(100, 100, 150, 180);

鼻を描くために三角を使いましょう。三角を描くために`triangle()`という関数を使います。
この関数を呼ぶときに数を6つを指定しなければなりません。それは三角の3つの点は各2つづつの座標です。

    fill(100, 255, 100); // 緑
    size(200, 200);
    triangle(100, 90, 90, 120, 110, 120);

口と目を前と同じように`ellipse()`を使いましょう。次の見本のプログラムに進む前に
自分で目と口を描いてみましょう。

    size(200, 200);
    fill(255, 200, 180); // 肌色
    ellipse(100, 100, 150, 180);  // 顔
    fill(100, 255, 100); // 緑
    triangle(100, 90, 90, 120, 110, 120); // 鼻
    fill(0, 0, 150); // 青
    ellipse(60, 75, 30, 5); // 左目
    ellipse(140, 75, 30, 5); // 右目
    fill(255, 130, 120); // 赤
    ellipse(100, 160, 60, 15); // 口


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
      size(200, 200);   // キャンバスの大きさを設定する。
      background(200);　// 灰色に塗る。
      stroke(0);　　　　 // 筆色を黒にする。
      rect(60, 60, 80, 80);  // 四角を描く。
    }

マウスイベントについてもっと詳しくは[マウス][Mouse]に参考ください。

# マウス {#ref-Mouse}

マウスの入力は[イベント][Events]によって行う。イベントのリスト:

* [mouseClicked()] マウスはクリックされたとき
* [mousePressed()] マウスのボタンが押されたとき
* [mouseReleased()] マウスのボタンが話されたとき
* [mouseOver()] マウスのカーソルはキャンバスに入ったとき
* [mouseOut()] マウスのカーソルがキャンバスから離れたとき
* [mouseX], [mouseY] マウスのXとY座標
* [mouseButton] マウスイベントの関数の中は押されたボタンを表す

# 形状ゲーム {#ref-ShapeGame}

ここまでに勉強してきたことを合わせて簡単のゲームを作ってみましょう。
キャンバスに形状を３つ書いて、英語で形状の名前を話して、ユーザー
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

`setup()`は実行の初めに一回呼ばれています。そこではキャンバスの大きさの設定などをしましょう。

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
      background(200);
      text(str(int(millis()/1000)), 10, 30);
      i++;
    }

    void setup() {
      frameRate(1);
      fill(0);  // 黒。
      textSize(30);
    }

# frameRate

`frameRate(x)`は`draw()`を呼ばれる頻度を設定します。
たとえば、`frameRate(10)`では、`draw()`の実行を終わってから
次の`draw()`を呼ぶまで0.1秒をまっています。`frameRate(1)`では、
1秒をまっています。

# インデックス {#ref-index}

## 実行

こちらの関数はプログラムの中に定義しなければいけません。

* [void setup() {...}][setup] 設定するための関数
* [void draw() {...}][draw] アニメーションのなかにフレームを描くための関数
* [exit()] 実行を終了する

## アニメーション

* [noLoop()] アニメーションの繰り返しを止める
* [loop()] アニメーションの繰り返しを再開する
* [millis()] 実行時間はミリ秒単位で返す

## キャンバス

* [background()] キャンバスを色で塗る
* [size()] キャンバスの大きさを設定する
* [dist()] 点と点の距離を計算する
* [copy()] ピクセルで画像をコピーする

## 形状

* [ellipse()] 楕円
* [rect()] 四角
* [triangle()] 三角
* [line()] 直線
* [arc()] 弧

## 筆の設定

* [fill()] 筆の中色を設定します
* [stroke()] 筆の端色を設定します
* [strokeCap()] 筆の先端の形を設定します
* [strokeWeight()] 筆の大きさを設定します

## テキスト

* [textSize()] 文字の大きさを設定します
* [text()] 文字を表します

## スピーチ

* [speak()] 声で話します

## [マウス][Mouse]

* [mouseClicked()] マウスはクリックされたとき
* [mousePressed()] マウスのボタンが押されたとき
* [mouseReleased()] マウスのボタンが話されたとき
* [mouseOver()] マウスはキャンバス内に入ったとき
* [mouseOut()] マウスはキャンバスから離れたとき
* [mouseX], [mouseY] マウスのXとY座標
* [mouseButton] マウスイベントの関数の中は押されたボタンを表す
* [cursor()] マウスカーソルの形を変える

## データ

* 単純な型
  * [int], [float], [boolean], [byte], [short], [double], [char]
* [Array]
  * [append()], [concat()]
* [HashMap]
  * [entrySet()]

## 言語の基礎

* 条件付き実行
  * [if], [else]
* [ループ][Loop]
  * [for], [while], [do]
  * [continue], [break]
* switch文
  * [switch], [case], [default]
* クラス
  * [class], [this]
* [final]


## 定数

* [PI], [HALF_PI], [QUARTER_PI], [TWO_PI].

## 数学の関数

* [abs()]
* [ceil()], [floor()], [round()]
* [sin()], [cos()], [tan()]

# size

`size(x_size, y_size)`はキャンバスの大きさを定めています。スケッチの実行の最初に一回だけ呼ばなければ行けない関数です。

    // キャンバスを300×200に設定します。
    size(300, 200);
    // キャンバスをピンクに塗ります。
    background(250, 200, 200);

# background

キャンバスを一つの色で塗ります。色は2つの方法で指定来ます。
一つの数字を指定すれば、黒→灰色→白の中から明るさを指定します。例えば

    // キャンバスを灰色に塗ります。
    background(150);

または、3つの数字を指定すれば、RGBモデルで任意の色を指定できます。

    // キャンバスを赤で塗ります。
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
* 迷路を解く
  * [右手法][LabyrinthWalker]
  * [地図作り][LabyrinthMapper]
  * [最短の道][LabyrinthSearch]
  * [道の作り直し][LabyrinthBacktrace]
  * [完成版][LabyrinthSolver]


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

円形またはエリプスを描きます。

    background(200); // 灰色
    fill(255, 0, 0); // 赤
    // 横に細長い赤いエリプスを描きます。
    ellipse(50, 10, 100, 20);
    fill(0, 0, 255); // 青
    // 縦の細長いエリプスを描きます。
    ellipse(10, 50, 20, 100);
    fill(255);  // 白
    ellipse(50, 50, 40, 40);

呼び方: `ellipse(x, y, width, height)`

* x --- X座標
* y --- Y座標
* width --- 横幅
* height --- 高さ

関連項目: [arc()].

# speak

声を足してテキストを読み上げます。

    // こんにちはと言います。
    speak("こんにちは");

他の言語に話させたいときは、テキストのあとに`"en"`, `"it"`などの言語コードを指定できます。

    speak("Ciao!", "it");
    speak("Hallo!", "en-GB");
    speak("Hello!", "en-US");

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

# Ball

Ball: 玉。ボール。

# Wall

Wall: 壁

# add

足す。付き加える。

# alert

警報。アラート。`alert(text)`はブラウザに`text`のテキストを警報します。

# drawGround

地面を描く。

# fill

`fill()`は筆の中の色を設定する。筆には２つの色が設定できます。中の色は形状の中に塗ります。
端の色は形状の堺麺を描く時に使います。

    fill(0, 255, 0);  // 緑
    ellipse(50, 50, 50, 25);

他に[stroke()]を見てみてください。

# get

取る、獲得する、取得する。

# hit

当たる、打つかる。

# false

真理値の一つ。「嘘」という意味。[boolean]を見てください。

# true

真理値の一つ。「真実」という意味。[boolean]を見てください。

# boolean

`boolean`は真理値の変数の型を示しています。真理値は2つの値があります

* `true` 「真実」
* `false` 「嘘」

[if()]と[while()]のカッコの中に真理値をいれなければなりません。

# void

`void`は何も返さない関数の型です。関数は値を返す必要がなければ、`void`を気軽に使います。

# char

`char`は一つの文字のコードポイント(符号点)を保存する整数の型を表す。

    char c = 'd'; // 100.

# int

変数の型を整数であるということを表します。整数は..., -3, -2, -1, 0, 1, 2, 3, 4, ...などの数です。

# float

変数が浮動小数点数であると表す。単精度を指定する。

注意: Processing.jsでは、変数に付く型が倍精度(double)である。

# double

変数が浮動小数点数であると表す。倍精度を指定する。

# byte

変数の型を整数であって、値は-128から127までであると表す。

注意: Processing.jsでは変数につけている型は倍精度(double)であるため、使う時点で`byte()`で変換が必要である。

    byte x = byte(257);
    text(str(x), 10, 10);

# short

変数の型を整数であって、値は-32768から32767までであると表す。

注意: Processing.jsでは変数につけている型は倍精度(double)であるため、使う時点で`short()`で変換が必要である。



# line

`line()`はキャンバスに直線を描きます。使い方は

    int x1 = 10, y1 = 10, y2 = 100, x2 = 50;
    // (x1, y1)から(x2, y2)までの直線を描きます。
    line(x1, y1, x2, y2);

# millis

プログラムの実行中で最初から経った時間をミリ秒で数えます。この関数を呼ぶごとに
時間が立って違う数が戻ってきます。

例えば、このプログラムは実行初めてから2秒後で赤い丸を描きます。

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

# mouseClicked

ユーザはマウスをクリックした時にこの関数が呼ばれます。
マウスの動きに反応するプロガルムを作るのためにこの関数を定義しなければなりません。
カーソルの位置は`mouseX`と`mouseY`変数を使って調べることができます。
クリックされたボタンは[mouseButton]を参照して区別できる。クリックされたボタンによって`mouseButton`の値は[LEFT]か[RIGHT]かになる。

    void setup() {
      background(255);
    }

    void mouseClicked() {
      fill(0);
      ellipse(mouseX, mouseY, 20, 20);
    }


# mouseOver

ユーザがマウスをキャンバス内に動かした時に`mouseOver()`は呼ばれます。
その関数を定義すれば、「使い始める」場面に対応できます。

    void setup() {
      background(0);
      text("待っています", 20, 20);
    }

    void mouseOver() {
      background(80);
      text("スタート", 20, 20);
    }

    void mouseOut() {
      background(0);
      text("終わり", 20, 20);
    }

# mouseOut

ユーザがマウスをキャンバスから離れた時に`mouseOut()`は呼ばれます。
その関数を定義すれば、「使い終わった」場面に対応できます。

    void setup() {
      background(0);
      text("待っています", 20, 20);
    }

    void mouseOver() {
      background(80);
      text("スタート", 20, 20);
    }

    void mouseOut() {
      background(0);
      text("終わり", 20, 20);
    }

# mousePressed

ユーザがマウスのボタンを押した時に`mousePressed()`は呼ばれます。
この関数を定義すれば、「マウスで絵を描く」のような操作が実装できます。

    void setup() {
      background(20);
      fill(240);
    }

    bool pressed = false;

    // キャンバスの中にマウスの右か左かのボタンを押しましょう。
    void mousePressed() {
      pressed = true;
      if (mouseButton == LEFT) {
        fill(0); stroke(0);
      } else if (mouseButton == RIGHT) {
        fill(255); stroke(255);
      }
    }

    void mouseReleased() {
      pressed = false;
    }

    void draw() {
      if (pressed) {
        ellipse(mouseX, mouseY, 5, 5);
      }
    }

# mouseReleased

ユーザがマウスをクリックしてからボタンを離した時に`mouseReleased()`は呼ばれます。
この関数を定義すれば、「マウスで絵を描く」のような操作ができます。

    void setup() {
      background(20);
      fill(240);
    }

    bool pressed = false;

    void mousePressed() {
      pressed = true;
    }

    void mouseReleased() {
      pressed = true;
    }

    void draw() {
      if (pressed) {
        ellipse(mouseX, mouseY, 10, 10);
      }
    }

# mouseButton

[マウスイベント][Mouse]の中に押されたボタンを表す。左ボタンが押されたとき、[LEFT]になる、右ボタンが押されたとき[RIGHT].

    // キャンバスの中にクリックしましょう。
    void mouseClicked() {
      if (mouseButton == LEFT) {
        background(0);
      } else if (mouseButton == RIGHT) {
        background(255);
      } else {
        background(150);
      }
    }

# mouseX

マウスのX座標。[draw()]からも[マウスイベント][Mouse]からも参照できる。

    void draw() {
      ellipse(mouseX, mouseY, 5, 5);
    }

関連項目: [mousePressed()], [mouseReleased()], [mouseClicked()].

# mouseY

マウスのX座標。[draw()]からも[マウスイベント][Mouse]からも参照できる。


    void draw() {
      ellipse(mouseX, mouseY, 5, 5);
    }

関連項目: [mousePressed()], [mouseReleased()], [mouseClicked()].

# LEFT

`LEFT`は[mouseButton]を参照するときにマウスの左ボタンを表す。

関連項目: [mouseButton], [mousePressed()], [mouseReleased()], [mouseClicked()].

# RIGHT

`RIGHT`は[mouseButton]を参照するときにマウスの右ボタンを表す。

関連項目: [mouseButton], [mousePressed()], [mouseReleased()], [mouseClicked()].





# printNumbers

数を表す。

# random


# rect

`rect()`は四角を描きます。四角の位置は2つの角の座標で指定できます。

    fill(0);
    rect(20, 30, 60, 40);

# remove

なくす、処分する。

# shuffle

順番をみだす、順不同にする。

# sqrt

`sqrt()`は数の平方根を計算します。例えば、`sqrt(4.0)`は2.0を返します。

# str

`str()`は任意の値を文字列(言葉)にする。

# stroke

`stroke()`は筆の端色を設定します。次の線や形状を描く命令に反映されます。

    stroke(255, 180, 0);  // オレンジ
    strokeWeight(5);
    line(20, 20, 80, 80);
    rect(20, 55, 60, 25);

# strokeCap

`strokeCap()`は線の先端の形を設定します。この関数を呼んでから次の[line()]の命令に反映します。

    strokeCap(ROUND);
    strokeWeight(20);
    line(20, 20, 80, 80);

選択できる形は

* `ROUND` - 丸い
* `SQUARE` - 四角い。線は座標で表している点までぴったり及びます。
* `PROJECT` - 四角い。線は座標で表している点から筆の大きさの部分まで出ています。

# ROUND

線を描く筆を丸い形に設定します。
[strokeCap()]を見てください。

# SQUARE

線を描く筆を四角い形に設定します。
[strokeCap()]を見てください。

# PROJECT

線を描く筆を四角い形に設定します。[SQUARE]と比べて、筆の大きさは線の先端に出ています。
[strokeCap()]を見てください。

# strokeWeight

`strokeWeight()`は筆の大きさを設定します。この関数を呼んでから次の線や形状を描く命令に反映します。

    strokeWeight(10);
    line(20, 20, 80, 80);


# text

`text()`はキャンバスに言葉を表します。表す位置を座標で指定します。

    text("こんにちは", 20, 30);

# textSize

`textSize()`は文字の大きさを設定します。この関数を呼んでから次の[text()]の命令に反映します。

    textSize(50);
    text("あ", 20, 80);

# triangle

`triangle()`は三角を描きます。3つの角点を座標で指定します。

    triangle(50, 10, 10, 80, 90, 80);

三角の端は端色の筆で描きます。[stroke()]と[strokeWeigth()]を見てください。
三角の中身を中色で塗ります。[fill()]を見てっください。

# update

更新する。

# while

ループといい、「…」のうちに繰り返しの命令である。

    int x = 0;
    while (x < 10) {
      text(str(x), 10, x*10);
      x = x+1;
    }

# for

ループといい、ある条件を満たすまでの繰り返し命令である。

    for (int i = 0; i < 10; i++) {
      text(str(i), 10, i*10);
    }

# do

ループの一つの種類。[while]と違って、初めて条件を調べる前に一回ループの本体
を実行する。

    do {
      text("一回だけ実行する!", 10, 10);
    } while (false);

# if

条件付き実行する。条件が満たされたら、条件付きのブロックを実行する。
条件は満たさなければ、[else]のブロックを実行する。[else]のブロックはなければ、
何も実行しない。

    if (10 > 5) {
      text("10 > 5", 10, 10);
    } else {
      text("10 <= 5 ?!", 10, 10);
    }

# else

条件付きの実行の[if]のブロックに条件が満たされないときに実行するブロック
指定する。

    if (10 < 5) {
      text("10 < 5 ?!", 10, 10);
    } else {
      text("10 >= 5", 10, 10);
    }

# case

`case`は、`switch`文の中で一つの値の分岐を表す。

関連項目: [switch], [default].

# switch

`switch`文は一つの変数の値を検出して、複数の値に対して比べて多重分岐から
一つの分岐を実行する。

    int x = 2;
    switch (x) {
      case 0: text("〇", 10, 10); break;
      case 1: text("一", 10, 10); break;
      case 2: text("二", 10, 10); break;
      default: text("他", 10, 10); break;
    }

関連項目: [case], [default].

# default

`default`は、[switch]文の中でどの値でも当たらなかった場合の分岐を表す。

関連項目: [switch], [case].

# ループ {#ref-Loop}

ループは繰り返す実行の命令である。いくつの種類がある

* [for]
* [while]
* [do]

# LabyrinthWalker

    /* @pjs preload="/static/Labyrinth2a.png"; */
    /* @pjs preload="/static/Walker44.png"; */
     
    PImage imgLabyrinth = loadImage("/static/Labyrinth2a.png");
    PImage imgWalker = loadImage("/static/Walker44.png");
     
    int s = 44;
     
    int x = 190;
    int y = 310;
     
    int dx = 0;
    int dy = -1;
     
    void setup() {  // this is run once.     
        // canvas size (Variable aren't evaluated. Integers only, please.)
        size(360, 360); 
        
        // Display the background (labyrinth).
        image(imgLabyrinth, 1, 1, 360, 360);
        
     
        
        // Use white fill color for drawing rectangles.
        fill(255,255,255);
        // Use white stroke color for drawing rectangles.
        noStroke();
        // Show image centered at (x,y).
        imageMode(CENTER);
        // Display the starting position of the walker.
        image(imgWalker, x, y, s, s);
    } 
     
    void turnLeft() {
      int tmp = dx;
      dx = dy;
      dy = -tmp;
    }
     
    boolean wallAhead() {
        boolean wallFound = false;
        int rx = -dy;
        int ry = dx;
        for (int i = -s/2-1; i <= s/2+1; i++) {
            color c = get(x+dx*(s/2+3)+rx*i, y+dy*(s/2+3)+ry*i);
            wallFound = wallFound || brightness(c) < 50;
        }
        return wallFound;
    }
     
    void moveForward() {
      rect(x-s/2, y-s/2, s, s);
      x += dx;
      y += dy;
      image(imgWalker, x, y, s, s);
    }
     
    void turnRight() {
      int tmp = dx;
      dx = -dy;
      dy = tmp;
    }
     
    boolean wallRight() {
      int rx = -dy;
      int ry = dx;
      boolean wallFound = false;
      for (int i = -s/2-1; i <= s/2+1; i++) {
          color c = get(x + rx*(s/2+3)+dx*i, y + ry*(s/2+3)+dy*i);
          wallFound = wallFound || brightness(c) < 50;
      }
      return wallFound;
    }
     
    boolean reachedGoal() {
      color c = get(x+dx*(s/2+3), y+dy*(s/2+3));
      return red(c) < 50 && green(c) > 50;
    }
     
    void draw() {
      if (reachedGoal()) {
          fill(0,0,0);  // black.
          text("Finish!", x+s/2, y);
          noLoop();
      }
      if (!wallRight()) {
        turnRight();
        moveForward();
        moveForward();
      } else if (wallAhead()) {
        turnLeft();
      }
      moveForward();
    }

# LabyrinthSolver

    /* @pjs preload="/static/Labyrinth2a.png"; */
    /* @pjs preload="/static/Walker44.png"; */
     
    PImage imgLabyrinth = loadImage("/static/Labyrinth2a.png");
    PImage imgWalker = loadImage("/static/Walker44.png");
     
    // Step in pixels.
    int s = 17;
    // Size of the grid.
    int n = 360/s;
    // The grid. 0 means the cell is blocked. >0 means the cell is open.
    int grid[][];
     
    boolean showMap = true;
     
    // The starting point;
    int sx = 0, sy = 0;
    // The goal.
    int gx = 0, gy = 0;
     
    void CreateMap() {
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                color c = get(i*s+s/2, j*s+s/2);
                if (brightness(c) > 200) {
                    grid[i][j] = 999;
                    if (showMap) {
                        fill(255, 255, 255);
                        rect(s*i, s*j, s/2, s/2);
                    }
                }
                if (red(c) > 100 && green(c) < 100) {
                    sx = i;
                    sy = j;
                    if (showMap) {
                        fill(200, 0, 0);
                        rect(s*i, s*j, s/2, s/2);
                    }
                } else if (green(c) > 100 & red(c) < 100) {
                    gx = i;
                    gy = j;
                    if (showMap) {
                        fill(0, 200, 0);
                        rect(s*i, s*j, s/2, s/2);
                    }
                }
            }
        }
    }
     
    // Fixed queue length for simplicity. The expected maximum queue size is
    // the the size of the grid, so should be well below 500.
    int queueLength = 500;
    int qx[] = new int[queueLength];
    int qy[] = new int[queueLength];
    int qhead = 0;
    int qtail = 0;
     
    void queuePush(int x, int y) {
        qx[qtail] = x;
        qy[qtail] = y;
        qtail = (qtail+1) % queueLength;
        // Note: in case of queue overflow, the queue contents will be lost
        // (misinterpreted as empty queue).
    }
     
    void queuePop() {
        if (qtail != qhead) {
            qhead = (qhead+1) % queueLength;
        }
    }
     
    boolean queueEmpty() {
        return qtail == qhead;
    }
     
    void visitCell(int x, int y, int distance) {
        // Out of bounds checks.
        if (x < 0 || x >= n) return;
        if (y < 0 || y >= n) return;
        // Wall check.
        if (grid[x][y] == 0) return;
        // Distance check. If we find a shorter distance,
        // record it and return true. Note that all empty cells
        // originally have 999 recorded.
        if (grid[x][y] > distance) {
            // Record the distance as shortest.
            grid[x][y] = distance;
            // Push the cell into the queue for further examination.
            queuePush(x, y);
            if (showMap) {
                fill(0, 0, 0);
                text("" + distance, x*s, y*s);
            }
        }
    }
     
    void StartSearch() {
        // Using Breadth-first search in rectangular grid.
        // Put the goal position into the queue and search back towards
        // the start position.
        queuePush(gx, gy);
        grid[gx][gy] = 1;
    }
     
    void setup() {  // this is run once.     
        // canvas size (Variable aren't evaluated. Integers only, please.)
        size(360, 360); 
        
        // Display the background (labyrinth).
        image(imgLabyrinth, 1, 1, 360, 360);
        
        // Allocate 2-dimensional array in 2 steps.
        grid = new boolean[n][];
        for (int i = 0; i < n; i++) {
            grid[i] = new boolean[n];
        }  
            
        CreateMap();
        StartSearch();
    }
     
    int next = 0;
    int step = 10;
    bool found = false;
     
    // The position during backtracing.
    int bx, by;
     
    void searchStep() {
        // While queue is not empty. Loop is implicit around draw().
        if (!queueEmpty()) {
            int x = qx[qhead];
            int y = qy[qhead];
            queuePop();
     
            fill(200, 200, 180);
            rect(s*x, s*y, s/2, s/2);
            int distance = grid[x][y];
     
            if (x == sx && y == sy) {            
                found = true;
                fill(0,0,0);
                bx = sx;
                by = sy;
                return;
            }
            // Go and try 4 neighbors.
            visitCell(x+1, y, distance+1);
            visitCell(x-1, y, distance+1);
            visitCell(x, y-1, distance+1);
            visitCell(x, y+1, distance+1);
            
        } else {
            // path not found.
            noLoop();
        }
    }
     
    boolean backTrace(int nx, int ny, int distance) {
        if (nx < 0 || nx >= n) return false;
        if (ny < 0 || ny >= n) return false;
        if (grid[nx][ny] != distance) return false;
        // Found the backtrace step.
        if (showMap) {
            stroke(255,0,0);
            line(bx+s/4, by+s/4, nx+s/4, ny+s/4);     
        }
        bx = nx;
        by = ny;
        return true;
    }
     
    void backTraceStep() {
        fill(255, 255, 100);
        rect(bx*s+s/4, by*s+s/4, s/2, s/2);
        if (bx == gx && by == gy) {
            noLoop();
        }
        int distance = grid[bx][by];
        stroke(255, 255, 0);
        if (backTrace(bx-1, by, distance-1));
        else if (backTrace(bx+1, by, distance-1));
        else if (backTrace(bx, by-1, distance-1));
        else if (backTrace(bx, by+1, distance-1));
    }
     
    void draw() {
        if (showMap) {
            while (millis() <= next) return;
            next = millis() + step;
        }
        
        if (found) {
            backTraceStep();
        } else {
            searchStep();
        }
    }
 
# LabyrinthMapper

このプログラムは迷路の画像を解析して地図を作っていきます。

    /* @pjs preload="/static/Labyrinth3a.png"; */
    PImage imgLabyrinth = loadImage("/static/Labyrinth3a.png");
    /* @pjs preload="/static/Walker44.png"; */
    PImage imgWalker = loadImage("/static/Walker44.png");
     
    // Step in pixels.
    int s = 17;
    // Size of the grid.
    int n = 360/s;
    // The grid. 0 means the cell is blocked. >0 means the cell is open.
    int grid[][];
     
    boolean showMap = true;
     
    // The starting point;
    int sx = 0, sy = 0;
    // The goal.
    int gx = 0, gy = 0;
     
    void setup() {  // this is run once.     
        // canvas size (Variable aren't evaluated. Integers only, please.)
        size(360, 360); 
        
        // Display the background (labyrinth).
        image(imgLabyrinth, 1, 1, 360, 360);
        
        // Allocate 2-dimensional array in 2 steps.
        grid = new boolean[n][];
        for (int i = 0; i < n; i++) {
            grid[i] = new boolean[n];
        }  
    }
     
    // The loop counters that live across multiple mapStep invocations.
    int i = 0, j = 0;
                
    void mapStep() {
                color c = get(i*s+s/2, j*s+s/2);
                if (brightness(c) > 200) {
                    grid[i][j] = 999;
                    if (showMap) {
                        fill(255, 255, 255);
                        rect(s*i, s*j, s/2, s/2);
                    }
                }
                if (red(c) > 100 && green(c) < 100) {
                    sx = i;
                    sy = j;
                    if (showMap) {
                        fill(200, 0, 0);
                        rect(s*i, s*j, s/2, s/2);
                    }
                } else if (green(c) > 100 & red(c) < 100) {
                    gx = i;
                    gy = j;
                    if (showMap) {
                        fill(0, 200, 0);
                        rect(s*i, s*j, s/2, s/2);
                    }
                }
         j++;
         if (j >= n) {
             j = 0;
             i++;
             if (i >= n) {
                 noLoop();
             }
         }
    }
     
     
    int next = 0;
    int step = 50;
     
    void draw() {
        if (showMap) {
            while (millis() <= next) return;
            next = millis() + step;
        }
        mapStep();
    }

# LabyrinthSearch

このプログラムは最短の道を探しています。

    /* @pjs preload="/static/Labyrinth3a.png"; */
    PImage imgLabyrinth = loadImage("/static/Labyrinth3a.png");
    /* @pjs preload="/static/Walker44.png"; */
    PImage imgWalker = loadImage("/static/Walker44.png");
     
    // Step in pixels.
    int s = 17;
    // Size of the grid.
    int n = 360/s;
    // The grid. 0 means the cell is blocked. >0 means the cell is open.
    int grid[][];
     
    boolean showMap = true;
     
    // The starting point;
    int sx = 0, sy = 0;
    // The goal.
    int gx = 0, gy = 0;
     
    void CreateMap() {
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                color c = get(i*s+s/2, j*s+s/2);
                if (brightness(c) > 200) {
                    grid[i][j] = 999;
                }
                if (red(c) > 100 && green(c) < 100) {
                    sx = i;
                    sy = j;
                   
                } else if (green(c) > 100 & red(c) < 100) {
                    gx = i;
                    gy = j;
                    
                }
            }
        }
        // Show the starting point.
        fill(200, 0, 0);
        rect(s*sx, s*sy, s/2, s/2);
        // Show the goal.
        fill(0, 200, 0);
        rect(s*i, s*j, s/2, s/2);
    }
     
    // Fixed queue length for simplicity. The expected maximum queue size is
    // the the size of the grid, so should be well below 500.
    int queueLength = 500;
    int qx[] = new int[queueLength];
    int qy[] = new int[queueLength];
    int qhead = 0;
    int qtail = 0;
     
    void queuePush(int x, int y) {
        qx[qtail] = x;
        qy[qtail] = y;
        qtail = (qtail+1) % queueLength;
        // Note: in case of queue overflow, the queue contents will be lost
        // (misinterpreted as empty queue).
    }
     
    void queuePop() {
        if (qtail != qhead) {
            qhead = (qhead+1) % queueLength;
        }
    }
     
    boolean queueEmpty() {
        return qtail == qhead;
    }
     
    void visitCell(int x, int y, int distance) {
        // Out of bounds checks.
        if (x < 0 || x >= n) return;
        if (y < 0 || y >= n) return;
        // Wall check.
        if (grid[x][y] == 0) return;
        // Distance check. If we find a shorter distance,
        // record it and return true. Note that all empty cells
        // originally have 999 recorded.
        if (grid[x][y] > distance) {
            // Record the distance as shortest.
            grid[x][y] = distance;
            // Push the cell into the queue for further examination.
            queuePush(x, y);
            if (showMap) {
                fill(0, 0, 0);
            }
        }
    }
     
    void StartSearch() {
        // Using Breadth-first search in rectangular grid.
        // Put the goal position into the queue and search back towards
        // the start position.
        queuePush(gx, gy);
        grid[gx][gy] = 1;
    }
     
    void setup() {  // this is run once.     
        // canvas size (Variable aren't evaluated. Integers only, please.)
        size(360, 360); 
        
        // Display the background (labyrinth).
        image(imgLabyrinth, 1, 1, 360, 360);
        
        // Allocate 2-dimensional array in 2 steps.
        grid = new boolean[n][];
        for (int i = 0; i < n; i++) {
            grid[i] = new boolean[n];
        }  
            
        CreateMap();
        StartSearch();
    }
     
    int next = 0;
    int step = 250;
    bool found = false;
     
    // The position during backtracing.
    int bx, by;
     
    void searchStep() {
        // While queue is not empty. Loop is implicit around draw().
        if (!queueEmpty()) {
            int x = qx[qhead];
            int y = qy[qhead];
            queuePop();
     
            fill(200, 200, 180);
            rect(s*x, s*y, s/2, s/2);
            int distance = grid[x][y];
            fill(0,0,0);
            text("" + distance, x*s, y*s);
     
            if (x == sx && y == sy) {            
                exit();
                return;
            }
            // Go and try 4 neighbors.
            visitCell(x+1, y, distance+1);
            visitCell(x-1, y, distance+1);
            visitCell(x, y-1, distance+1);
            visitCell(x, y+1, distance+1);
            
        } else {
            // path not found.
            noLoop();
        }
    }
     
    void draw() {
        if (showMap) {
            while (millis() <= next) return;
            next = millis() + step;
        }
        
        searchStep();
    }

# LabyrinthBacktrace

このプログラムは最短のルートを見つけてから後ろから道を作り直します。

    /* @pjs preload="/static/Labyrinth3a.png"; */
    PImage imgLabyrinth = loadImage("/static/Labyrinth3a.png");
    /* @pjs preload="/static/Walker44.png"; */
    PImage imgWalker = loadImage("/static/Walker44.png");
     
    // Step in pixels.
    int s = 17;
    // Size of the grid.
    int n = 360/s;
    // The grid. 0 means the cell is blocked. >0 means the cell is open.
    int grid[][];
     
    boolean showMap = true;
     
    // The starting point;
    int sx = 0, sy = 0;
    // The goal.
    int gx = 0, gy = 0;
     
    void CreateMap() {
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                color c = get(i*s+s/2, j*s+s/2);
                if (brightness(c) > 200) {
                    grid[i][j] = 999;            
                }
                if (red(c) > 100 && green(c) < 100) {
                    sx = i;
                    sy = j;        
                } else if (green(c) > 100 & red(c) < 100) {
                    gx = i;
                    gy = j;
                }
            }
        }
    }
     
    // Fixed queue length for simplicity. The expected maximum queue size is
    // the the size of the grid, so should be well below 500.
    int queueLength = 500;
    int qx[] = new int[queueLength];
    int qy[] = new int[queueLength];
    int qhead = 0;
    int qtail = 0;
     
    void queuePush(int x, int y) {
        qx[qtail] = x;
        qy[qtail] = y;
        qtail = (qtail+1) % queueLength;
        // Note: in case of queue overflow, the queue contents will be lost
        // (misinterpreted as empty queue).
    }
     
    void queuePop() {
        if (qtail != qhead) {
            qhead = (qhead+1) % queueLength;
        }
    }
     
    boolean queueEmpty() {
        return qtail == qhead;
    }
     
    void visitCell(int x, int y, int distance) {
        // Out of bounds checks.
        if (x < 0 || x >= n) return;
        if (y < 0 || y >= n) return;
        // Wall check.
        if (grid[x][y] == 0) return;
        // Distance check. If we find a shorter distance,
        // record it and return true. Note that all empty cells
        // originally have 999 recorded.
        if (grid[x][y] > distance) {
            // Record the distance as shortest.
            grid[x][y] = distance;
            // Push the cell into the queue for further examination.
            queuePush(x, y);
            if (showMap) {
                fill(0, 0, 0);
                text("" + distance, x*s, y*s);
            }
        }
    }
     
    void StartSearch() {
        // Using Breadth-first search in rectangular grid.
        // Put the goal position into the queue and search back towards
        // the start position.
        queuePush(gx, gy);
        grid[gx][gy] = 1;
    }
     
    void setup() {  // this is run once.     
        // canvas size (Variable aren't evaluated. Integers only, please.)
        size(360, 360); 
        
        // Display the background (labyrinth).
        image(imgLabyrinth, 1, 1, 360, 360);
        
        // Allocate 2-dimensional array in 2 steps.
        grid = new boolean[n][];
        for (int i = 0; i < n; i++) {
            grid[i] = new boolean[n];
        }  
            
        CreateMap();
        StartSearch();
    }
     
    int next = 0;
    int step = 250;
    bool found = false;
     
    // The position during backtracing.
    int bx, by;
     
    void searchStep() {
        // While queue is not empty. Loop is implicit around draw().
        if (!queueEmpty()) {
            int x = qx[qhead];
            int y = qy[qhead];
            queuePop();
     
            fill(200, 200, 180);
            rect(s*x, s*y, s/2, s/2);
            int distance = grid[x][y];
     
            if (x == sx && y == sy) {            
                found = true;
                fill(0,0,0);
                bx = sx;
                by = sy;
                return;
            }
            // Go and try 4 neighbors.
            visitCell(x+1, y, distance+1);
            visitCell(x-1, y, distance+1);
            visitCell(x, y-1, distance+1);
            visitCell(x, y+1, distance+1);
            
        } else {
            // path not found.
            noLoop();
        }
    }
     
    boolean backTrace(int nx, int ny, int distance) {
        if (nx < 0 || nx >= n) return false;
        if (ny < 0 || ny >= n) return false;
        if (grid[nx][ny] != distance) return false;
        // Found the backtrace step.
        if (showMap) {
            stroke(255,0,0);
            line(bx+s/4, by+s/4, nx+s/4, ny+s/4);     
        }
        bx = nx;
        by = ny;
        return true;
    }
     
    void backTraceStep() {
        fill(255, 255, 100);
        rect(bx*s+s/4, by*s+s/4, s/2, s/2);
        if (bx == gx && by == gy) {
            noLoop();
        }
        int distance = grid[bx][by];
        stroke(255, 255, 0);
        if (backTrace(bx-1, by, distance-1));
        else if (backTrace(bx+1, by, distance-1));
        else if (backTrace(bx, by-1, distance-1));
        else if (backTrace(bx, by+1, distance-1));
    }
     
    void draw() {
        if (found) {
            while (millis() <= next) return;
            next = millis() + step;
        }
        
        if (found) {
            backTraceStep();
        } else {
            searchStep();
        }
    }

# 配列 {#ref-Array}

`Array`は配列といい、データのリストを持っている。複数のデータを保存するとき、
番号を使って取り出せるのだ。

    int x[] = {1, 2, 3};  // 配列をつくる
    println(x[0]);
    println(x[2]);
    int y[] = new int[10]; // 別の配列を作る
    println(y[0]);  // 最初は０が入っています。

# HALF_PI

`HALF_PI`は円周率の半分である。 `1.5707963267948966`.

    arc(50, 50, 45, 45, 0, HALF_PI);

関連項目: [PI], [QUARTER_PI], [TWO_PI].

# QUARTER_PI

`QUARTER_PI`は円周率の4分の1である。 `0.7853981633974483`.

    arc(50, 50, 45, 45, 0, QUARTER_PI, HALF_PI);

関連項目: [PI], [HALF_PI], [TWO_PI].

# PI

`PI`は円周率である。`3.141592653589793`.

    size(150, 150);
    println(PI);
    float ps = 0;
    for (float x = 1; x < 150; x += 1) {
      float s = sin(x/150*2*PI);
      line(x-1, 50+40*ps, x, 50+40*s);
      ps = s;
    }

関連項目: [HALF_PI], [QUARTER_PI], [TWO_PI].

# TWO_PI

`TWO_PI`は円周率の二倍である。`6.283185307179586`.

    arc(50, 50, 45, 45, HALF_PI, TWO_PI);

関連項目: [PI], [HALF_PI], [QUARTER_PI].

# HashMap

`HashMap`はハッシュテーブルデータ構造である。データはキーと値の組で保存され、
キーに対して値を素早く参照できる。

    HashMap<Integer, String> map = new HashMap();
    map.put(123, "XYZ");
    text(map.get(123), 10, 10);

関連項目：[get], [put], [entrySet].

# get

`get`は複数の意味持っている。

* [HashMap]の場合、キーに対して値を取り出す。

# put

`put`は複数の意味を持っている。

* [HashMap]の場合、キーに対して与えられた値を保存する。

# entrySet

[HashMap]の場合、キーと値の組のセットを返す。そのセットはイテレータによって全ての組を取り出せる。

    size(300, 200); fill(0);
    HashMap hm = new HashMap();
    hm.put(1, "one");
    hm.put(12, "one two");
    hm.put(123, "one two three");
    for (it = hm.entrySet().iterator(); it.hasNext(); ) {
      Map.Entry en = it.next();
      int y = en.getKey();
      text("" + en.getKey() + ": " + en.getValue(), 10, y+10);
    }

関連項目: [iterator].

# iterator

`iterator`は[entrySet]などのデート構造から全ての値の組を取り出せる。

関連項目: [entrySet], [getKey], [getValue].

# getKey

[iterator]の場合、キーを返す。

# getValue

[iterator]の場合、値を返す。

# next

[iterator]の場合、次の組に進む命令する。

# hasNext

[iterator]の場合、次の組が存在するかどうか判別する。

# 変数 {#ref-Variable}

変数はプログラムの中に様々なデートを覚える仕組みである。

    int nenrei = 12;
    String namae = "たろう";
    fill(0); textSize(12);
    text(namae + nenrei + "才", 20, 20);

# オブジェクト {#ref-Object}

`Object`は関連するデータを束ね、複雑のデータ構造を表現できる。[変数][Variable]に`Object`の型を付けられたら、

    Object[] arr = {1, "abc"};
    for (int i = 0; i < arr.length; i++) {
      text(str(arr[i]), 10, 10+i*10);
    }

# String

`String`は文字列の型を表し、言葉を覚える変数を作る。

    String namae = "たろう";
    text(namae, 20, 20);

# PFont

`PFont`はフォントのデートを保存できる。

関連項目: [loadFont()].

# loadFont

`loadFont`は書体データ(フォント)を読み込みする。

    textFont(loadFont("Courier New"), 15);
    text("Courier New", 10, 20);
    textFont(loadFont("Verdana"), 15);
    text("Verdana", 10, 40);
    textFont(loadFont("Arial"), 15);
    text("Arial", 10, 60);

# color

`color`は色を表す。

    color red = color(255, 0, 0);
    color blue = color(0, 0, 255);
    fill(red);
    stroke(blue);
    rect(10, 10, 80, 80);

関連項目: [fill()], [background()], [red()], [green()], [blue()], [hue()], [saturation()], [brightness()], [colorMode()].

# abs

`abs`は数の絶対値を返す。

# alpha

`alpha`は色から透明度を抽出する。

    color opaque = color(255, 0, 0);
    color transparent = color(255, 0, 0, 10);
    println(alpha(opaque)); // 255
    println(alpha(transparent)); // 10
    fill(opaque);
    ellipse(50, 50, 20, 20);
    fill(transparent);
    rect(10, 10, 40, 40);

# append

`append()`は配列にもう一つの要素分を追加する。

    String[] namae = {"たろう", "花子"};
    append(namae, "次郎");
    fill(0); textSize(20);
    for (int i = 0; i < namae.length; i++) {
      text(namae[i], 10, 30+i*20);
    }

# concat

`concat()`は２つの配列を結合する。

# arc

`arc`は弧を描く。

    arc(50, 50, 40, 20, PI/4, 2*PI);

呼び方:`arc(x, y, width, height, start, stop)`

* x, y --- 楕円の中心の座標。
* width, height --- 楕円の横幅と縦幅。
* start, stop --- 弧の角度を指定する。

関連項目: [ellipse()].


# break

ループ([while], [for], [do])や[switch]から脱出する命令。

# continue

ループ([while], [for], [do])の実行を一旦止めて、ループの頭から実行再開する。

    int i = 0;
    while (i < 10) {
      text(str(i), 10, i*10);
      continue;
      text("絶対実行しない", 50, 50);
    }

# binary

`binary`は数を２進法(バイナリー)で表現する。返す値は文字列([String]).

    x = 1023; // Binary 1111111111.
    text(binary(x), 10, 10);
    text(binary(x, 5), 10, 40);

呼び方: `binary(input, num_digits)`

* `input` --- 二進法で表現する数
* `num_digits` --- 最大返す数字の上限

# blue

`blue()`は色に対して青色の値を返す。

関連項目: [color], [red()], [green()], [alpha()].

# green

`green()`は色に対して緑色の値を返す。

関連項目: [color], [red()], [blue()], [alpha()].

# red

`red()`は色に対して赤色の値を返す。

関連項目: [color], [green()], [blue()], [alpha()].

# hue

`hue()`は色に対して色相を返す。

関連項目: [color], [saturation()], [brightness()].

# saturation

`saturation()`は色に対して彩度を返す。

関連項目: [color], [hue()], [brightness()].

# brightness

`brightness()`は色に対して明度を返す。

関連項目: [color], [saturation()], [hue()].

# ceil

`ceil()`は数に対してそれ以上である最も近い整数を返す。

    float x = 9.3;
    float c = ceil(x); // 10.0

# floor

`floor()`は数に対してそれ以下である最も近い整数を返す。

    float x = 9.3;
    float c = floor(x);  // 9.0

# round

`round()`は数に対して最も近い整数を返す。

    float x = 9.3;
    float c = round(x);  // 9.0

# sin

`sin()`は角度のサイン関数を計算する。

# cos

`cos()`は角度のコサイン関数を計算する。

# tan

`tan()`は角度のサインとコサインの比率を計算する。

# class

`class`はオブジェクト指向のクラスの定義を表す。

    class Doubutsu {
      Doubutsu(String namae, int nenrei) {
        this.namae = namae;
        this.nenrei = nenrei;
      }

      String toString() {
        return this.namae + ", " + this.nenrei + "才";
      }
    }

    Doubutsu wanwan = new Doubutsu("ワンワン", 3);
    text(wanwan, 10, 30);

# this

[class]の定義の中に自分自身のオブジェクトに参照する方法。

関連項目: [class].

# toString

オブジェクトに対して、文字列を期待する文脈で呼ばれるメソッド。
例えば、`str()`にオブジェクトを渡されたとき。

    class Inu {
      Inu(String namae) {
        this.namae = namae;
      }
      String toString() {
        return "犬、名前:" + this.namae;
      }
    }

    size(150, 100); fill(0);
    text(str(new Inu("ワンワン")), 10, 30);

# final

`final`は変数の値が固定して変えられないことを表す。

# dist

`dist()`は２つの点に対して距離を計算する。

    void draw() {
      background(255); fill(0);
      text(dist(50, 50, mouseX, mouseY), 50, 50);
    }

# cursor

`cursor()`はマウスのカーソルの形を指定する。

    void setup() {
      frameRate(2);
    }
    // マウスのカーソルをキャンバス内に置きましょう。
    int i = 0;
    void draw() {
      i++;
      switch(i%6) {
        case 0: cursor(HAND); break;
        case 1: cursor(CROSS); break;
        case 2: cursor(ARROW); break;
        case 3: cursor(MOVE); break;
        case 4: cursor(TEXT); break;
        case 5: cursor(WAIT); break;
      }
    }

関連項目: [ARROW], [CROSS], [HAND], [MOVE], [TEXT], [WAIT].

# ARROW

マウスカーソルの矢印の形を表す。

関連項目: [cursor()].

# CROSS

マウスカーソルの十字の形を表す。

関連項目: [cursor()].

# HAND

マウスカーソルの手の形を表す。

関連項目: [cursor()].

# MOVE

マウスカーソルの移動矢印の形を表す。

関連項目: [cursor()].

# TEXT

マウスカーソルの縦線の形を表す。

関連項目: [cursor()].

# WAIT

マウスカーソルの砂時計の形を表す。

関連項目: [cursor()].

# exit

`exit()`はスケッチの実行を終了する。

# copy

`copy()`画像の指定された部分をキャンバスの別のところでコピーする。

    ellipse(50, 50, 40, 40);
    copy(50, 50, 24, 24, 0, 0, 50, 50);

呼び方: `copy(x, y, w, h, dx, dy, dw, dh)`

* x, y --- コピーの元の四角の左上の角のX,Y座標
* w, h --- コピーする資格の横幅と縦幅
* dx, dy --- コピーの目的地の四角の左上の角のX,Y座標
* dw, dh --- コピーの目的地の横幅と縦幅
