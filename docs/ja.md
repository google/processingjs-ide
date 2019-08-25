# Processing.js 春ワークショップ {#ref-help}

*   [はじめに][SpringStep0]
*   [Step 1: キャンバスと図形][SpringStep1]
*   [Step 2: 色][SpringStep2]
*   [Step 3: アニメーション][SpringStep3]
*   [Step 4: マウスの使い方][SpringStep4]
*   [Step 5: キーボードの使い方][SpringStep5]
*   [Step 6: シミュレーション][SpringStep6]
*   [Step 7: 画像と音][SpringStep7]
*   [Step 8: ゲームサンプル][SpringStep8]
*   [アンケート](https://forms.gle/yCLKJCymfWJqCPYJ6)
*   ヘルプ
    *   [索引][index]
    *   [ツール][Tools]
    *   [デモ][Demos]
    *   [ゲーム][Games]
    *   [画像リスト][ImageLibrary]
    *   [音のリスト][SoundLibrary]
*   [その他ワークショップ][otherworkshops]

# その他 {#ref-otherworkshops}

*   [2018年夏期ワークショップ][workshopSep]
*   [2018年春ワークショップ][help]
*   [TTS ワークショップ][TTSWorkshop]

# はじめに {#ref-SpringStep0}

このワークショップの目的は、皆さんにプログラミングを体験していただき、コンピューターサイエンスは誰でも気軽に楽しめるものだということを知っていただくことです。そこで、本日は皆さんに簡単なゲームを作っていただきます。

今回はProcessingというプログラミング言語を使います。今回は本ワークショップ専用のページを使いますが、Processingには長い歴史があり、他の人の作ったプログラムがたくさんあります。

プログラムに何か問題があると赤い波線が出てきます。この場合、プログラムの修正が必要です。何が問題なのか分からないときは、マウスを近づけると英語での説明が現れます。不明な点があれば、社員に遠慮なく質問してください。

![/static/full-width-semicolon-warning.png](/static/full-width-semicolon-warning.png)

ワークショップ中に出ているサンプルプログラムは全てヘルプに含まれています。タイピングが難しい場合や、いちいち入力していると講義に追い付けなくなりそうな場合は、ヘルプからサンプルを読み込むことができます。

![/static/sketch-load.png](/static/sketch-load.png)

プログラムを編集しながら別のサンプルを試したいときは、ブラウザで新しいタブを作ってみましょう。[ 新規作成 ]
ボタンをクリックすると新しいタブが開きます。元のタブに戻ると、編集してきたプログラムを継続できます。

![/static/new-sketch-button-highlight.png](/static/new-sketch-button-highlight.png)

プログラムの中に現れる単語や関数が分からないときは、ヘルプを使ってみましょう。

![/static/help-button-highlight.png](/static/help-button-highlight.png)

次は[ステップ1][SpringStep1]へ。

# ステップ１: キャンバスと図形 {#ref-SpringStep1}

コンピューターグラフィックでは、x座標は数学と同じように右に向かって増えますが、y座標は普通の数学と反対で下に向かって増えます。

```render
// CanvasAxes
void arrow(int x1, int y1, int x2, int y2) {
  line(x1, y1, x2, y2);
  float x = x2-x1;
  float y = y2-y1;
  float l = sqrt(x*x+y*y);
  x = x / l * 10;
  y = y / l * 10;
  alpha = PI/4;
  line(x2, y2, x2 - x*cos(alpha) + y*sin(alpha), y2 - x*sin(alpha) - y*cos(alpha));
  line(x2, y2, x2 - x*cos(-alpha) + y*sin(-alpha), y2 - x*sin(-alpha) - y*cos(-alpha));
}

arrow(10, 20, 90, 20);
arrow(20, 10, 20, 90);
fill(0);
text("(0,0)", 1, 11);
text("x", 80, 37);
text("y", 30, 85);
```

設定しなければ、 デフォルトのキャンバスは縦100かける横100ピクセルになります。 キャンバスをもっと大きく するには、
`size()`関数を使って設定できます。

```prerender
size(150, 150);
```

座標の数字を使って様々な図形を描けます。 よく使うのはrect(), ellipse(), line()です。

![/static/rect.png](/static/rect.png)
![/static/ellipse.png](/static/ellipse.png)
![/static/line.png](/static/line.png)

例えば、こちらのプログラムを打ってみましょう。

```prerender
rect(10, 10, 80, 40);
ellipse(50, 75, 80, 40);
line(10, 60, 90, 90);
```

実行してみましょう。キャンバスに右のような絵が出てきたでしょうか？
プログラムを構成する一つ一つの行は命令といいます。Processingでは、各命令は必ずセミコロン(;)で終わらなければいけません。

それでは、今習ったことを使ってみましょう。

**問題１**: 雪だるまを描きましょう。 例に限らず、好きなような形の雪だるまにしましょう。

例として以下の雪だるまいかがでしょうか。

```render
// Snowman
size(300, 300);
ellipse(150, 250, 100, 100);
ellipse(150, 170, 80, 80);
ellipse(150, 110, 60, 60);
```

```hidden
// Snowman1
size(300, 300);
ellipse(150, 250, 100, 100);
ellipse(150, 170, 80, 80);
ellipse(150, 110, 60, 60);
```

次は、[ステップ2][SpringStep2]へ。

# ステップ2: 色 {#ref-SpringStep2}

今までの絵は白黒でしたが、それではつまらないので、色を加えてみましょう。ProcessingではRGBまたはRGBAカラーモデルを採用しています。RGBはR=Red
(赤)、G=Green (緑)、B=Blue (青)から成り立っています。次の図はRGBのカラーミックスのイメージです。

```render
color posToColor(int x, int y) {
  if (x < width/2 && y < height/2) {
    return color((width/2-x)/width*512, (height/2-y)/height*512, 0);
  } else if (x < width/2) {
    return color(220);
  } else if (y < height/2) {
    return color(0, (height/2-y)/height*512, (x-width/2)/width*512);
  } else {
    return color((y-height/2)/height*512, 0, (x-width/2)/width*512);
  }
}

void setup() {
  size(200, 200);
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      set(x, y, posToColor(x, y));
    }
  }

  fill(255);
  textSize(height/20);
  text("(255,0,0)", 5, height/2-5);
  fill(0);
  textAlign(LEFT, TOP);
  text("(255,255,0)", 5, 2);
  textAlign(RIGHT, TOP);
  text("(0,255,255)", width-5, 2);
  textAlign(CENTER, TOP);
  text("(0,255,0)", width/2, 2);
  textAlign(LEFT, BASELINE);
  fill(255);
  text("(0,0,0)", width/2+2, height/2-2);
  textAlign(RIGHT, BASELINE);
  text("(0,0,255)", width-2, height/2);
  fill(0);
  textAlign(LEFT, BOTTOM);
  text("(255,0,0)", width/2+2, height-2);
  textAlign(RIGHT, BOTTOM);
  text("(255,0,255)", width-2, height-2);
}
```

自分のお好みの色選ぶときに[色ツール][ColorTool]を使ってみてください。

色の設定は２つあります。各図形を描くときは外線や内部を別々の色で塗ります。外線の色は`stroke()`で設定し、内部の色は`fill()`で設定します。

例えば、こちらのプログラムを打って実行してみましょう。

```prerender
fill(0, 255, 0);  // 内部の色は緑
stroke(0, 0, 255);  // 端の色は青
ellipse(50, 50, 80, 80);
```

右側にあるの絵のようになりましたか？
このプログラムの中に出てくる、`//`から始まる文章は、コメントと呼びます。コンピューターはコメントを無視するので、プログラムについて説明を入れたいときに便利です。

RGBAカラーモデルはRGBに加えてA=Alpha(透明度)を設定します。例えば、中を塗らない楕円を描くために使えます：

```prerender
fill(0, 0, 0, 0);  // アルファは0だから、内部を塗らない
ellipse(50, 50, 80, 80);
```

色を使わないで、明るさだけの設定するときに3つの数は同じなので、略できます:
`fill(50);`は`fill(50,50,50);`と同じ意味で、グレー色を設定します。また、`fill(60,60,60,150);`は
`fill(60,150);`と同じ意味です。

図形を塗りつぶしたくないときに`noFill();`も使えます。端を描かないように`noStroke();`を使えます。

では、雪だるまに色を加えましょう。

**問題２**：前に作った雪だるまに色をつけたり、アイテムをあげたりしてみましょう。

```hidden
// Snowman2Color
size(300,300);
strokeWeight(5);
stroke(255, 100, 100);
ellipse(150, 250, 100, 100);
stroke(100, 255, 100);
ellipse(150, 170, 80, 80);
stroke(100, 100, 255);
ellipse(150, 110, 60, 60);
```

次は[ステップ3][SpringStep3]へ。

# ステップ3: アニメーション {#ref-SpringStep3}

今日のワークショップの目的は皆さんに自分で簡単なゲームを作ってもらうことなので、単に図形を描くだけでは足りません。図形を動かしてみましょう。

そのためには、同じプログラムを何回も繰り返し実行する必要があります。Processingにはアニメーションを作るのための仕組みがすでに含まれています。

一回だけ実行したいプログラムの部分は`void setup() { ... }` の中に書き、何回も繰り返しで実行したい部分は`void draw() {
... }`の中に書くと、簡単なアニメーションを作れます。 このように`{}`で囲ったプログラムの部分は「関数」といいます。

![/static/execute-diagram.png](/static/execute-diagram.png)

いくつかの例を見てみましょう。

```example
void setup() {
  textSize(50); // 文字を大きくする
  fill(0);      // 文字を黒にする
}

void draw() {
  text(frameCount, 10, 50);
}
```

早すぎて何が起きたかよくわかりません。実行をもう少し遅くするには`frameRate()`が便利です。`draw()`を一回実行されたときに一つのフレームとして考えると、フレーム・レートは一秒あたり何回`draw()`が呼ばれるかを示します。

```example
void setup() {
  textSize(50);
  fill(0);
  frameRate(1);
}

void draw() {
  text(frameCount, 10, 50);
}
```

今回は分かりやすくなりましたね。同じところに連続で１、２、３などの数字を表示します。`frameCount`は毎回フレーム番号を表しています。`draw()`の実行ごとに違う数が表示されます。

番号がはっきり見えるようにしましょう。新しい番号を見せる前にキャンバスを消すことで、新しい番号がはっきり見えます。キャンバスを消すためには`background()`を使います。`background()`には前と同様にRGBの形式色を指定できます。

```example
void setup() {
  textSize(50);
  fill(0);
  frameRate(1);
}

void draw() {
  background(200);  // キャンバスをグレーに塗りつぶす
  text(frameCount, 10, 50);
}
```

この例で出てきた`frameCount`は変数といいます。

**問題３**:
`draw()`や`frameCount`や図形の命令を使って好きなように雪だるまのアニメーションを作りましょう。何か分からないことがあったら質問してください。


```hidden
// Snowman3Animated
void setup() {
  size(300, 300);
}

void draw() {
  background(220);
  int x = 150, y = 170;
  strokeWeight(5);
  stroke(255, 100, 100);
  ellipse(x, y+80, 100, 100);
  stroke(100, 255, 100);
  ellipse(x-5*cos(frameCount/18), y, 80, 80);
  stroke(100, 100, 255);
  ellipse(x+5*sin(frameCount/18), y-60, 60, 60);
}
```

次は[ステップ4][SpringStep4]へ。

# ステップ4: マウスの使い方 {#ref-SpringStep4}

ゲームを作るにはユーザーからの入力を処理する必要があります。まずはマウスを使ってみましょう。プログラムの実行中にマウスがキャンバスの中に入ると、`mouseX`と`mouseY`の変数にマウスの位置が設定されます。

```prerender
void draw() {
  background(255);  // 白
  ellipse(mouseX, mouseY, 10, 10);
}
```

マウスをキャンバス内で動かしてみましょう。丸がマウスについてくるのがわかるでしょう。

では、ユーザーがマウスをクリックしたらキャンバスを黒くしてみましょう。
ユーザーがマウスをクリックしたことに反応するためには、`mousePressed()`関数を定義します。この関数は、マウスのボタンが押されたときに呼ばれます。次のプログラムを実行して、マウスをキャンバス内でクリックすると、一瞬だけキャンバスが黒くなります。

```prerender
void draw() {
  background(255);  // 白
  ellipse(mouseX, mouseY, 10, 10);
  frameRate(10);
}

void mousePressed() {
  background(0);  // 黒
}
```

なぜキャンバスが黒のままにならないのでしょうか。それは、`draw()`関数が繰り返し実行され、`draw()`の中にキャンバスを白く塗りつぶす命令`background(255)`が入っているからです。

マウスをクリックした後、キャンバスを一瞬だけではなくずっと黒にするには、どうすればいいでしょうか。

ここでは変数が役に立ちます。ただ、前と違って、Processingの標準の変数ではなくて、自分で新しい変数を作ります。変数を作るには、`int c =
255;`のような文をプログラムに追加します。この中で`int`は変数の型を表しています：整数(integerの略)。 `=
255`は変数の値を指定しています。`c`は変数の名前です。マウスがクリックされたときに`mousePressed()`が呼ばれるので、その中で変数の値を変えることができます。
`c = 0;`は変数に新しい値(`0`)を与えます。

```prerender
int c = 255;

void draw() {
  background(c);
  ellipse(mouseX, mouseY, 10, 10);
  frameRate(10);
}

void mousePressed() {
  c = 0;
}
```

ここでは、プログラムの実行を始めた時に変数cが作られて、最初の値は255になっています。変数の値は255なので、`background(c);`はキャンバスを白く塗りつぶします。ユーザがマウスをクリックすると、`mousePressed()`が呼ばれて、変数cの値が0になります。その後は、`background(c);`という命令はキャンバスを黒く塗りつぶすことになります。

**問題4**: 雪だるまをマウスと一緒に動かしてみましょう。

```hidden
// SnowmanMouse
void setup() {
  size(300, 300);
}

void draw() {
  background(220);
  ellipse(mouseX, mouseY+80, 100, 100);
  ellipse(mouseX, mouseY, 80, 80);
  ellipse(mouseX, mouseY-60, 60, 60);
}
```

次は[ステップ5][SpringStep5]へ。

# ステップ5: キーボードの使い方 {#ref-SpringStep5}

ゲーム機には普通マウスはついてないので、キーパッドで遊ぶことが多いでしょう。では、ゲーム機のようにキーボードを使って遊べるようにするにはどうすればいいでしょう。

Processingでは、キーボードの使い方はマウスととても似ています。キーボードのボタンが押されるたびに`keyPressed()`関数が呼ばれます。次の例を見ましょう。その関数の中に`keyCode`を参照すれば、押されたキーが分かります。次のプログラムは丸を描いています。実行したら、キャンバス内をクリックして、左右の矢印キーを押してみましょう。

```prerender
int x = 50;

void draw() {
  background(220);
  ellipse(x, 50, 30, 30);
}

void keyPressed() {
  if (keyCode == LEFT) {
    x = x - 5;
  }
  if (keyCode == RIGHT) {
      x = x + 5;
  }
}
```

**問題5**: 雪だるまをキーボードの左右矢印キーで動かしてみましょう。

```hidden
// SnowmanKeyboard

int x = 150;

void setup() {
  size(300, 300);
}

void draw() {
  background(220);
  ellipse(x, 250, 100, 100);
  ellipse(x, 170, 80, 80);
  ellipse(x, 110, 60, 60);
}

void keyPressed() {
  if (keyCode == LEFT) {
    x = x - 5;
  }
  if (keyCode == RIGHT) {
      x = x + 5;
  }
}
```

次は[ステップ6][SpringStep6]へ。

# ステップ6: シミュレーション {#ref-SpringStep6}

ゲームのなかのオブジェクトは馴染みがあると遊びやすくなります。たとえば、重力で落ちるボールはどのようにプログラムで表現するのでしょうか？それはシミュレーションを使って実装できます。ボールのシミュレーションにはボールの位置と速度が必要です。重力の場合は加速度は定数です。

```example
float y = 10;
float vy = 0;

void draw() {
  // シミュレーション
  y = y + vy;     // 縦位置
  vy = vy + 0.1;  // 加速
  // アニメーション
  background(220);
  ellipse(50, y, 30, 30);
}
```

ボールのシミュレーションに２つの変数を使います。`y`は縦位置と`vy`は縦速度を表しています。`draw()`は一秒で何回も呼ばれるので、毎回新しい位置や速度を計算します。シミュレーションの計算の後、キャンバスを書き直すことでアニメーションを実装します。この例では前と違って`float`の変数を使います。`float`は浮動小数点数といい、整数ではない数を保存できます。

以上のシミュレーションでボールが一回キャンバスの下に落ちたらキャンバスから消えます。ボールをゲームから消えさせないようにキャンバスの端からバウンドさせることできます。
プログラムの実行の世界では端というものが存在しないので、プログラムは「壁にぶつかったか」という条件を調べなければいけません。

```example
float y = 10;
float vy = 0;

void draw() {
  y = y + vy;     // 縦位置
  vy = vy + 0.1;  // 加速
  if (y > height) {  // 床に当たる条件
    y = height;
    vy = -4;
  }
  background(220);
  ellipse(50, y, 30, 30);
}
```

この例では、円が床に当たっているかどうかという条件を調べています。`y`軸は下向きなので、キャンバスの下の部分のY座標は`height`です。シミュレーションの計算の結果でボールは床下に行きそうの条件は
`y > height`で調べます。

ボールが床に当たったら、ボールに上向きの速度を与えれば、本物のボールのようにバウンドします。

**問題6:** 雪だるまを飛びさせましょう。

```hidden
// SnowmanBounce

int x = 150;
float y;
float vy = -2;

void setup() {
  size(300, 300);
  y = height;
}

void draw() {
  y = y + vy;
  vy = vy + 0.1;
  if (y > height) {
    y = height;
    vy = -4;
  }
  background(220);
  ellipse(x, y-50, 100, 100);
  ellipse(x, y-130, 80, 80);
  ellipse(x, y-190, 60, 60);
}

void keyPressed() {
  if (keyCode == LEFT) {
    x = x - 5;
  }
  if (keyCode == RIGHT) {
      x = x + 5;
  }
}
```

次は[ステプ7][SpringStep7]へ。

# ステップ7: 画像と音 {#ref-SpringStep7}

以前はゲーム作り基本を学びましたが、 楽しいゲームを作るために画像や音が欠かせないものです。 簡単な画像や音のエフェクトの使い方を紹介します。

画像を使うにはそれをロードしなければいけません。 このプログラムでは、`@pjs preload="...";`と`loadImage("...")`
二箇所で画像名を入れて、画像データを用意します。

```prerender
/* @pjs preload="/static/baloon1-170x200.png"; */
PImage img = loadImage("/static/baloon1-170x200.png");
imageMode(CENTER);
image(img, 50, 50, 85, 100);
```

`imageMode`は画像の写し方を設定します。 `CENTER`(中心)を設定すると座標の(x,y)の点に画像の中心が写します。
`CORNER`(角)を設定すると(x,y)の点に左上角が写します。

```render
/* @pjs preload="/static/baloon1-170x200.png"; */
PImage img = loadImage("/static/baloon1-170x200.png");
void setup() {
  size(300, 200);
  frameRate(1);
  textSize(16);
  fill(0);
  textAlign(LEFT, TOP);
  strokeWeight(5);
}
void draw() {
  background(220);
  if (frameCount % 2 == 0) {
    imageMode(CENTER);
    image(img, width/2, height/2, 85, 100);
    text("imageMode(CENTER);", 2, 5);
  } else {
    imageMode(CORNER);
    image(img, width/2, height/2, 85, 100);
    text("imageMode(CORNER);", 2, 5);
  }
  point(width/2, height/2);
  text("(x,y)", width/2, height/2);
}
```

画像をいくつか用意しましたので、[画像リスト][ImageLibrary]でご確認ください。

音の場合も、音のデータを用意する必要があります。`loadSound()`を呼ぶことによって
音のデータを用意します。用意されたデータを`PAudio`の変数に保存しておきます。
用意してから適切なときに`play()`命令を使って再生します。音の場合は、再生は 時間かかりますが、その家にプログラムは実行し続きます。
次のプログラムを実行して、 キャンバス内でクリックしてみてください。

```prerender
PAudio sound = loadSound("/static/meow.ogg");
void mouseClicked() {
  sound.play();
}
void draw() {
  if (sound.isPlaying()) {
    background(220);
    fill(0); textSize(20);
    text("Meow", 5, 20);
  } else {
    background(220);
  }
}
```

音をいくつか用意しましたので、[音のリスト][SoundLibrary]を見てください。

次は[ステップ8][SpringStep8]へ。

# ステップ7: ゲームサンプル {#ref-SpringStep8}

次のプログラムをサンプルとして使って自由自在ゲームを作ってみましょう。 以下に部分ごとに説明あります。

```example
// RocketLandingExample

/* @pjs preload="/static/fire2-134x200.png"; */
/* @pjs preload="/static/rocket-168x300.png"; */
/* @pjs preload="/static/rocket1-168x300.png"; */
PImage fire = loadImage("/static/fire2-134x200.png");
PImage rocket = loadImage("/static/rocket-168x300.png");
PImage rocket_fire = loadImage("/static/rocket1-168x300.png");
PAudio explosion = loadSound("/static/explosion.ogg");
PAudio roar = loadSound("/static/roar.ogg");
PAudio win = loadSound("/static/win.ogg");

float x;
float y;
float vy;

boolean burning = false;
boolean gameOver = false;

void initVars() {
  x = 100;
  y = 10;
  vy = 0;
  gameOver = false;
  burning = false;
}

void setup() {
  size(200, 200);
  frameRate(20);
  imageMode(CENTER);
  initVars();
}

void draw() {
  y = y + vy;
  vy = vy + 0.2;
  
  if (y > height - 30) {
    if (abs(vy) > 3) {
      background(200);
      image(fire, x, y-25, 65, 100);
      explosion.play();
    } else {
      win.play();
    }
    noLoop();
    gameOver = true;
    return;
  }
  
  background(100);
  if (burning) {
    image(rocket_fire, x, y, 34, 60);
    burning = false;
  } else {
    image(rocket, x, y, 34, 60);
  }
}

void burn() {
  burning = true;
  vy -= 2;
  roar.play();
}

void keyPressed() {
  if (gameOver) {
    initVars();
    loop();
    return;
  }
  burn();
}

void mousePressed() {
  if (gameOver) {
    explosion.pause();
    initVars();
    loop();
    return;
  }
  burn();
}
```

次は[サンプルゲーム][Games]を参照。

# ツール {#ref-Tools}

*   [軸を示す][ShowAxes]
*   [座標を示す][ShowCoordinates]
*   [色を選ぶ][ColorTool]
*   [長方形を描く][RectangleTool]
*   [楕円を描く][EllipseTool]
*   [keyCodeを調べる][keyCodes]

# ShowAxes

このプログラムは軸をお見せします。

```prerender
// CanvasAxes
void arrow(int x1, int y1, int x2, int y2) {
  line(x1, y1, x2, y2);
  float x = x2-x1;
  float y = y2-y1;
  float l = sqrt(x*x+y*y);
  x = x / l * 10;
  y = y / l * 10;
  alpha = PI/4;
  line(x2, y2, x2 - x*cos(alpha) + y*sin(alpha), y2 - x*sin(alpha) - y*cos(alpha));
  line(x2, y2, x2 - x*cos(-alpha) + y*sin(-alpha), y2 - x*sin(-alpha) - y*cos(-alpha));
}

arrow(10, 20, 90, 20);
arrow(20, 10, 20, 90);
fill(0);
text("(0,0)", 1, 11);
text("x", 80, 37);
text("y", 30, 85);
```

# ShowCoordinates

このプログラムは座標をお見せします。マウスをキャンバス内で動かしてみてください。

```prerender
// ShowCoordinates
void setup() {
  size(200, 200);
}

void draw() {
  background(220);
  textSize(20);
  fill(0);
  text("("+mouseX+","+mouseY+")", 80, 110);
}
```

# ColorTool

マウスを動かじながら、色を選ぶ

```prerender
// ColorsDemo2
color posToColor(int x, int y) {
  if (x < width/2 && y < height/2) {
    return color((width/2-x)/width*512, (height/2-y)/height*512, 0);
  } else if (x < width/2) {
    return color(220);
  } else if (y < height/2) {
    return color(0, (height/2-y)/height*512, (x-width/2)/width*512);
  } else {
    return color((y-height/2)/height*512, 0, (x-width/2)/width*512);
  }
}

void setup() {
  size(300, 300);
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      set(x, y, posToColor(x, y));
    }
  }

  fill(0);
  textSize(height/20);
  text("(255,0,0)", 5, height/2-5);
  text("(255,255,0)", 5, 20);
  textAlign(RIGHT, TOP);
  text("(0,255,255)", width-5, 2);
  textAlign(CENTER, TOP);
  text("(0,255,0)", width/2, 2);
  textAlign(LEFT, BASELINE);
  fill(255);
  text("(0,0,0)", width/2+2, height/2-2);
  textAlign(RIGHT, BASELINE);
  text("(0,0,255)", width-2, height/2);
  fill(0);
  textAlign(LEFT, BOTTOM);
  text("(255,0,0)", width/2+2, height-2);
  textAlign(RIGHT, BOTTOM);
  text("(255,0,255)", width-2, height-2);
}

void draw() {
  color c = posToColor(mouseX, mouseY);
  noStroke();
  fill(c);
  rect(width/10, 6*height/10, 3*width/10, 3*height/10);
  fill(250);
  rect(width/10, 9*height/10, 3*width/10, height/15);
  fill(0);
  textSize(height/27);
  textAlign(LEFT, BASELINE);
  text("color("+red(c)+","+green(c)+","+blue(c)+")", width/10, height*19/20);
}
```

# EllipseTool

このプログラムは楕円を書く命令をお見せします。キャンバス内でマウス・ドラッグしてみてください。

```prerender
// EllipseTool
void setup() {
  size(200, 200);
}

int x1, y1, x2, y2;
boolean pressed = false;

void draw() {
  background(220);
  if (pressed) {
    x2 = mouseX;
    y2 = mouseY;
  }
  if (x2 != x1) {
    fill(255);
    ellipse(x1, y1, (x2-x1)*2, (y2-y1)*2);
  }
  textSize(18);
  fill(0);
  text("ellipse("+x1+","+y1+","+((x2-x1)*2)+","+((y2-y1)*2)+")", 10, height-10);
}

void mousePressed() {
  if (!pressed) {
    x1 = mouseX;
    y1 = mouseY;
    pressed = true;
  }
}

void mouseReleased() {
  if (pressed) {
    x2 = mouseX;
    y2 = mouseY;
    pressed = false;
  }
}
```

# RectangleTool

このプログラムは長方形を書く命令をお見せします。キャンバス内でマウス・ドラッグしてみてください。

```prerender
// RectangleTool
void setup() {
  size(200, 200);
}

int x1, y1, x2, y2;
boolean pressed = false;

void draw() {
  background(220);
  if (pressed) {
    x2 = mouseX;
    y2 = mouseY;
  }
  if (x2 != x1) {
    fill(255);
    rect(x1, y1, (x2-x1), (y2-y1));
  }
  textSize(20);
  fill(0);
  text("rect("+x1+","+y1+","+(x2-x1)+","+(y2-y1)+")", 10, height-10);
}

void mousePressed() {
  if (!pressed) {
    x1 = mouseX;
    y1 = mouseY;
    pressed = true;
  }
}

void mouseReleased() {
  if (pressed) {
    x2 = mouseX;
    y2 = mouseY;
    pressed = false;
  }
}
```

# 音のリスト {#ref-SoundLibrary}

```prerender
// SoundExample
PAudio sound = loadSound("/static/explosion.ogg");
void mousePressed() {
  sound.play();
}
```

*   `/static/coin.ogg` <audio src="/static/coin.ogg" controls/>
*   `/static/tututun.ogg` <audio src="/static/tututun.ogg" controls/>
*   `/static/didin.ogg` <audio src="/static/didin.ogg" controls/>
*   `/static/rururun.ogg` <audio src="/static/rururun.ogg" controls/>
*   `/static/bells.ogg` <audio src="/static/bells.ogg" controls/>
*   `/static/strings.ogg` <audio src="/static/strings.ogg" controls/>
*   `/static/ugh.ogg` <audio src="/static/ugh.ogg" controls/>
*   `/static/bang.ogg` <audio src="/static/bang.ogg" controls/>
*   `/static/ding.ogg` <audio src="/static/ding.ogg" controls/>
*   `/static/cannon.ogg` <audio src="/static/cannon.ogg" controls/>
*   `/static/growl.ogg` <audio src="/static/growl.ogg" controls/>
*   `/static/explosion.ogg` <audio src="/static/explosion.ogg" controls/>
*   `/static/clicks.ogg` <audio src="/static/clicks.ogg" controls/>
*   `/static/fireworks.ogg` <audio src="/static/fireworks.ogg" controls/>
*   `/static/meow.ogg` <audio src="/static/meow.ogg" controls/>
*   `/static/dog.ogg` <audio src="/static/dog.ogg" controls/>
*   `/static/frog.ogg` <audio src="/static/frog.ogg" controls/>
*   `/static/roar.ogg` <audio src="/static/roar.ogg" controls/>
*   `/static/launch.ogg` <audio src="/static/launch.ogg" controls/>
*   `/static/shot.ogg` <audio src="/static/shot.ogg" controls/>
*   `/static/win.ogg` <audio src="/static/win.ogg" controls/>

# 画像リスト {#ref-ImageLibrary}

```prerender
// ImageExample
/* @pjs preload="/static/baloon1-170x200.png"; */
PImage img = loadImage("/static/baloon1-170x200.png");
imageMode(CENTER);
image(img, 50, 50, 85, 100);
```

*   /static/baloon1-170x200.png
    ![static/baloon1-170x200.png](/static/baloon1-170x200.png)
*   /static/baloon2-158x200.png
    ![/static/baloon2-158x200.png](/static/baloon2-158x200.png)
*   /static/banana-200x113.png
    ![/static/banana-200x113.png](/static/banana-200x113.png)
*   /static/baseball-200x171.png
    ![/static/baseball-200x171.png](/static/baseball-200x171.png)
*   /static/cat1-200x134.png
    ![/static/cat1-200x134.png](/static/cat1-200x134.png)
*   /static/cat2-185x200.png
    ![/static/cat2-185x200.png](/static/cat2-185x200.png)
*   /static/cat3-134x200.png
    ![/static/cat3-134x200.png](/static/cat3-134x200.png)
*   /static/dog1-200x188.png
    ![/static/dog1-200x188.png](/static/dog1-200x188.png)
*   /static/dog2-180x200.png
    ![/static/dog2-180x200.png](/static/dog2-180x200.png)
*   /static/dog3-179x200.png
    ![/static/dog3-179x200.png](/static/dog3-179x200.png)
*   /static/face1-150x200.png
    ![/static/face1-150x200.png](/static/face1-150x200.png)
*   /static/face2-171x200.png
    ![/static/face2-171x200.png](/static/face2-171x200.png)
*   /static/face3-188x200.png
    ![/static/face3-188x200.png](/static/face3-188x200.png)
*   /static/face4-106x200.png
    ![/static/face4-106x200.png](/static/face4-106x200.png)
*   /static/face5-163x200.png
    ![/static/face5-163x200.png](/static/face5-163x200.png)
*   /static/face6-155x200.png
    ![/static/face6-155x200.png](/static/face6-155x200.png)
*   /static/fire1-200x123.png
    ![/static/fire1-200x123.png](/static/fire1-200x123.png)
*   /static/fire2-134x200.png
    ![/static/fire2-134x200.png](/static/fire2-134x200.png)
*   /static/football1-200x200.png
    ![/static/football1-200x200.png](/static/football1-200x200.png)
*   /static/football2-200x200.png
    ![/static/football2-200x200.png](/static/football2-200x200.png)
*   /static/kiwi-200x200.png
    ![/static/kiwi-200x200.png](/static/kiwi-200x200.png)
*   /static/rose-200x161.png
    ![/static/rose-200x161.png](/static/rose-200x161.png)
*   /static/rocket-168x300.png
    ![/static/rocket-168x300.png](/static/rocket-168x300.png)
*   /static/rocket1-168x300.png
    ![/static/rocket1-168x300.png](/static/rocket1-168x300.png)
*   /static/smoke-200x195.png
    ![/static/smoke-200x195.png](/static/smoke-200x195.png)
*   /static/sunflower-130x200.png
    ![/static/sunflower-130x200.png](/static/sunflower-130x200.png)
*   /static/tennisball-200x197.png
    ![/static/tennisball-200x197.png](/static/tennisball-200x197.png)
*   /static/Walker44.png ![/static/Walker44.png](/static/Walker44.png)
*   /static/fuzzy-white-64x64.png
    ![/static/fuzzy-white-64x64.png](/static/fuzzy-white-64x64.png)
*   /static/fuzzy-black-64x64.png
    ![/static/fuzzy-black-64x64.png](/static/fuzzy-black-64x64.png)

# Processing.js 夏期ワークショップ {#ref-workshopSep}

*   [はじめに][WhackACircle0]
*   Step 1: 円が１個
    *   [Step 1.1: 円を描いてみる][WhackACircle11]
    *   [Step 1.2: コメントを書きましょう][WhackACircle12]
    *   [Step 1.3: 様々な色][WhackACircle13]
    *   [Step 1.4: ◯をランダムに表示][WhackACircle14]
    *   [Step 1.5: 円を「動かす」][WhackACircle15]
    *   [Step 1.6: クリックして文字を表示する][WhackACircle16]
    *   [Step 1.7: クリック回数を表示する][WhackACircle17]
    *   [Step 1.8: コードを整理しよう][WhackACircle18]
    *   [Step 1.9: 円をクリックしたらスコアを増やす][WhackACircle19]
*   Step 2: 円が 9 個
    *   [Step 2.1: 9 個の円を一定の場所に表示する][WhackACircle21]
    *   [Step 2.2: 各円を表示するかどうかをランダムに決める][WhackACircle22]
    *   [Step 2.3: 課題][WhackACircle23]
*   迷路を右手法で解く
    *   [1. キャラクタを表示][Maze1]
    *   [2. キャラクターを動かす][Maze2]
    *   [3. 壁の検出][Maze3]
    *   [4. 右手法][Maze4]
    *   [5. ゴールの検出][Maze5]
    *   [6. 完成プログラム][Maze6]
*   最短ルート探し
    *   [1. 空迷路][LabyrinthBlank]
    *   [2. 地図作り][LabyrinthMapper]
    *   [3. 最短の道][LabyrinthSearch]
    *   [4. 道の作り直し][LabyrinthBacktrace]
    *   [5. 完成版][LabyrinthSolver]
*   [索引][index]
*   [デモ][Demos]
*   [ゲーム][Games]

# はじめに {#ref-WhackACircle0}

今回は Scratch のようにブロックでコードを書くプログラミング言語ではなく、文字で書かれたプログラミング言語で、簡単なゲームを作ってみましょう。

このゲームは午前中に Scratch で作った「猫たたき」のように円が現れたり消えたりして、円をクリックできたら得点がもらえるゲームです。

```render
// WhackACircle0
void circle(int x, int y, int r) {
}
int width = 300;
int margin = 50;
int radius = 50;
int step = (width - 2*margin)/2;
void maru(int col, int row) {
  fill(0, 255, 0);
  stroke(255, 0, 0);
  strokeWeight(3);
  ellipse(margin + col*step, margin + row*step, radius, radius);
}
void setup() {
  size(300, 300);
  background(255);
  maru(0, 0);
  maru(1, 0);
  maru(1, 1);
  maru(2, 1);
  maru(0, 2);
  maru(2, 2);
  fill(0);
  textSize(18);
  text("スコア:2", 10, 20);
}
void draw() {
  exit();
}
```

## Processing って何？

Processing は絵などを描けるプログラミング言語です。アプリ開発などで広く使われている Java
というプログラミング言語に近いので、Processing をマスターできたらあと一歩で Java でプログラムを書いて実際のエンジニアになれます。

## Processing で作る <strike>「猫たたき」</strike> 「◯たたき」

では、本番に入って Processing のコードを書いてみましょう！

## Step 1: 円が１個

最初のステップでは円１個だけをランダムに表示し、ユーザーがクリックできたらスコアを１増やします。

[Step 1.1: 円を描いてみる][WhackACircle11]

# Step 1.1: 円を描いてみる {#ref-WhackACircle11}

[前に戻る][WhackACircle0]

まず円を描いてみましょう！以下のコードを入力して実行したら、円が描かれます。

```prerender
// Circle
size(100, 100);
ellipse(50, 50, 10, 10);
```

このプログラムには命令が２つ含まれています。最初の命令は `size(100, 100);` です。これはキャンバスの大きさを 100 × 100
にする命令です。これを指定して実行すると、四角いキャンバスが現れます。括弧の中に数字が 2
つ入っています。この数字を引数と呼びます。値を変えて実行すると、違うサイズのキャンバスが現れます。例えば、`size(500, 300);`
にすると、横長のキャンバスができたり、`size(200, 600);` にすると、縦長のキャンバスができます。

次の命令は `ellipse(50, 50, 10, 10);` です。これはキャンバスに円を描く命令です。この命令には 4 つの引数が必要です。最初の 2
つは円の中心点の位置を指定します。値を変えて実行し、円の位置を動かしてみましょう。最後の 2
つの引数は円の横と縦の直径を指定します。英語がわかる人は気づいたかもしれませんが、ellipse
という単語は円という意味ではなくて、楕円という意味です。円は必ず横と縦の直径が等しいですが、この命令で 2
つの値を違う大きさにすると円ではなく、楕円が描かれます。値を変えて実行してみましょう。

この 2 つの命令には行の最後に `;` **セミコロン**
があります。セミコロンは命令が終わったことを意味します。これがないと実行できたり、できなかったり、またはプログラムが思った通りに動かない場合があります。また、セミコロンを書き忘れると、赤い線が出てきます。この赤い線はコードの中でどこかで書き間違えているという意味なので、赤い線を見たら間違いを探してコードを修正してください。

![Missing semicolon warning](/static/missing_semicolon.png)

[Step 1.2: コメントを書きましょう][WhackACircle12]

# Step 1.2: コメントを書きましょう {#ref-WhackACircle12}

[前に戻る][WhackACircle11]

以下のコードを入力して実行してみましょう。

```example
// WhackACircle11
// キャンバスの大きさを 300 x 300 にする
size(300, 300);
// 中心座標が (150, 150)、直径が 10 の円を描く
ellipse(150, 150, 10, 10);
```

今回のコードには日本語の説明が入っています。これを**コメント**と呼びます。コメントに書かれた内容はコンピュータは実行しません。コメントは、コードを説明するためのもので、他人にコードを共有するときに相手の人が速く理解できるように記述します。誰かとコードを共有しなくてもコードが長くなると、自分でも１行１行の意味を忘れてしまうこともあるので、コメントをつける習慣を身につけましょう。

[Step 1.3: 様々な色][WhackACircle13]

# Step 1.3: 様々な色 {#ref-WhackACircle13}

[前に戻る][WhackACircle12]

色を変えてみましょう。以下のコードを入力して実行してみましょう。

```example
// WhackACircle12
// キャンバスの大きさを 300 × 300 にする
size(300, 300);
// キャンバスを白で塗ります
background(255, 255, 255);
// 円の中身を緑色にする
fill(0, 255, 0);
// 円周を赤にする
stroke(255, 0, 0);
// 線の太さを 2 にする
strokeWeight(2);
// 中心座標が (150, 150)、直径が 40 の円を描く
ellipse(150, 150, 40, 40);
```

各命令の意味はコメントで説明されています。ここで注目してほしいのは色の指定方法です。すべての色に関する命令は 3
つの数値を必要とします。これはパソコンやTVで使用される画面の色の表示のしかたに由来します。画面で表示される色は３つの原色から表現されています。この原色は光の原色で、**赤**、**緑**、**青**で、RGB
(Red, Green, Blue) と呼ばれています。それぞれの値は0 から 255 まで指定できます。すべての値が 0 の場合は黒で、すべての値が 255
の場合は白になります。

![Color chart](/static/colors.png)

[Step 1.4: ◯をランダムに表示][WhackACircle14]

# Step 1.4: ◯をランダムに表示 {#ref-WhackACircle14}

[前に戻る][WhackACircle13]

円をランダムな場所に表示します。以下のコードを入力して数回実行してみましょう。

```example
// RandomCircle
// キャンバスの大きさを 300 × 300 にする
size(300, 300);
// キャンバスを白で塗る
background(255, 255, 255);
// 円の中身を緑色にする
fill(0, 255, 0);
// 円周を赤にする
stroke(255, 0, 0);
// 線の太さを 2 にする
strokeWeight(2);

// ランダムな座標を生成する
int x = random(0, 300);
int y = random(0, 300);

// 中心座標が (x, y)、直径が 40 の円を描く
ellipse(x, y, 40, 40);
```

実行される度に円の場所が変わることがわかります。そこで `int x = random(0, 300);`
という命令に注目してください。この命令は変数を定義します。変数はデータを一時的に保存するものです。Scratch
ではこのように変数を作って様々なブロックが現れますね。

![Scratch variable](/static/scratch_variable.png)

変数を初めて使うときには、変数を「**定義**」して、変数の名前・型・初期値を決めます。名前と型は定義した後で変更できませんが、値は後から変更できます。

    int x = random(0, 300);

上記の文は、 `int`（整数）型の変数 `x` を定義し、初期値を `random(0, 300)`、つまり 0 から 300 までの乱数とします。`x` と
`y` の変数は円を描く命令に使われます。円の中心座標が今までの 150, 150 のかわりに `x`, `y` となり、命令が `ellipse(x, y,
40, 40);` になっています。

[Step 1.5: 円を「動かす」][WhackACircle15]

# Step 1.5: 円を「動かす」 {#ref-WhackACircle15}

[前に戻る][WhackACircle14]

今までは円を一回描くだけですが、次は円を繰り返しランダムな場所に描いてみます。以下のコードを入力して実行してみましょう。

```example
// WhackACircle15
// 初期化・一回だけ実行される
void setup() {
  // キャンバスの大きさを 300 × 300 にする
  size(300, 300);
  // 滑らかに描く
  smooth();
  // 1 秒間に 30 回描く
  frameRate(30);
}

// ずっと実行される
void draw() {
  // キャンバスを白で塗る
  background(255, 255, 255);
  // 円の内部を緑色で塗る
  fill(0, 255, 0);
  // 円周を赤色で描く
  stroke(255, 0, 0);
  // 線の太さを 2 にする
  strokeWeight(2);

  // ランダムな座標を生成する
  int x = random(0, 300);
  int y = random(0, 300);

  // 中心座標が (x, y)、直径が 40 の円を描く
  ellipse(x, y, 40, 40);
}
```

実行すると、円が高速でランダムな場所で現れます。今回のプログラムには、`void setup() { ... }` と `void draw() { ...
}` という書き方が出てきます。これらは**メソッド**と呼びます。メソッドは複数の命令をまとめて、１個の命令として使えるようにします。

Scratch では、各ブロック（例：ペンを下ろす）がメソッドだと考えても間違いではないでしょう。Processing
でメソッドを定義することは、Scratch でブロック定義を使用して他のブロックをまとめるのに似ています。次の例を見てみましょう。

![Scratch method](/static/scratch_method.png)

Scratch と同様、Processing でも `size(300, 300);` などの命令がメソッドの呼び出しです。

Step 1.5 の Processing のプログラムでは、`setup` と `draw`
というメソッドを定義しています。これは特別なメソッドです。`setup` はプログラムが始まったらすぐに 1 回だけ実行されます。`draw` は
`setup` が実行されたあとに、ずっと実行されます。定義文の構成を説明します。最初の `void`
はこのメソッドを実行しても何の値も返さないという意味を宣言しています。値を返すメソッドもあり、`random` はその例の 1
つで指定された範囲からランダムな値を返します。

これから、値の返すメソッドを定義していきます。メソッド名のあとの括弧には何も入っていない `setup()`
のようなメソッドは引数を取りません。引数を取るメソッドも続きのステップで定義します。

さて、問題です。今のプログラムでは円が高速で動いています。もっとゆっくり動かすことができるでしょうか？コードとコメントを読んで、表示の頻度を 1 秒に 1
回に変えましょう。

[Step 1.6: クリックして文字を表示する][WhackACircle16]

# Step 1.6: クリックして文字を表示する {#ref-WhackACircle16}

[前に戻る][WhackACircle15]

以下のコードを入力して実行してみましょう。

```example
// WhackACircle16
void setup() {
  size(300,300);
  framerate(1);
}

// マウスをクリックしたら実行される
void mouseClicked() {
  // 文字の色を黒にする
  fill(0, 0, 0);
  // 文字の大きさを 30 にする
  textSize(30);
  // 座標 (150, 150) に「こんにちは」という文字を表示
  text("こんにちは", 150, 150);
}
```

上記のプログラムでは `mouseClicked()`
というメソッドが定義されています。これも特別なメソッドで、キャンバスにマウスでクリックした際にだけこのメソッドが実行されます。このようなきっかけを**イベント**と呼びます。そして、イベントが起こると実行されるメソッドを**イベントハンドラ**と呼びます。

[Step 1.7: クリック回数を表示する][WhackACircle17]

# Step 1.7: クリック回数を表示する {#ref-WhackACircle17}

[前に戻る][WhackACircle16]

以下のコードを入力して実行してみましょう。

```example
// WhackACircle17
int score = 0;

void setup() {
  size(300,300);
  background(255, 255, 255);
  frameRate(1);
}

void draw() {
  // キャンバスを白で塗る
  background(255, 255, 255);
  // 文字の色を黒にする
  fill(0, 0, 0);
  // 文字の大きさを 15 にする
  textSize(15);
  // 座標 (10, 20) にスコアを表示
  text("スコア: " + str(score), 10, 20);
}

// マウスをクリックしたら実行されるイベントハンドラ
void mouseClicked() {
  // score の値を増やす
  score = score + 1;
}
```

上記のプログラムはメソッドの外で `score` という変数を定義しています。そして、マウスをクリックするたびにその値を 1
ずつ増やして表示します。値を増やす命令は、`score = score + 1`
と数学的にはありえない等式のようですが、これは等式ではなくて右の値を左の変数に代入する命令です。

[Step 1.8: コードを整理しよう][WhackACircle18]

# Step 1.8: コードを整理しよう {#ref-WhackACircle18}

[前に戻る][WhackACircle17]

以下のコードを入力して実行してみましょう。

```example
// WhackACircle18
// 円の中心の座標
int x;
int y;

// 円の半径
int radius = 20;

// スコアを初期化
int score = 0;

// 初期化・一回だけ実行される
void setup() {
  // キャンバスの大きさを 300 × 300 にする
  size(300, 300);
  // キャンバスを白で塗ります
  background(255, 255, 255);
  // 滑らかに描く
  smooth();
  // 1 秒間、1 回描く
  frameRate(1);
}

// 座標 (x, y) に円を描く
void drawCircle(int x, int y) {
  // 円の中身を緑色にする
  fill(0, 255, 0);
  // 円周を赤にする
  stroke(255, 0, 0);
  // 線の太さを 2 にする
  strokeWeight(2);
  // 中心座標が (x, y)、直径が radius * 2 の円を描く
  ellipse(x, y, radius * 2, radius * 2);
}

// スコアを表示
void drawScore() {
  // 文字の色を黒にする
  fill(0, 0, 0);
  // 文字の大きさを 15 にする
  textSize(15);
  // スコアを文字にして、座標 (20, 40) に表示する
  text("スコア: " + str(score), 20, 40);
}

// ずっと実行される
void draw() {
  // キャンバスを白で塗ります
  background(255, 255, 255);
  // ランダムな座標を生成する
  x = random(0, 300);
  y = random(0, 300);
  // 中心座標が (x, y) の円を描く
  drawCircle(x, y);
  // スコアの文字を表示する
  drawScore();
}

// マウスをクリックしたら実行されるイベントハンドラ
void mouseClicked() {
  // score の値を増やす
  score = score + 1;
}
```

上記は円を描くプログラムとスコアを表示するプログラムをあわせたものです。そこにコードをまとめるために `drawCircle` と `drawScore`
というメソッドを定義しています。この 2 つのメソッドの内容を `draw` に直接書くと、長くなって分かりにくくなります。そこで
2つの別々のメソッドにまとめています。

この状態ではどこをクリックしてもスコアが増えてしまいます。次は、円をクリックした場合にだけスコアが増えるようにコードを変更してみましょう。

[Step 1.9: 円をクリックしたらスコアを増やす][WhackACircle19]

# Step 1.9: 円をクリックしたらスコアを増やす {#ref-WhackACircle19}

[前に戻る][WhackACircle18]

mouseClicked メソッドのコードを次のように書き換えて実行してみましょう。

    // ユーザーがマウスをクリックしたら実行されるイベントハンドラ
    void mouseClicked() {
      // 円の中心点とマウスをクリックした場所との距離が radius より小さかったら
      if (dist(x, y, mouseX, mouseY) < radius) {
        // score の値を増やす
        score = score + 1;
      }
    }

ここでは条件文を使っています。**条件文**の構成は `if( ... ) { ... }`
です。括弧の中に条件を書きます。条件が満たされる場合、中括弧の中のコードが実行されます。

上記で使われている条件はコメントで説明されています。`dist()` メソッドは Processing でもともと定義されているメソッドで、 2
つの点の間の距離を計算します。

これで最初のステップが完成です。

今までの完成プログラムはこちらで確認できます。

```hidden
// WhackACircle19
// 円の中心の座標
int x;
int y;

// 円の半径
int radius = 20;

// スコアを初期化
int score = 0;

// 初期化・一回だけ実行される
void setup() {
  // キャンバスの大きさを 300 × 300 にする
  size(300, 300);
  // キャンバスを白で塗ります
  background(255, 255, 255);
  // 滑らかに描く
  smooth();
  // 1 秒間、1 回描く
  frameRate(1);
}

// 座標 (x, y) に円を描く
void drawCircle(int x, int y) {
  // 円の中身を緑色にする
  fill(0, 255, 0);
  // 円周を赤にする
  stroke(255, 0, 0);
  // 線の太さを 2 にする
  strokeWeight(2);
  // 中心座標が (x, y)、直径が radius * 2 の円を描く
  ellipse(x, y, radius * 2, radius * 2);
}

// スコアを表示
void drawScore() {
  // 文字の色を黒にする
  fill(0, 0, 0);
  // 文字の大きさを 15 にする
  textSize(15);
  // スコアを文字にして、座標 (20, 40) に表示する
  text("スコア: " + str(score), 20, 40);
}

// ずっと実行される
void draw() {
  // キャンバスを白で塗ります
  background(255, 255, 255);
  // ランダムな座標を生成する
  x = random(0, 300);
  y = random(0, 300);
  // 中心座標が (x, y) の円を描く
  drawCircle(x, y);
  // スコアの文字を表示する
  drawScore();
}

// ユーザーがマウスをクリックしたら実行されるイベントハンドラ
void mouseClicked() {
  // 円の中心点とマウスをクリックした場所との距離が radius より小さかったら
  if (dist(x, y, mouseX, mouseY) < radius) {
    // score の値を増やす
    score = score + 1;
  }
}
```

## Step 2: 円が 9 個

円を９個に増やして、表示するかどうかをランダムに変えてみます。

[Step 2.1: 9 個の円を一定の場所に表示する][WhackACircle21]

# Step 2.1: 9 個の円を一定の場所に表示する {#ref-WhackACircle21}

[前に戻る][WhackACircle19]

コードを次のように書き換えて実行してみましょう。 `circleX` と `circleY` は新しいメソッドです。古い `draw`
メソッドは消してください。

```
// WhackACircle21
// i 番目の円の x 座標を返す (iは円の番号を表す0から8までの整数)
int circleX(int i) {
  return (int)(i / 3) * 100 + 50;
}
// i 番目の円の y 座標を返す (iは円の番号を表す0から8までの整数)
int circleY(int i) {
  return (i % 3) * 100 + 50;
}

// ずっと実行される
void draw() {
  // キャンバスを白で塗る
  background(255, 255, 255);

  // i を 0 から 8 まで繰り返す
  int i = 0;
  while (i < 9) {
    // 座標 (circleX(i), circleY(i)) に円を描く
    drawCircle(circleX(i), circleY(i));
    // 次の円に移る
    i = i + 1;
  }

  // スコアの文字を表示する
  drawScore();
}
```

上記のコードは 9 個の円を描きます。円は 0 番から 8 番までの番号にします。各円の x 座標と y 座標はそれぞれ `circleX` と
`circleY` で計算します。`draw`
メソッド内では、`while`-ループを使って円を描きます。これは繰り返しを意味します。`while`-文の構成は `while( ... ) { ... }`
です。条件分岐の `if`
に近いですが、条件が満たされる限り中括弧のコードが永遠に実行されます。このようなプログラムを書くときには、ループからいつか出るように条件を設定する注意をしなければなりません。上記のコードでは、最初は
`i` を 0 に設定して、中括弧の最後のコードで 1 ずつ `i` を増やしています。

今までの完成プログラムはこちらで確認できます。

```hidden
// WhackACircle21
// 円の中心の座標
int x;
int y;

// 円の半径
int radius = 20;

// スコアを初期化
int score = 0;

// 初期化・一回だけ実行される
void setup() {
  // キャンバスの大きさを 300 × 300 にする
  size(300, 300);
  // キャンバスを白で塗ります
  background(255, 255, 255);
  // 滑らかに描く
  smooth();
  // 1 秒間、1 回描く
  frameRate(1);
}

// 座標 (x, y) に円を描く
void drawCircle(int x, int y) {
  // 円の中身を緑色にする
  fill(0, 255, 0);
  // 円周を赤にする
  stroke(255, 0, 0);
  // 線の太さを 2 にする
  strokeWeight(2);
  // 中心座標が (x, y)、直径が radius * 2 の円を描く
  ellipse(x, y, radius * 2, radius * 2);
}

// スコアを表示
void drawScore() {
  // 文字の色を黒にする
  fill(0, 0, 0);
  // 文字の大きさを 15 にする
  textSize(15);
  // スコアを文字にして、座標 (10, 20) に表示する
  text("スコア: " + str(score), 10, 20);
}

// i 番目の円の x 座標を返す (iは円の番号を表す0から8までの整数)
int circleX(int i) {
  return (int)(i / 3) * 100 + 50;
}
// i 番目の円の y 座標を返す (iは円の番号を表す0から8までの整数)
int circleY(int i) {
  return (i % 3) * 100 + 50;
}

// ずっと実行される
void draw() {
  // キャンバスを白で塗る
  background(255, 255, 255);

  // i を 0 から 8 まで繰り返す
  int i = 0;
  while (i < 9) {
    // 座標 (circleX(i), circleY(i)) に円を描く
    drawCircle(circleX(i), circleY(i));
    // 次の円に移る
    i = i + 1;
  }

  // スコアの文字を表示する
  drawScore();
}

// ユーザーがマウスをクリックしたら実行されるイベントハンドラ
void mouseClicked() {
  // 円の中心点とマウスをクリックした場所との距離が radius より小さかったら
  if (dist(x, y, mouseX, mouseY) < radius) {
    // score の値を増やす
    score = score + 1;
  }
}
```

[Step 2.2: 各円を表示するかどうかをランダムに決める][WhackACircle22]

# Step 2.2: 各円を表示するかどうかをランダムに決める {#ref-WhackACircle22}

[前に戻る][WhackACircle21]

コードを次のように書き換えて実行してみましょう。

```
// WhackACircle22
// 円がそれぞれ現れているかを記憶する
boolean[] shown = new boolean[9];

// ずっと実行される
void draw() {
  // キャンバスを白で塗る
  background(255, 255, 255);

  // i を 0 から 8 まで繰り返す
  int i = 0;
  while (i < 9) {
    // 50% の確率で表示される
    if (random(100) < 50) {
      // i 番の円を表示する
      shown[i] = true;
      drawCircle(circleX(i), circleY(i));
    } else {
      // i 番の円を表示しない
      shown[i] = false;
    }
    i = i + 1;
  }

  // スコアの文字を表示する
  drawScore();
}

// マウスをクリックしたら実行されるイベントハンドラ
void mouseClicked() {
  int i = 0;
  while (i < 9) {
    // 円の中心点とマウスをクリックした場所との距離が radius より小さかったら
    if (shown[i] &&
        dist(circleX(i), circleY(i), mouseX, mouseY) < radius) {
      // score の値を増やす
      score = score + 1;
    }
    i = i + 1;
  }
}
```

上記のコードでは、各円が表示されているかを記憶する変数を用意します。メソッドの外の定義文は以下のようになっています。

    boolean[] shown = new boolean[9];

これは今まで違う変数の種類です。`boolean` は真理値型を指します。値が `true`（真） あるいは `false`（偽）の 2
つだけです。また`boolean` のあとの `[]` はこの変数を配列に定義する意味をします。配列は 1
つの変数で複数の値を記憶できるような変数です。そして、配列のサイズは初期値の `new boolean[9]` で指定しています。サイズは 9 で番号は 0
から 8 までになっています。

この配列は `draw` の中で値が決まります。そして、`mouseClicked` の中で値を使っています。

これでプログラムが完成です！実行して遊んでみてください。

```hidden
// WhackACircle22
// 円の中心の座標
int x;
int y;

// 円の半径
int radius = 20;

// スコアを初期化
int score = 0;

// 初期化・一回だけ実行される
void setup() {
  // キャンバスの大きさを 300 × 300 にする
  size(300, 300);
  // キャンバスを白で塗ります
  background(255, 255, 255);
  // 滑らかに描く
  smooth();
  // 1 秒間、1 回描く
  frameRate(1);
}

// 座標 (x, y) に円を描く
void drawCircle(int x, int y) {
  // 円の中身を緑色にする
  fill(0, 255, 0);
  // 円周を赤にする
  stroke(255, 0, 0);
  // 線の太さを 2 にする
  strokeWeight(2);
  // 中心座標が (x, y)、直径が radius * 2 の円を描く
  ellipse(x, y, radius * 2, radius * 2);
}

// スコアを表示
void drawScore() {
  // 文字の色を黒にする
  fill(0, 0, 0);
  // 文字の大きさを 15 にする
  textSize(15);
  // スコアを文字にして、座標 (10, 20) に表示する
  text("スコア: " + str(score), 10, 20);
}

// i 番目の円の x 座標を返す (iは円の番号を表す0から8までの整数)
int circleX(int i) {
  return (int)(i / 3) * 100 + 50;
}
// i 番目の円の y 座標を返す (iは円の番号を表す0から8までの整数)
int circleY(int i) {
  return (i % 3) * 100 + 50;
}

// 円がそれぞれ現れているかを記憶する
boolean[] shown = new boolean[9];

// ずっと実行される
void draw() {
  // キャンバスを白で塗る
  background(255, 255, 255);

  // i を 0 から 8 まで繰り返す
  int i = 0;
  while (i < 9) {
    // 50% の確率で表示される
    if (random(100) < 50) {
      // i 番の円を表示する
      shown[i] = true;
      drawCircle(circleX(i), circleY(i));
    } else {
      // i 番の円を表示しない
      shown[i] = false;
    }
    i = i + 1;
  }

  // スコアの文字を表示する
  drawScore();
}

// マウスをクリックしたら実行されるイベントハンドラ
void mouseClicked() {
  int i = 0;
  while (i < 9) {
    // 円の中心点とマウスをクリックした場所との距離が radius より小さかったら
    if (shown[i] &&
        dist(circleX(i), circleY(i), mouseX, mouseY) < radius) {
      // score の値を増やす
      score = score + 1;
    }
    i = i + 1;
  }
}
```

[Step 2.3: 課題][WhackACircle23]

# Step 2.3: 課題 {#ref-WhackACircle23}

[前に戻る][WhackACircle22]

このプログラムはまだまだ改良できます。次の点を直す方法を考えて実装してみてください。

*   円をクリックしてもすぐにスコアが更新されません。すぐにスコアが更新されるように改良してみましょう。
*   クリックして円に当たらなかった際、スコアをマイナスしてみましょう。
*   1 秒間に何回も円をクリックしてスコアを増やせてしまいます。円をクリックしたらその円がすぐに消えるなどの対策を実装してみましょう。

[前に戻る][WhackACircle22]

# 1. キャラクターを表示 {#ref-Maze1}

まずは迷路を表示しましょう。 下にある「読み込む」ボタンを押してから画面の左上にある 「実行」ボタンをおしましょう。

```example
// Maze1
/* @pjs preload="/static/labyrinth1.png"; */
PImage imgLabyrinth = loadImage("/static/labyrinth1.png");
size(360, 360);  // キャンバスの大きさの設定
image(imgLabyrinth, 1, 1, 360, 360); // 迷路の表示
```

そして、キャラクターを表示しましょう。キャラクターはマウスのカーソル のところに表示されます。Processing.jsでは画像はスクラッチのスプライトのよう
ではなく、スタンプのようなものです。なので、もともとの背景を壊さないように [get()]を使って画像を保存して、あと背景を回復をしなければなりません。

```example
// Maze1
/* @pjs preload="/static/labyrinth1.png"; */
/* @pjs preload="/static/Walker44.png"; */
PImage imgLabyrinth = loadImage("/static/labyrinth1.png");
PImage imgWalker = loadImage("/static/Walker44.png");
void setup() {
  size(360, 360);  // キャンバスの大きさの設定
  image(imgLabyrinth, 1, 1, 360, 360); // 迷路の表示
  imageMode(CENTER);
}

// キャラクターの大きさ、ピクセル単位
int s = 44;
// キャラクターの座標。
int x = 176, y = 314;
PImage imgSave = null;
void draw() {
  if (imgSave != null) {
    image(imgSave, x, y, s, s);
  }
  x = mouseX;
  y = mouseY;
  imgSave = get(x-s/2, y-s/2, s, s);
  image(imgWalker, x, y, s, s);
}
```

次は[2. キャラクターを動かす][Maze2]

# 2. キャラクターを動かす {#ref-Maze2}

[前に戻る][Maze1]

キャラクターを動かすために、次のコードを足してみましょう。

    // 進む方向
    int dx = 0;
    int dy = -1;

    void draw() {  // この関数は繰り返し呼ばれている.
      image(imgWalker, x, y);
      x += dx;
      y += dy;
    }

結果はこのようなスケッチになります。

```hidden
// Maze2
/* @pjs preload="/static/labyrinth1.png"; */
/* @pjs preload="/static/Walker44.png"; */
PImage imgLabyrinth = loadImage("/static/labyrinth1.png");
PImage imgWalker = loadImage("/static/Walker44.png");
void setup() {
  size(360, 360);  // キャンバスの大きさの設定
  image(imgLabyrinth, 1, 1, 360, 360); // 迷路の表示
  imageMode(CENTER);
}

// キャラクターの大きさ、ピクセル単位
int s = 44;
// キャラクターの座標
int x = 176, y = 314;

// 進む方向
int dx = 0;
int dy = -1;

PImage imgSave = null;
void draw() {  // この関数は繰り返し呼ばれている.
  if (imgSave != null) {
    image(imgSave, x, y, s, s);
  }
  x += dx;
  y += dy;
  imgSave = get(x-s/2, y-s/2, s, s);
  image(imgWalker, x, y);
}
```

キャラクターは壁を無視して動いてます。 `imgSave =
get(...)`や`image(imgSave,...)`をしなければ、キャラクターは壁に当たると壁を消して穴を開けてしまいます。
これは、実際には壁ではなくてただの背景画像が表示されているだけだからです。壁が実際にあるように見せるのが、プログラマの仕事です。

次は[3. 壁の検出][Maze3]

# 3. 壁の検出 {#ref-Maze3}

[前に戻る][Maze2]

壁を検出するには[get()]関数を利用して、指定した位置のピクセルの色を調べます。[imageMode]([CENTER])の設定によって、キャラクターの位置はスタンプの中心を示すようになるので、キャラクターの進行方向の前の位置を調べましょう。

その前に、dx,
dyには常に０か１の値しか与えないようにします。たとえば、下は（０，１）、上は（０，−１）、右は（１，０）、左は（−１，０）です。最初の設定では上方向にしましょう。

    int dx = 0;
    int dy = -1;

こうしておくと、 `(x+(s/2)*dx, y+(s/2)*dy)`
は常にキャラクターのちょうど前のピクセルを指すようになります。ここに３ピクセル足せば、キャラクターの少し前の位置になります。これが壁に当たったら[noLoop()]によってプログラムの実行を止めましょう。

    boolean wallAhead() {
      // キャラクターの３ピクセル前に調べよう.
      color c = get(x+dx*(s/2+3), y+dy*(s/2+3));
    　// 黒を検出しよう。
      return brightness(c) < 50;
    }

    void draw() {
      ...
      if (wallAhead()) {
        noLoop(); // 実行を停止する
      }
      ...
    }

スケッチこんな漢字になったでしょうか？

```hidden
// Maze3
/* @pjs preload="/static/labyrinth1.png"; */
/* @pjs preload="/static/Walker44.png"; */
PImage imgLabyrinth = loadImage("/static/labyrinth1.png");
PImage imgWalker = loadImage("/static/Walker44.png");
void setup() {
  size(360, 360);  // キャンバスの大きさの設定
  image(imgLabyrinth, 1, 1, 360, 360); // 迷路の表示
  imageMode(CENTER);
}

// キャラクターの大きさ、ピクセル単位
int s = 44;

// キャラクターの座標
int x = 176, y = 314;

// 進む方向
int dx = 0;
int dy = -1;

PImage imgSave = null;
void draw() {  // この関数は繰り返し呼ばれている.
  if (imgSave != null) {
    image(imgSave, x, y, s, s);
  }
  if (wallAhead()) {
    noLoop(); // 実行を停止する
  }
  x += dx;
  y += dy;
  imgSave = get(x-s/2, y-s/2, s, s);
  image(imgWalker, x, y);
}

boolean wallAhead() {
  // キャラクターの３ピクセル前に調べよう.
  color c = get(x+dx*(s/2+3), y+dy*(s/2+3));
　// 黒を検出しよう。
  return brightness(c) < 50;
}
```

止まる代わりにその場で回ってみましょう。

    void turnLeft() {
      int tmp = dx;
      dx = dy;
      dy = -tmp;
    }

    void draw() {
      ...
      if (wallAhead()) {
        turnLeft();
      }
      ...
    }

ついでなので、前に動かす指示を関数としてまとめましょう。

    void moveForward() {
      x += dx;
      y += dy;
    }

    void draw() {
      ...
      if (wallAhead()) {
        turnLeft();
      }
      moveForward();
      ...
    }

完成スケッチはこちらです。

```hidden
// Maze3
/* @pjs preload="/static/labyrinth1.png"; */
/* @pjs preload="/static/Walker44.png"; */
PImage imgLabyrinth = loadImage("/static/labyrinth1.png");
PImage imgWalker = loadImage("/static/Walker44.png");
void setup() {
  size(360, 360);  // キャンバスの大きさの設定
  image(imgLabyrinth, 1, 1, 360, 360); // 迷路の表示
  imageMode(CENTER);
}

// キャラクターの大きさ、ピクセル単位
int s = 44;

// キャラクターの座標
int x = 176, y = 314;

// 進む方向
int dx = 0;
int dy = -1;

PImage imgSave = null;
void draw() {  // この関数は繰り返し呼ばれている.
  if (imgSave != null) {
    image(imgSave, x, y, s, s);
  }
  if (wallAhead()) {
    turnLeft();
  }
  moveForward();
  imgSave = get(x-s/2, y-s/2, s, s);
  image(imgWalker, x, y);
}

boolean wallAhead() {
  // キャラクターの３ピクセル前に調べよう.
  color c = get(x+dx*(s/2+3), y+dy*(s/2+3));
　// 黒を検出しよう。
  return brightness(c) < 50;
}

void moveForward() {
  x += dx;
  y += dy;
}

void turnLeft() {
  int tmp = dx;
  dx = dy;
  dy = -tmp;
}
```

これだけでもキャラクターが少しは賢くみえてきましたが、動かしているとすぐに無限ループに入ってしまいます。

次は[4. 右手法][Maze4]

# 4. 右手法 {#ref-Maze4}

[前に戻る][Maze3]

右手法を実装するには、右側の壁を検出し、壁がない場合は右側に曲がることが必要になります。だいたいこのような感じでしょうか。

    void turnRight() {
      int tmp = dx;
      dx = -dy;
      dy = tmp;
    }

    boolean wallRight() {
      int rx = -dy;
      int ry = dx;
      color c = get(x + rx*(s/2+4), y + ry*(s/2+4));
      return brightness(c) < 50;
    }

    void draw() {
      ...
      if (!wallRight()) {
        turnRight();
      } else if (wallAhead()) {
        turnLeft();
      }
      moveForward();
      ...
    }

上のプログラムは一回右に曲がってしまうと、キャラクターが無限ループに入ってしまうため上手く動きません。原因は右側を検出する関数が1ピクセルしか確認していないため、キャラクター全体が曲がった先に入れないときにも
true を返してしまうからです。

キャラクターのサイズに合わせて検出してみましょう。

    boolean wallAhead() {
      boolean wallFound = false;
      int rx = -dy;
      int ry = dx;
      for (int i = -s/2-1; i < s/2+1; i++) {
        color c = get(x+dx*(s/2+3)+rx*i, y+dy*(s/2+3)+ry*i);
        wallFound = wallFound || brightness(c) < 50;
      }
      return wallFound;
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

それでも他にも問題が残ってます。右に空き通路を検出すると、キャラクターはまた無限ループに入ってしまいます。今度の原因は、右に曲がったすぐ後に右側に壁がないとキャラクターがすぐにまた右に曲がってしまうことです。これを直すには、曲がってから数ピクセルはまっすぐに進む必要があります。

    void draw() {
      if (!wallRight()) {
        turnRight();
        moveForward();
        moveForward();
      } else if (wallAhead()) {
        turnLeft();
      }
      moveForward();
    }

完成スケッチこちらです。

```hidden
// Maze4
/* @pjs preload="/static/labyrinth1.png"; */
/* @pjs preload="/static/Walker44.png"; */
PImage imgLabyrinth = loadImage("/static/labyrinth1.png");
PImage imgWalker = loadImage("/static/Walker44.png");
void setup() {
  size(360, 360);  // キャンバスの大きさの設定
  image(imgLabyrinth, 1, 1, 360, 360); // 迷路の表示
  imageMode(CENTER);
}

// キャラクターの大きさ、ピクセル単位
int s = 44;

// キャラクターの座標
int x = 176, y = 314;

// 進む方向
int dx = 0;
int dy = -1;

PImage imgSave = null;
void draw() {  // この関数は繰り返し呼ばれている.
  if (imgSave != null) {
    image(imgSave, x, y, s, s);
  }
  if (!wallRight()) {
    turnRight();
    moveForward();
    moveForward();
  } else if (wallAhead()) {
    turnLeft();
  }
  moveForward();
  imgSave = get(x-s/2, y-s/2, s, s);
  image(imgWalker, x, y);
}

boolean wallAhead() {
  boolean wallFound = false;
  int rx = -dy;
  int ry = dx;
  for (int i = -s/2-1; i < s/2+1; i++) {
    color c = get(x+dx*(s/2+3)+rx*i, y+dy*(s/2+3)+ry*i);
    wallFound = wallFound || brightness(c) < 50;
  }
  return wallFound;
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

void moveForward() {
  x += dx;
  y += dy;
}

void turnLeft() {
  int tmp = dx;
  dx = dy;
  dy = -tmp;
}

void turnRight() {
  int tmp = dx;
  dx = -dy;
  dy = tmp;
}
```

ここまでのプログラムで、キャラクターは迷路の中をうまく動くはずです。まだ問題がある場合、以下の点を確認しましょう。

*   `dx`, `dy`には-1/0/1の以外の値を与えない。
*   右側に空き通路を検出する関数はキャラクターが確実に入れる広さか確認する。

次は[5. ゴールの判定][Maze5]

# 5. ゴールの判定 {#ref-Maze5}

[前に戻る][Maze4]

最後にゴールの判定をする機能を加えてみましょう。ゴールの判定は壁の検出に似ていますが、黒の代わりに緑か調べなければなりません。

    boolean reachedGoal() {
      color c = get(x+dx*(s/2+3), y+dy*(s/2+3));
      return red(c) < 50 && green(c) > 50;
    }

    void draw() {
      ...
      if (reachedGoal()) {
        fill(0,0,0);  // black.
        text("Finish!", x+s/2, y);
        exit();
      }
      ...
    }

次は[6. 完成プログラム][Maze6]

# 6. 完成プログラム {#ref-Maze6}

[前に戻る][Maze5]

**挑戦**: 別の迷路を解いてみよう

別の迷路を解いてみましょう。2箇所の「labyrinth1.png」をに変えたら、別の迷路に挑戦できます。使用可能の迷路は

*   `labyrinth1.png`
*   `labyrinth2.png`
*   `labyrinth3.png`
*   `labyrinth4.png`

完成させたプログラムは全ての迷路を解けるでしょうか？

```example
// Maze5
/* @pjs preload="/static/labyrinth1.png"; */
/* @pjs preload="/static/Walker44.png"; */
PImage imgLabyrinth = loadImage("/static/labyrinth1.png");
PImage imgWalker = loadImage("/static/Walker44.png");
void setup() {
  size(360, 360);  // キャンバスの大きさの設定
  image(imgLabyrinth, 1, 1, 360, 360); // 迷路の表示
  imageMode(CENTER);
}

// キャラクターの大きさ、ピクセル単位
int s = 44;

// キャラクターの座標
int x = 176, y = 314;

// 進む方向
int dx = 0;
int dy = -1;

PImage imgSave = null;
void draw() {  // この関数は繰り返し呼ばれている.
  if (imgSave != null) {
    image(imgSave, x, y, s, s);
  }
  if (reachedGoal()) {
    fill(0,0,0);  // black.
    text("Finish!", x+s/2, y);
    exit();
  }
  if (!wallRight() && !wallAhead()) {
    turnRight();
    boolean hitWall = false;
    for (int i = 0; i < 2; i++) {
      if (!wallAhead() && !wallRight()) {
        moveForward(1);
      } else {
        hitWall = true;
        break;
      }
    }
    if (!hitWall) {
      //moveForward(-2);
      turnLeft();
    }
  } else if (wallAhead()) {
    turnLeft();
  }
  moveForward(1);
  imgSave = get(x-s/2, y-s/2, s, s);
  image(imgWalker, x, y);
}

boolean reachedGoal() {
  color c = get(x+dx*(s/2+3), y+dy*(s/2+3));
  return red(c) < 50 && green(c) > 50;
}

boolean wallAhead() {
  boolean wallFound = false;
  int rx = -dy;
  int ry = dx;
  for (int i = -s/2-1; i < s/2+1; i++) {
    color c = get(x+dx*(s/2+3)+rx*i, y+dy*(s/2+3)+ry*i);
    wallFound = wallFound || brightness(c) < 50;
  }
  return wallFound;
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

void moveForward(int c) {
  x += c*dx;
  y += c*dy;
}

void turnLeft() {
  int tmp = dx;
  dx = dy;
  dy = -tmp;
}

void turnRight() {
  int tmp = dx;
  dx = -dy;
  dy = tmp;
}
```

# プログラミング体験ワークショップ {#ref-TTSWorkshop}

*   プログラミング体験ワークショップ
    *   [ステップ1][step1]
    *   [ステップ2][step2]
    *   [ステップ3][step3]
    *   [ステップ4][step4]
*   [補足][Addendum]
*   [デモ][Demos]
*   [ゲーム][Games]
*   [その他ワークショップ][otherworkshops]

# ステップ1 {#ref-step1}

今回のワークショップのテーマはコンピューターに言葉を話させることです。こちらのプログラムを入力してみましょう。

```example
// 「こんにちは」と話して。
speak("こんにちは");
```

ここに書いてある2行のうち、「//」
から初めの行は人間への説明です。コンピュータはこちらを無視しますので入力を省略しても大丈夫です。コンピューターへの命令は２行目のみです。

```
speak("こんにちは");
```

実行してみましょう。

「こんにちは」の部分を変えてみて、別の言葉を話させてみましょう。

詳しく知りたい人へ：

*   `speak(...)` は 「... の中の内容を話して」という命令です。
*   “...” の **"** は言葉を囲む記号です。
*   **;** は命令の区切りを意味します。

次は[ステップ2][step2]に進みましょう。

# ステップ2 {#ref-step2}

[ステップ1][step1]に戻る。

次にコンピューターに自分の名前を覚えさせてみましょう。プログラムの中で「記憶する」という役割をするのを[変数][Variable]と呼びます。変数はプログラムの実行中で様々のことを記憶することができます。こちらのプログラムにあなたの名前を入れてみましょう。

```example
// 変数を作ります。
String namae = "太郎";
// 変数を使うことによって、名前を思い出します。
speak("こんにちは、" + namae);
```

挨拶を変えてみましょう。または、変数は名前を覚えてくれるので、別のところでも使えます。

```example
// 変数を作ります。
String namae = "太郎";
// 変数を使うことによって、名前を思い出します。
speak("こんにちは、" + namae);
// まだ覚えています。
text("こんにちは、" + namae, 0, 50);
```

詳しく知りたい人へ：

*   「String namae」 は 「言葉 (String) を記憶する変数を作ります、その変数の名前は 「namae」 です」 という意味です。
*   「=」 は右にあるものを左の変数に記憶しなさいという命令です。全体で、「namae という言葉を格納する変数に “太郎” を記憶しなさい」
    という命令になります。
*   「+」 を使うと言葉をつなげることができます。
*   「text(...)」はテキストを表示します。格好のなかの最初のものは表示する言葉です。その後のは2つの数字は表示する場所を表しています。
    変数はコンピューターの記憶と考えてもいいです。変数を使うことによって、 コンピューターは様々な情報を覚えてくれます。

次は[ステップ3][step3]に進みましょう。

# ステップ3：配列（はいれつ） {#ref-step3}

[ステップ2][step2]に戻る。

次にいくつかのことをコンピューターに覚えさせてみましょう。もちろん、いくつかのの[変数][Variable]を作れます。

```example
String sei = "ぷろぷろ";
String mei = "太郎";
speak("こんにちは、" + sei + mei);
```

ただし、覚えさせたいことが多すぎたら、別の方法は必要になります。そこで、[配列][Array]（はいれつ）というものが役に立ちます。

```example
// 配列を作る。
String yotei[] = {"顔洗い", "朝ゴハン", "歯磨き", "登校"};
speak("明日の最初の予定は" + yotei[0] + "です。");
speak("次は" + yotei[1] + "です。");
speak("全部で" + yotei.length + "つの予定があります。");
```

詳しく知りたい人へ：

*   「`String yotei[]`」 の「`[]`」は 「ふくすうの言葉 (String) を記憶する変数を作ります、その変数の名前は
    「`yotei`」 です」 という意味です。
*   「`{`」 と「`}`」で覚えてほしい言葉は囲まれています。
*   「`yotei[0]`」と「`yotei[1]`」はふくすうの覚えてるのものから思い出す命令です。「`[0]`」は1つ目と「`[1]`」は二つ目を指します。というわけで、覚えているものは０から数えます。
*   「`yotei.length`」は配列の長さといい、覚えているものの数という意味です。

次は[ステップ4][step4]に進みましょう。

# ステップ4：「いつだれがどこでどうした」ゲーム {#ref-step4}

[ステップ3][step3]に戻る。

今回はいままでのステップで学んだことを活かして「いつだれがどこでどうした」というゲームを作ってみましょう。プログラムは長くなりましたので、タイピング代わりにヘルプの画面で
「トップ」→「ステップ4」を押してから「読み込む」ボタンを押してプログラムを読み込みましょう。

```example
// 「いつだれがどこでどうした」ゲーム
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
```

文しょうを作るのための部分を変えてみましょう。

詳しく知りたい人へ：

*   「random(...)」は乱数といい、実行するごとに違う数字を返します。例えば、「random(5)」は0から5までの数字を返します。
*   「int(...)」は数字の整数部分を抽出します。例えば、「int(4.5)」=
    4。「random」は整数ではない数字を返しますが、[配列][Array]にアクセスするには整数は必要です。

それでプログラミング体験のステップ終わりです。 もし、時間の余裕と興味があったら、[補足][Addendum]を見てみてください。
または、[デモ][Demos]や[ゲーム][Games]を実行してみましょう。

# 補足 {#ref-Addendum}

プログラミングに興味があったらこちらの補足情報もご覧ください。

*   [顔を描く][DrawFace]
*   [繰り返し（ループ）][Loop]
*   [イベント][Events]

# 補足：顔を描く {#ref-DrawFace}

左側にあるプログラムを実行したら、右側にある実行キャンバスにさまざまな 絵や形状を描けます。位置を指定のために座標を使います。左上は(0,0)です。
座標の最初の数は左右を表して、最後の数は上下を表しています。

```prerender
size(200, 200);
fill(0);
textSize(10);

ellipse(0, 0, 10, 10);
text("(0, 0)", 10, 10);

ellipse(200, 0, 10, 10);
text("(200, 0)", 160, 10);

ellipse(0, 200, 10, 10);
text("(0, 200)", 10, 190);
```

では、丸を描きましょう。丸を描くために`ellipse()`という関数を使います。
`ellipse()`を呼ぶときは4つの数を指定します。最初2つの数は中心の座標を表します。
最後の2つの数は横幅と高さを表しています。例えば、縦の長い丸を描いてみましょう。 顔に似ているでしょうか？

```prerender
size(200, 200);
fill(255, 200, 180); // 肌色
ellipse(100, 100, 150, 180);
```

鼻を描くために三角を使いましょう。三角を描くために`triangle()`という関数を使います。
この関数を呼ぶときに数を6つを指定しなければなりません。それは三角の3つの点は各2つづつの座標です。

```prerender
fill(100, 255, 100); // 緑
size(200, 200);
triangle(100, 90, 90, 120, 110, 120);
```

口と目を前と同じように`ellipse()`を使いましょう。次の見本のプログラムに進む前に 自分で目と口を描いてみましょう。

```prerender
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
```

# 補足：繰り返し（ループ） {#ref-Loop}

同じ命令を何回も繰り返すためにループを使います。

```prerender
for (int i = 1; i <= 5; i++) {　// 1から5まで数えます。
  text(str(i), 10, 10+i*10);
}
```

条件を調べることは「if」文でできます。

```prerender
for (int i = 1; i <= 5; i++) {　// 1から5まで数えます。
  if (i % 2 == 1) {  // 奇数かどうか調べます
    text(str(i), 10, 10+i*10);
  }
}
```

# 補足：イベント {#ref-Events}

プログラムの実行中でユーザの入力に対応するにはいくつかの方法ありますが、 こちらで**イベント**を紹介します。ユーザーはマウスクリックしたときに
[mouseClicked()]という関数が呼ばれます。

```example
// マウスがクリックした時に実行されます。
void mouseClicked() {　
  // 長方形の中か外か判断する。
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
  rect(60, 60, 80, 80);  // 長方形を描く。
}
```

マウスイベントについてもっと詳しくは[マウス][Mouse]に参考ください。

# マウス {#ref-Mouse}

マウスの入力は[イベント][Events]によって行う。イベントのリスト:

*   [mouseClicked()] マウスはクリックされたとき
*   [mousePressed()] マウスのボタンが押されたとき
*   [mouseReleased()] マウスのボタンが話されたとき
*   [mouseMoved()] マウスが動いたとき
*   [mouseDragged()] マウスが押されたままに動いたとき
*   [mouseOver()] マウスのカーソルはキャンバスに入ったとき
*   [mouseOut()] マウスのカーソルがキャンバスから離れたとき
*   [mouseX], [mouseY] マウスのXとY座標
*   [mouseButton] マウスイベントの関数の中は押されたボタンを表す

# 形状ゲーム {#ref-ShapeGame}

ここまでに勉強してきたことを合わせて簡単のゲームを作ってみましょう。 キャンバスに形状を３つ書いて、英語で形状の名前を話して、ユーザー
に形を当てましょう。正しければ「ピンポン」、間違っていれば「ぶぶ」と コンピューターに話させましょう。

```example
// ShapeGame
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
    speak(shapes[next], "en");  // 英語でも話せます
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
  rect(120, 100, 50, 50);　// 長方形を描きます。
  triangle(240, 100, 210, 150, 270, 150); // 三角を描きます。
}

void draw() {
  if (next == -1) {
    speak("つぎの問題");
    next = int(random(3));　　// 次の問題を定めます。
    speak(shapes[next], "en");
  }
}
```

# setup

`setup()`はスケッチを実行すると最初に1回だけ呼ばれます。`setup()`関数の中でキャンバスの大きさの設定などをしましょう。

スケッチの実行はこのように説明できます：

```
setup();
while(noLoop()は呼ばれていない) {
  // frameRate()で定められた頻度でdraw()を呼ぶ。
  draw();
}
```

## 参考

*   [draw()]
*   [noLoop()]
*   [loop()]

# draw

スケッチを実行すると、`setup()`関数が1回呼ばれた後、`draw()`関数が繰り返し呼ばれます。
`draw()`関数の中で画面を更新することでアニメーションを実現することができます。
`draw()`関数を1秒間に何回呼ぶかは[frameRate()]で設定できます。

```prerender
int i = 0;
void draw() {
  background(200);
  text(str(int(millis()/1000)), 10, 30);
  i++;
}

void setup() {
  frameRate(1);
  fill(0);  // 描画色を黒に設定。
  textSize(30);
}
```

関連項目: [frameRate()]。

# frameRate

`frameRate(x)`は`setup()`の中で使える関数で、`draw()`が呼ばれる頻度を設定します。
括弧の中には`draw()`関数を1秒間に何回呼ぶかを指定します。 たとえば、`frameRate(10)`を実行すると、`draw()`の実行が終わってから
次に`draw()`を呼ぶまで0.1秒待ちます。`frameRate(1)`では1秒待ちます。

関連項目: [frameCount], [draw()].

# frameCount

`frameCount`は`draw()`は何回呼ばれたかカウントします。

関連項目: [frameRate()], [draw()].

# width

`width`はキャンバスの横幅です。

# height

`height`はキャンバスの縦幅です。

# print

`print`はメッセージをプリントします。メッセージはキャンバス内で下のところにでてきます。`println()`と違って、メッセージのの後に改行しません。

呼び方:`print(message);`

関連項目:[println()]。

# println

`println`はメッセージをプリントします。メッセージはキャンバス内で下のところにでてきます。`print()`と違って、メッセージのの後に改行します。

呼び方:`println(message);`

関連項目:[print()]。

# インデックス {#ref-index}

正式なProcessing.jsのマニュアルはこちら:
<a href='http://processingjs.org/reference/' target='_blank'>http://processingjs.org/reference/</a>.

## 実行

`setup()`と`draw()`はプログラムの中で定義する必要があります。

*   [void setup() {...}][setup] 設定するための関数
*   [void draw() {...}][draw] アニメーションのフレームを描くための関数
*   [exit()] 実行を終了する

## アニメーション

*   [noLoop()] アニメーションの繰り返しを止める
*   [loop()] アニメーションの繰り返しを再開する
*   [millis()] 実行時間をミリ秒単位で返す
*   [frameRate()] `draw()`の呼び方の頻度の設定
*   [frameCount] `draw()`が何回呼ばれたかカウント

## キャンバス

*   [background()] キャンバスを色で塗る
*   [size()] キャンバスの大きさを設定する
*   [dist()] 2点間の距離を計算する
*   [copy()] 画像の一部を別の位置にコピーする

## 図形

*   [ellipse()] 楕円
*   [rect()] 長方形
*   [triangle()] 三角形
*   [line()] 直線
*   [arc()] 円弧
*   [point()] 点

## 筆の設定

*   [fill()] 塗りつぶしの色を設定する
*   [stroke()] ペンの色を設定する
*   [strokeCap()] ペンの端の形を設定する
*   [strokeWeight()] ペンの太さを設定する

## 画像

*   [image()] 画像を写す
*   [imageMode()] 画像の写し方の設定
*   [loadImage()], [@pjs preload][preload] 画像データを読み込む
*   [createImage()] 空画像を作る
*   [get()] 画像データをキャンバスから抽出する

## 文字

*   [text()] 文字を表示する
*   [textSize()] 文字の大きさを設定する
*   [textAlign()] 文字の写し方を設定する
*   [textFont()] 字体を設定する
*   [loadFont()] 字体を読み込みする

## スピーチ

*   [speak()] 声で話す

## [マウス][Mouse]

*   [mouseClicked()] マウスのボタンがクリックされたとき
*   [mousePressed()] マウスのボタンが押されたとき
*   [mouseReleased()] マウスのボタンが離されたとき
*   [mouseOver()] マウスがキャンバス内に入ったとき
*   [mouseOut()] マウスがキャンバスの外に出たとき
*   [mouseX], [mouseY], [pmouseX], [pmouseY] マウスのX座標とY座標
*   [mouseButton] マウスイベント関数の中で押されたボタンを表す
*   [cursor()] マウスカーソルの形を変える

## キーボード

*   [keyPressed()], [keyReleased()], [keyTyped()] キーボードのイベント関数
*   [key], [keyCode], [keyPressed] 押されたキーの変数
*   [keyCodes] キーコードの一覧

## データ

*   単純な型
    *   [int], [float], [boolean], [byte], [short], [double], [char]
*   [Array]
    *   [append()], [concat()]
*   [HashMap]
    *   [entrySet()]
*   [PImage] 画像

## 言語の基礎

*   条件付き実行
    *   [if], [else]
*   [ループ][Loop]
    *   [for], [while], [do]
    *   [continue], [break]
*   switch文
    *   [switch], [case], [default]
*   クラス
    *   [class], [this]
*   [final]

## 定数

*   [PI], [HALF_PI], [QUARTER_PI], [TWO_PI].

## 数学関数

*   [abs()]
*   [ceil()], [floor()], [round()]
*   [sin()], [cos()], [tan()]

# size

`size(x_size, y_size)`はキャンバスの大きさを定めます。スケッチの実行の最初に一回だけ呼ばなければいけない関数です。

```prerender
// キャンバスの大きさを300×200に設定します。
size(300, 200);
// キャンバスをピンクで塗りつぶします。
background(250, 200, 200);
```

# background

キャンバスを一つの色で塗りつぶます。色を指定する方法は2つあります。 1個の数値を指定した場合は、グレースケールで明るさを指定します。
0は黒、255は白、その中間は数値に応じた灰色を意味します。例えば

```prerender
// キャンバスを灰色に塗ります。
background(150);
```

3個の数値を指定した場合は、RGBモデルで任意の色を指定できます。 R・G・Bそれぞれを0から255までの数値で指定します。

```prerender
// キャンバスを赤で塗ります。
background(255, 0, 0);
```

# loop

スケッチの実行ループが止まっているときに`loop()`を呼ぶと、実行ループを再開します。

## 参考

*   [draw()]
*   [noLoop()]

# noLoop

スケッチの実行ループを停止します。 なお、マウスなどのイベントが発生したときは対応する関数が呼ばれるので、 スケッチの実行が完全に停止するわけではありません。

## 参考

*   [draw()]
*   [loop()]

# Demos

*   簡単なデモ
    *   [ImageSave]
    *   [ImageRotate]
*   [RandomSentenceGenerator]
*   [Drawing]
*   [ChaseTheCircle]

# ImageRotate

このプログラムは、画像を回しています。

```prerender
// ImageRotateExample
/* @pjs preload="/static/cat2-185x200.png"; */
PImage img = loadImage("/static/cat2-185x200.png");

void setup() {
  imageMode(CENTER);
}

void draw() {
  float angle = (mouseX+mouseY)/45*PI;
  int x = 50, y = 50;
  background(220);
  translate(x, y);
  rotate(frameCount/180*PI);
  image(img, 0, 0, 92, 100);
  rotate(-angle);
  translate(-x, -y);
}
```

# ImageSave

このプログラムでは、キャンバスを消すことなく、一部だけを保存して、後もとに戻すことで 綺麗なアニメーションが成り立っています。

```prerender
// ImageSaveExample
/* @pjs preload="/static/cat2-185x200.png"; */
PImage img = loadImage("/static/cat2-185x200.png");

void setup() {
  imageMode(CENTER);
}

PImage imgSave = null;

void draw() {
  if (imgSave != null) {
    image(imgSave, pmouseX, pmouseY, 100, 100);
  }
  imgSave = get(mouseX-50, mouseY-50, 100, 100);
  image(img, mouseX, mouseY, 92, 100);
}
```

# Drawing

このスケッチでマウスで描くことができます。

```example
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
```

# ChaseTheCircle

```example
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
```

# ゲーム {#ref-Games}

*   [JumpingBall]
    *   [JumpingBall2]
*   [TouchTheNumber]
*   [形状ゲーム][ShapeGame]
*   [IslandHopper]
*   [PingPong]
*   [RocketLanding]

# RocketLanding

```example
// RocketLanding
/* @pjs preload="/static/fire2-134x200.png"; */
/* @pjs preload="/static/rocket-168x300.png"; */
/* @pjs preload="/static/rocket1-168x300.png"; */
PImage fire = loadImage("/static/fire2-134x200.png");
PImage rocket = loadImage("/static/rocket-168x300.png");
PImage rocket_fire = loadImage("/static/rocket1-168x300.png");
PAudio explosion = loadSound("/static/explosion.ogg");
PAudio roar = loadSound("/static/roar.ogg");
PAudio win = loadSound("/static/win.ogg");

float x;
float y;
float vy;

boolean burning = false;
boolean gameOver = false;

void initVars() {
  x = 100;
  y = 10;
  vy = 0;
  gameOver = false;
  burning = false;
}

void setup() {
  size(200, 200);
  frameRate(20);
  imageMode(CENTER);
  initVars();
}

void draw() {
  y = y + vy;
  vy = vy + 0.2;

  if (y > height - 30) {
    if (abs(vy) > 3) {
      background(200);
      image(fire, x, y-25, 65, 100);
      explosion.play();
    } else {
      win.play();
    }
    noLoop();
    gameOver = true;
    return;
  }

  background(100);
  if (burning) {
    image(rocket_fire, x, y, 34, 60);
    burning = false;
  } else {
    image(rocket, x, y, 34, 60);
  }
}

void burn() {
  burning = true;
  vy -= 2;
  roar.play();
}

void keyPressed() {
  if (gameOver) {
    initVars();
    loop();
    return;
  }
  burn();
}

void mousePressed() {
  if (gameOver) {
    initVars();
    loop();
    return;
  }
  burn();
}
```

# PingPong

```example
// PingPong
void setup() {
  size(360, 360, P2D);
  background(250);
  frameRate(30);
}

int ballDiameter = 30;
int paddleWidth = 10;
int paddleHeight = 90;

int sleepUntil = 0;

void drawBall(int x, int y) {
  fill(200);
  stroke(0);
  int deform = 0;
  if (x <= paddleWidth*2 + ballDiameter/2 &&
      y1 - paddleHeight/2 - ballDiameter/2 < y &&
      y < y1 + paddleHeight/2 + ballDiameter/2) {
    deform = (paddleWidth*2 + ballDiameter/2 - x);
  } else if (x >= 360-paddleWidth*2 - ballDiameter/2 &&
             y2 - paddleHeight/2 -ballDiameter/2< y &&
             y < y2 + paddleHeight/2 + ballDiameter/2) {
    deform = (paddleWidth*2 + ballDiameter/2 - (360-x));
  }
  ellipse(x, y, ballDiameter-deform, ballDiameter+deform);
}

void drawPaddle(int x, int y) {
  fill(100);
  stroke(0);
  rect(x - paddleWidth/2, y - paddleHeight/2, paddleWidth, paddleHeight);
}

// Ball coordinates.
int x = 180, y = 180;
// Ball velocity.
int vx = 5, vy = 5;
int lastPlayer1inputMs = 0;
int lastPlayer2inputMs = 0;

boolean updateBall() {
  if (y < 10 && vy < 0) {
    vy = -vy - 1 + random(2);
  }
  if (y > 350 && vy > 0) {
    vy = -vy - 1 + random(2);
  }
  if (x <= paddleWidth + ballDiameter/2 &&
      y1 - paddleHeight/2 - ballDiameter/2 < y &&
      y < y1 + paddleHeight/2 + ballDiameter/2) {
    vx = 5 + random(2);
  }
  if (x >= 360-paddleWidth - ballDiameter/2 &&
      y2 - paddleHeight/2 -ballDiameter/2< y &&
      y < y2 + paddleHeight/2 + ballDiameter/2) {
    vx = -7 + random(2);
  }
  x += vx;
  y += vy;
  if (x < 10 || x > 350) {
    sleepUntil = millis() + 2000;
    background(250);
    textSize(30);
    fill(0);
    if (x < 10) {
      text("Player B won!", 100, 180);
       speak("Player B won!", "en");
    } else {
      text("Player A won!", 100, 180);
       speak("Player A won!", "en");
    }
    x = 180;
    y = 0;
    vx = -5;
    return false;
  }
  return true;
}

void draw() {
  if (millis() < sleepUntil) {
    return;
  }
  if (!updateBall()) {
    return;
  }
  background(255);
  drawPaddle(10, y1);
  drawPaddle(345, y2);
  drawBall(x, y);
  textSize(10);
  text(str(x) + "," + str(y)+"  "+y1+" " + y2, 10, 10);
  if (random(70) < 10 && millis() - lastPlayer1inputMs > 5000) {
    y1 = y;
  } else if (random(90) < 10 && millis() - lastPlayer2inputMs > 5000) {
    y2 = y;
  }
}

int y1 = 180;
int y2 = 180;

void mouseMoved() {
  y1 = mouseY;
  lastPlayer1inputMs = millis();
}

void keyPressed() {
  int ms = millis() - lastPlayer2inputMs;
  if (keyCode == UP) {
    if (ms < 100) {
      y2 -= 100;
    } else if (ms < 200) {
      y2 -= 50;
    } else {
      y2 -= 10;
    }
  } else if (keyCode = DOWN) {
    if (ms < 100) {
      y2 += 100;
    } else if (ms < 200) {
      y2 += 50;
    } else {
      y2 += 10;
    }
  }
  lastPlayer2inputMs = millis();
}
```

# IslandHopper

```example
// IslandHopper
int location = 0;
int[] sizes = new int[]{30, 30, 20, 30, 20, 10, 30};
int N = sizes.length;

int width = 300;
int height = 200;

void setup() {
  size(width, height);
  frameRate(10);
  stroke(0);
  fill(255);
}

int margin = 30;
int islandR = 30;
int islandAspect = 4;
int islandH = height-20;
int step = (width - 2*margin) / (N-1);

int negSizeThreshold = -3;

int humanHeight = 50;
int humanWidth = 20;
int humanHeadR = 10;
int humanY = islandH;

boolean gameOver = false;
String message = "GAME OVER";

void initialize() {
  location = 0;
  gameOver = false;
  humanY = islandH;
  message = "GAME OVER";
}


void drawHuman(int x, int y) {
  line(x, y-humanHeight/3, x, y-humanHeight);
  line(x-humanWidth/2, y, x, y-humanHeight/3);
  line(x+humanWidth/2, y, x, y-humanHeight/3);
  line(x-humanWidth/2, y-humanHeight*4/5, x+humanWidth/2, y-humanHeight*4/5);
  ellipse(x, y-humanHeight-humanHeadR, humanHeadR*2, humanHeadR*2);
}

void drawIsland(int x, int s) {
  ellipse(x, islandH, s, islandW);
}

void redraw() {
  background(200);
  drawHuman(margin + location*step, humanY);
  for (int i = 0; i < N; i++) {
    int s = sizes[i];
    if (s > 0) {
      if (s > islandR) s = islandR;
      ellipse(margin + i*step, islandH, s, s/islandAspect);
    }
  }
  drawHuman(margin + location*step, humanY);
  if (gameOver) {
    textSize(40);
    fill(0);
    text(message, 30, height/2+10);
    fill(255);
  }
}

void shrinkIslands() {
  for (int i = 1; i < N-1; i++) {
    if (sizes[i] > -random(negSizeThreshold)) {
      sizes[i] -= 1;
    } else {
      sizes[i] = random(islandR) + islandR;
    }
  }
}

void pullHuman() {
  if (humanY < islandH) {
    humanY += humanHeight/10;
  }
  if (humanY > islandH) {
    humanY = islandH;
  }
}

void advanceTime() {
  shrinkIslands();
  pullHuman();
}

void checkGround() {
  int s = sizes[location];
  if (humanY == islandH && s < humanWidth-2) {
    humanY = height;
    gameOver = true;
    redraw();
    noLoop();
    return;
  }
  if (location == sizes.length-1 && humanY == islandH) {
    message = "YOU WON";
    gameOver = true;
  }
}

void draw() {
  if (gameOver) return;
  advanceTime();
  checkGround();
  redraw();
}

void keyPressed() {
  if (gameOver) {
    if (keyCode == ' ') {
      initialize();
      loop();
    }
    return;
  }
  switch (keyCode) {
    case LEFT: if (location > 0) location--; break;
    case RIGHT: if (location < sizes.length-1) location++; break;
    case 32:
      if (humanY == islandH) {
        humanY -= humanHeight;
      }
      break;
  }
  checkGround();
  redraw();
}

void mouseClicked() {
  if (gameOver) {
    initialize();
    loop();
  }
}
```

# JumpingBall

```example
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
```

# JumpingBall2

```example
// JumpingBall2
/* @pjs preload="/static/football1-200x200.png"; */
/* @pjs preload="/static/fire1-200x123.png"; */
PImage img = loadImage("/static/football1-200x200.png");
PImage fire = loadImage("/static/fire1-200x123.png");
imageMode(CENTER);

// 座標
float x = 100;
float y = 100;
// 速度
float vx = 0;
float vy = 0;
// 加速度
float ax = 0.99;
float ay = 0.1;

float fireX = 200;
float fireY = 300;
float fireV = 1;
float fireVX = 0.5;
float fireVY = -0.1;
float fireAngle = 0;

float goalX = 450;
float goalY = 465;

boolean gameOver = false;
String gameMessage = "";

void initializeVars() {
  x = 100;
  y = 100;
  vx = 0;
  vy = 0;
}

void setup() {
  size(500, 500);
  initializeVars();
}

void draw() {
  updatePosition();
  drawFrame();
}


void updatePosition() {
  // 座標や速度の計算。
  x = x + vx;
  y = y + vy;
  if (vx != 0) {
    vx = vx*abs(vx*ax)/abs(vx);
  }
  vy = vy + ay;
  /*
  if (y > height-5) {
    gameOver = true;
    gameMessage = "GAME OVER";
    return;
  }
  */
  // バウンス
  if (x < 5) {
    x = 5;
    vx = abs(vx);
  }
  if (x > width-5) {
    x = width - 5;
    vx = -abs(vx);
  }
  if (y < 5) {
    y = 5;
    vy = abs(vy);
  }
  if (y > height-5) {
    y = height-5;
    vy = -abs(vy);
  }
  fireX += fireVX;
  fireY += fireVY;
  fireAngle += 0.02;
  fireVX = fireV*cos(fireAngle) + fireV*sin(fireAngle);
  fireVY = fireV*sin(fireAngle) - fireV*cos(fireAngle);

  if (dist(x, y, fireX, fireY) < 100 && abs(y - fireY) < 60) {
    gameOver = true;
    gameMessage = "GAME OVER";
  }
  if (dist(x, y, goalX, goalY) < 25 && y <= goalY) {
    gameOver = true;
    gameMessage = "YOU WON";
  }
}


void drawFrame() {
  if (gameOver) {
    background(220);
    fill(0);
    textSize(20);
    text(gameMessage, 30, 100);
    noLoop();
    return;
  }
  background(220);
  strokeWeight(3);
  fill(255);
  ellipse(goalX, goalY, 45, 25);
  fill(255);
  //ellipse(x, y, 10, 10);
  image(img, x, y,  40, 40);
  translate(fireX, fireY);
  image(fire, 0, 0, 200, 130);
  translate(-fireX, -fireY);
}

void keyPressed() {
  if (gameOver) {
    gameOver = false;
    initializeVars();
    loop();
    return;
  }
  switch (key) {
    case ' ':
      break;
    case '\n':
      break;
    case 'q':
      gameOver = true;
      gameMessage = "STOP";
      break;
  }
  switch (keyCode) {
    case UP:
      vy -= 5;
      break;
    case DOWN:
      vy += 5;
      break;
    case LEFT:
      vx = -2;
      break;
    case RIGHT:
      vx = 2;
      break;
  }
}

```

# TouchTheNumber

```example
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

int lastClickMs;

void mouseClicked() {
  // Ignore click repeats (touch screen generates too many click events).
  if (millis() - lastClickMs < 50) return;
  lastClickMs = millis();
  if (!started) {
    started = true;
    background(240);
    rectangles();
    started_ms = millis();
  }
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
```

# ellipse

円または楕円を描きます。

```prerender
size(100, 50);
ellipse(50, 25, 90, 20);
```

```prerender
fill(255, 0, 0); // 赤
// 横に細長い赤い楕円を描きます。
ellipse(50, 10, 100, 20);
fill(0, 0, 255); // 青
// 縦の細長い楕円を描きます。
ellipse(10, 50, 20, 100);
fill(255);  // 白
ellipse(50, 50, 40, 40);
```

呼び方: `ellipse(x, y, width, height)`

*   x --- 中心のX座標
*   y --- 中心のY座標
*   width --- 楕円の幅
*   height --- 楕円の高さ

weightとheightを等しくすれば円になります。

関連項目: [arc()], [triangle()], [rect()], [ellipse()].

# speak

テキストを読み上げます。

```example
// こんにちはと言います。
speak("こんにちは");
```

他の言語のテキストを話させたいときは、テキストの後に`"en"`, `"it"`などの言語コードを指定します。

```example
speak("Ciao!", "it");
speak("Hallo!", "en-GB");
speak("Hello!", "en-US");
```

### 注意

`speak()`は標準的なProcessing.jsの一部ではありません。このシステム以外のProcessing.jsの環境では使えません。

# RandomSentenceGenerator

```example
// RandomSentenceGenerator
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
```

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

`fill()`は筆の中の色を設定する。筆には２つの色が設定できます。中の色は形状の中に塗ります。 端の色は形状の堺麺を描く時に使います。

```prerender
fill(0, 255, 0);  // 緑
ellipse(50, 50, 50, 25);
```

他に[stroke()]を見てみてください。

# hit

当たる、打つかる。

# false

真理値の一つ。「偽」という意味。[boolean]を見てください。

# true

真理値の一つ。「真」という意味。[boolean]を見てください。

# boolean

`boolean`は真理値の型です。真理値には2つの値があります。

*   `true` 「真」
*   `false` 「偽」

[if()]と[while()]のカッコの中の値は真理値でなければなりません。

# void

`void`は何も返さない関数の型です。関数が値を返す必要がないときに使います。

# char

`char`は一つの文字のコードポイント(符号点)を保存する整数の型です。

```
char c = 'd'; // 100.
```

# int

整数の型です。整数は..., -3, -2, -1, 0, 1, 2, 3, 4, ...などの数です。

# float

単精度浮動小数点数の型です。

**注意:** Processing.jsでは、変数に付く型が倍精度(double)である。

# double

倍精度浮動小数点数変の型です。

# byte

-128以上127以下の整数の型です。

**注意:** Processing.jsでは変数につけている型は倍精度(double)であるため、使う時点で`byte()`で変換が必要である。

```prerender
fill(0); textSize(20);
byte x = byte(257);
text(str(x), 10, 30);
```

# short

-32768以上32767以下の整数の型です。

**注意:** Processing.jsでは変数につけている型は倍精度(double)であるため、使う時点で`short()`で変換が必要である。

# line

`line()`はキャンバスに直線を描きます。

```prerender
int x1 = 10, y1 = 10, y2 = 100, x2 = 50;
// (x1, y1)から(x2, y2)までの直線を描きます。
line(x1, y1, x2, y2);
```

関連項目: [triangle], [rect], [ellipse], [arc].

# millis

プログラム開始から現在までの経過時間をミリ秒単位で返します。

例えば、このプログラムは実行を始めてから2秒後に赤い円を描きます。

```prerender
// millis
void setup() {
  size(150, 100);
  background(255);  // キャンバスを白で塗ります
  fill(0);
  textSize(20);
  text("2秒待って", 10, 50);
}

void draw() {
  if (millis() > 2000) {  // 2000ミリ秒=2秒
    background(255);
    fill(255, 0, 0); // 赤
    ellipse(75, 50, 55, 55);
    noLoop(); // アニメーションを止めます。
  }
}
```

# mouseClicked

ユーザがマウスをクリックすると`mouseClicked()`関数が呼ばれます。
マウスのクリックに反応するプログラムを作るにはこの関数を定義しなければなりません。
カーソルの位置は`mouseX`と`mouseY`変数を使って調べることができます。
クリックされたボタンは[mouseButton]変数を使って調べることができます。クリックされたボタンによって`mouseButton`の値は[LEFT]か[RIGHT]かになります。

```example
void setup() {
  background(255);
}

void mouseClicked() {
  fill(0);
  ellipse(mouseX, mouseY, 20, 20);
}
```

# mouseMoved

**マウスイベント**: `mouseMoved()`を定義すれば、マウスカーソルが動いたときに呼ばれる関数。

関連項目: [mouseClicked()], [mouseDragged()], [mouseOver()], [mouseOut()].

# mouseDragged

**マウスイベント**: `mouseDragged()`を定義すれば、マウスが押されたままに動いたときに呼ばれる関数。

関連項目: [mouseClicked()], [mouseMoved()], [mouseOver()], [mouseOut()].

# mouseOver

ユーザがマウスをキャンバスの外から中に動かすと`mouseOver()`関数が呼ばれます。

```example
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
```

# mouseOut

ユーザがマウスをキャンバスの中から外に動かすと`mouseOut()`関数が呼ばれます。

```example
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
```

# mousePressed

ユーザがマウスのボタンを押すと`mousePressed()`関数が呼ばれます。 この関数を定義すれば、「マウスで絵を描く」のような操作が実装できます。

```example
void setup() {
  background(20);
  fill(240);
}

bool pressed = false;

// キャンバスの中でマウスの左ボタンか右ボタンが押されたら、
// それに対応して塗りつぶしとペンの色を設定する。
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
```

# mouseReleased

ユーザがマウスのボタンを離すと`mouseReleased()`関数が呼ばれます。 この関数を定義すれば、「マウスで絵を描く」のような操作が実装できます。

```example
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
```

# mouseButton

[マウスイベント][Mouse]の中で使い、押されたボタンを表す。 押されたボタンが左ボタンのときは[LEFT]に、右ボタンがときは[RIGHT]になる。

```prerender
// キャンバスの中でマウスボタンが押してみましょう。
void mousePressed() {
  if (mouseButton == LEFT) {
    fill(0);
    rect(5,5,40,90);
  } else if (mouseButton == RIGHT) {
    fill(0);
    rect(55,5,40,90);
  } else {
    fill(0);
    rect(45,5,10,90);
  }
}

void mouseReleased() {
  background(200);
}
```

# mouseX

マウスのX座標。[draw()]からも[マウスイベント][Mouse]からも参照できます。

関連項目: [mouseX], [pmouseX], [pmouseY], [mousePressed()], [mouseReleased()],
[mouseClicked()].

```prerender
void draw() {
  ellipse(mouseX, mouseY, 5, 5);
}
```

# pmouseX

前のフレームでの[mouseX]の値。

関連項目: [mouseX], [mouseY], [pmouseY].

```prerender
void draw() {
  line(pmouseX, pmouseY, mouseX, mouseY);
}
```

# pmouseY

前のフレームでの[mouseY]の値。

関連項目: [mouseX], [mouseY], [pmouseX].

# mouseY

マウスのY座標。[draw()]からも[マウスイベント][Mouse]からも参照できます。

関連項目: [mouseX], [pmouseX], [pmouseY], [mousePressed()], [mouseReleased()],
[mouseClicked()].

```prerender
void draw() {
  ellipse(mouseX, mouseY, 5, 5);
}
```

# LEFT

**マウス**: `LEFT`は[mouseButton]を参照するときにマウスの左ボタンを表す。

関連項目: [mouseButton], [mousePressed()], [mouseReleased()], [mouseClicked()].

**キーボード**: 左の矢印キーのコード。一覧は[keyCodes]に参照。 `keyCode == LEFT`を調べる先に`key ==
CODED`を確かめなければなりません。

関連項目: [keyCode], [keyCodes].

# CENTER

**マウス**: `CENTER`は[mouseButton]を参照するときにマウスの真ん中ボタンを表す。

関連項目: [mouseButton], [mousePressed()], [mouseReleased()], [mouseClicked()].

# RIGHT

**マウス**: `RIGHT`は[mouseButton]を参照するときにマウスの右ボタンを表す。

関連項目: [mouseButton], [mousePressed()], [mouseReleased()], [mouseClicked()].

**キーボード**: 右の矢印キーのコード。一覧は[keyCodes]に参照。 `keyCode == RIGHT`を調べる先に`key ==
CODED`を確かめなければなりません。

関連項目: [keyCode], [keyCodes].

# printNumbers

数値を表示する。

# random

# rect

`rect()`は長方形を描きます。長方形の位置は2つの頂点の座標で指定します。

```prerender
fill(0);
rect(20, 30, 60, 40);
```

# remove

なくす、処分する。

# shuffle

順番をみだす、順不同にする。

# sqrt

`sqrt()`は数の平方根を計算します。例えば、`sqrt(4.0)`は2.0を返します。

# str

`str()`は任意の値を文字列(テキスト)に変換します。

# stroke

`stroke()`はペンの色を設定します。次の線や図形を描く命令に反映されます。

```prerender
stroke(255, 180, 0);  // オレンジ
strokeWeight(5);
line(20, 20, 80, 80);
rect(20, 55, 60, 25);
```

関連項目: [strokeCap], [fill].

# strokeCap

`strokeCap()`はペンの端の形を設定します。次の[line()]命令に反映されます。

```prerender
strokeCap(ROUND);
strokeWeight(20);
line(20, 20, 80, 80);
```

関連項目: [stroke], [fill], [ROUND], [SQUARE], [PROJECT].

選択できる形は

*   `ROUND` - 丸い
*   `SQUARE` - 四角い。線は座標で表している点までぴったり及びます。
*   `PROJECT` - 四角い。線は座標で表している点から筆の大きさの部分まで出ています。

# ROUND

線を描く筆を丸い形に設定します。 [strokeCap()]を見てください。

```prerender
strokeCap(ROUND);
strokeWeight(20);
line(20, 20, 80, 80);
```

関連項目: [strokeCap], [strokeWeight], [stroke], [SQUARE], [PROJECT].

# SQUARE

線を描く筆を四角い形に設定します。 [strokeCap()]を見てください。

```prerender
strokeCap(SQUARE);
strokeWeight(20);
line(20, 20, 80, 80);
```

関連項目: [strokeCap], [strokeWeight], [stroke], [ROUND], [PROJECT].

# PROJECT

線を描く筆を四角い形に設定します。[SQUARE]と比べて、筆の大きさは線の先端に出ています。 [strokeCap()]を見てください。

```prerender
strokeCap(PROJECT);
strokeWeight(20);
line(20, 20, 80, 80);
```

関連項目: [strokeCap], [strokeWeight], [stroke], [ROUND], [SQUARE].

# strokeWeight

`strokeWeight()`はペンの太さを設定します。次の線や図形を描く命令に反映されます。

```prerender
strokeCap(SQUARE);
strokeWeight(5);
line(15, 20, 85, 20);
strokeWeight(10);
line(15, 40, 85, 40);
strokeWeight(20);
line(15, 70, 85, 70);
```

関連項目: [stroke], [strokeWeight], [SQUARE].

# noStroke

`noStroke()`は端を書かないように設定する。

```prerender
noStroke();
rect(20, 20, 60, 60);
```

# text

`text()`はキャンバスに言葉を表示します。表示する位置を座標で指定します。

```prerender
size(150, 100); fill(0); textSize(20);
text("こんにちは", 20, 50);
```

関連項目: [textSize], [fill], [textFont].

# textAlign

`textAlign()`は文字を移り方を設定する。

```render
void setup() {
  size(300, 130);
  stroke(0);
  fill(0);
  textSize(15);
  strokeWeight(5);
  point(width/2, height/2);
  frameRate(1);
}

void draw() {
  background(220);
  point(width/2, height/2);
  switch (frameCount % 12) {
    case 0:
      textAlign(LEFT, BASELINE);
      text("textAlign(LEFT, TOP)", 10, 20);
      textAlign(LEFT, TOP);
      break;
    case 1:
      textAlign(LEFT, BASELINE);
      text("textAlign(RIGHT, TOP)", 10, 20);
      textAlign(RIGHT, TOP);
      break;
    case 2:
      textAlign(LEFT, BASELINE);
      text("textAlign(CENTER, TOP)", 10, 20);
      textAlign(CENTER, TOP);
      break;
    case 3:
      textAlign(LEFT, BASELINE);
      text("textAlign(LEFT, BOTTOM)", 10, 20);
      textAlign(LEFT, BOTTOM);
      break;
    case 4:
      textAlign(LEFT, BASELINE);
      text("textAlign(RIGHT, BOTTOM)", 10, 20);
      textAlign(RIGHT, BOTTOM);
      break;
    case 5:
      textAlign(LEFT, BASELINE);
      text("textAlign(CENTER, BOTTOM)", 10, 20);
      textAlign(CENTER, BOTTOM);
      break;
    case 6:
      textAlign(LEFT, BASELINE);
      text("textAlign(LEFT, CENTER)", 10, 20);
      textAlign(LEFT, CENTER);
      break;
    case 7:
      textAlign(LEFT, BASELINE);
      text("textAlign(RIGHT, CENTER)", 10, 20);
      textAlign(RIGHT, CENTER);
      break;
    case 8:
      textAlign(LEFT, BASELINE);
      text("textAlign(CENTER, CENTER)", 10, 20);
      textAlign(CENTER, CENTER);
      break;
    case 9:
      textAlign(LEFT, BASELINE);
      text("textAlign(LEFT, BASELINE)", 10, 20);
      textAlign(LEFT, BASELINE);
      break;
    case 10:
      textAlign(LEFT, BASELINE);
      text("textAlign(RIGHT, BASELINE)", 10, 20);
      textAlign(RIGHT, BASELINE);
      break;
    case 11:
      textAlign(LEFT, BASELINE);
      text("textAlign(CENTER, BASELINE)", 10, 20);
      textAlign(CENTER, BASELINE);
      break;
  }
  text("text", width/2, height/2);
}
```

# textSize

`textSize()`は文字の大きさを設定します。この関数を呼んでから次の[text()]の命令に反映されます。

```prerender
fill(0);
textSize(50);
text("あ", 20, 80);
textSize(20);
text("か", 70, 30);
```

関連項目: [text], [textFont].

# triangle

`triangle()`は三角形を描きます。3つの頂点を座標で指定します。

```prerender
triangle(50, 10, 10, 80, 90, 80);
```

三角形の辺は現在のペンの色と太さで描きます。[stroke()]と[strokeWeigth()]を見てください。
三角形の内部は現在の塗りつぶしの色で塗りつぶします。[fill()]を見てください。

# update

更新する。

# while

指定された条件が真である間、 { ... } の間に書いた文を繰り返します。

```prerender
fill(0);
int x = 0;
while (x < 10) {
  text(str(x), 10+x*7, 15+x*8);
  x = x+1;
}
```

関連項目: [for], [do], [break], [continue].

# for

ループといい、ある条件を満たすまでの繰り返し命令である。

```prerender
fill(0);
for (int i = 0; i < 10; i++) {
  text(str(i), 10, i*10);
}
```

関連項目: [while], [do], [break], [continue].

# do

ループの一つの種類。[while]と違って、初めて条件を調べる前に一回ループの本体 を実行する。

```prerender
do {
  fill(0);
  text("一回だけ実行する!", 5, 50);
} while (false);
```

関連項目: [while], [for], [break], [continue].

# if

条件付き実行する。条件が満たされたら、条件付きのブロックを実行する。 条件は満たさなければ、[else]のブロックを実行する。[else]のブロックはなければ、
何も実行しない。

```prerender
fill(0);
if (10 > 5) {
  text("10 > 5", 10, 50);
} else {
  text("10 <= 5 ?!", 10, 50);
}
```

関連項目: [else]

# else

条件付きの実行の[if]のブロックに条件が満たされないときに実行するブロック 指定する。

```prerender
fill(0);
if (10 < 5) {
  text("10 < 5 ?!", 10, 50);
} else {
  text("10 >= 5", 10, 50);
}
```

関連項目: [if]

# case

`case`は、`switch`文の中で一つの値の分岐を表す。

関連項目: [switch], [default].

# switch

`switch`文は一つの変数の値を検出して、複数の値に対して比べて多重分岐から 一つの分岐を実行する。

```prerender
fill(0); textSize(30);
int x = 2;
switch (x) {
  case 0: text("〇", 10, 50); break;
  case 1: text("一", 10, 50); break;
  case 2: text("二", 10, 50); break;
  default: text("他", 10, 50); break;
}
```

関連項目: [case], [default].

# default

`default`は、[switch]文の中でどの値でも当たらなかった場合の分岐を表す。

関連項目: [switch], [case].

# ループ {#ref-Loop}

ループは繰り返す実行の命令である。いくつの種類がある

*   [for]
*   [while]
*   [do]

# LabyrinthWalker

```example
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
```

# 1. 空迷路 {#ref-LabyrinthBlank}

今回は、キャラクターの周りだけではなくて、動かす前に迷路全体を調べてみましょう。地図を作って、スタートやゴールの位置が判明してから、最短ルートを探します。プログラムは複雑になってくるので、アルゴリズムの面白い部分を見ることができます。以下のプログラムを読み込みしてから、「実行」のボタンを押してみましょう。

```example
/* @pjs preload="/static/Labyrinth3a.png"; */
PImage imgLabyrinth = loadImage("/static/Labyrinth3a.png");
/* @pjs preload="/static/Walker44.png"; */
PImage imgWalker = loadImage("/static/Walker44.png");

void setup() {  // this is run once.
    // Set up canvas size.
    size(360, 360);
    // Display the background (labyrinth).
    image(imgLabyrinth, 1, 1, 360, 360);
}

PImage imgSave = null;
void draw() {
  if (imgSave != null) {
    image(imgSave, pmouseX, pmouseY, 44, 44);
  }
  imgSave = get(mouseX, mouseY, 44, 44);
  image(imgWalker, mouseX, mouseY, 44, 44);
}
```

[2. 地図作り][LabyrinthMapper]

# 2. 地図作り {#ref-LabyrinthMapper}

[前に戻る][LabyrinthBlank]

このプログラムは迷路の画像を解析して地図を作っていきます。
迷路の上に点をおいて、縦横にピクセルを調べながらグリッド形式で地図を作成します。迷路によってはもっと細かく地形を調べなければいけない場合があります。

```example
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
```

[3. 最短の道][LabyrinthSearch]

# 3. 最短の道 {#ref-LabyrinthSearch}

[前に戻る][LabyrinthMapper]

このプログラムは幅優先探索を使って最短の道を探しています。

```example
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
```

[4. 道の作り直し][LabyrinthBacktrace]

# 4. 道の作り直し {#ref-LabyrinthBacktrace}

[前に戻る][LabyrinthSearch]

このプログラムは最短のルートを見つけてから後ろから道を作り直します。

```example
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
```

[5. 完成版][LabyrinthSolver]

# 5. 完成版 {#ref-LabyrinthSolver}

[前に戻る][LabyrinthBacktrace]

```example
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
```

# 配列 {#ref-Array}

`Array`は配列といい、データのリストを持っている。複数のデータを保存するとき、 番号を使って取り出せるのだ。

```prerender
int x[] = {1, 2, 3};  // 配列をつくる
fill(0); text(x[0], 10, 20);
text(x[2], 10, 40);
int y[] = new int[10]; // 別の配列を作る
text(y[0], 10, 80);  // 最初は０が入っています。
```

# HALF_PI

`HALF_PI`は円周率の半分である。 `1.5707963267948966`.

```prerender
arc(50, 50, 45, 45, 0, HALF_PI);
```

関連項目: [PI], [QUARTER_PI], [TWO_PI].

# QUARTER_PI

`QUARTER_PI`は円周率の4分の1である。 `0.7853981633974483`.

```prerender
arc(50, 50, 45, 45, 0, QUARTER_PI, HALF_PI);
```

関連項目: [PI], [HALF_PI], [TWO_PI].

# PI

`PI`は円周率である。`3.141592653589793`.

```prerender
size(150, 150);
float ps = 0;
for (float x = 1; x < 150; x += 1) {
  float s = sin(x/150*2*PI);
  line(x-1, 50+40*ps, x, 50+40*s);
  ps = s;
}
```

関連項目: [HALF_PI], [QUARTER_PI], [TWO_PI].

# TWO_PI

`TWO_PI`は円周率の二倍である。`6.283185307179586`.

```prerender
arc(50, 50, 45, 45, HALF_PI, TWO_PI);
```

関連項目: [PI], [HALF_PI], [QUARTER_PI].

# HashMap

`HashMap`はハッシュテーブルデータ構造である。データはキーと値の組で保存され、 キーに対して値を素早く参照できる。

```prerender
HashMap<Integer, String> map = new HashMap();
map.put(123, "XYZ");
fill(0); text(map.get(123), 10, 30);
```

関連項目：[get], [put], [entrySet].

# get

`get()`は複数の意味持っている。

*   [HashMap]の場合、キーに対して値を取り出す。
*   画像の場合は、ピクセルデートを読み込みます。

```prerender
/* @pjs preload="/static/Walker44.png" */
PImage img = loadImage("/static/Walker44.png")
image(img, 28, 28);

// 画像データを抽出する。
PImage frag = get(50, 50, 22, 22);
// 画像データ写す
image(frag, 72, 72, 28, 28);

// ピクセルの色を抽出する。
color c = get(50, 50);
// 抽出された色で長方形を描く。
rect(72, 0, 28, 28);
```

# put

`put`は複数の意味を持っている。

*   [HashMap]の場合、キーに対して与えられた値を保存する。

# entrySet

[HashMap]の場合、キーと値の組のセットを返す。そのセットはイテレータによって全ての組を取り出せる。

```prerender
size(90, 200); fill(0);
HashMap hm = new HashMap();
hm.put(1, "one");
hm.put(12, "one two");
hm.put(123, "one two three");
for (it = hm.entrySet().iterator(); it.hasNext(); ) {
  Map.Entry en = it.next();
  int y = en.getKey();
  text("" + en.getKey() + ": " + en.getValue(), 1, y+10);
}
```

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

```prerender
int nenrei = 12;
String namae = "たろう";
fill(0); textSize(12);
text(namae + nenrei + "才", 20, 20);
```

# オブジェクト {#ref-Object}

`Object`は関連するデータを束ね、複雑のデータ構造を表現できる。[変数][Variable]に`Object`の型を付けられたら、

```prerender
Object[] arr = {1, "abc"};
for (int i = 0; i < arr.length; i++) {
  fill(0); text(str(arr[i]), 10, 20+i*20);
}
```

# String

`String`は文字列の型を表し、言葉を覚える変数を作る。

```prerender
String namae = "たろう";
fill(0); text(namae, 20, 20);
```

# PFont

`PFont`はフォントのデートを保存できる。

関連項目: [loadFont()].

# loadFont

`loadFont`は書体データ(フォント)を読み込みする。

```prerender
fill(0);
textFont(loadFont("Courier New"), 12);
text("Courier New", 10, 20);
textFont(loadFont("Verdana"), 15);
text("Verdana", 10, 40);
textFont(loadFont("Arial"), 15);
text("Arial", 10, 60);
```

関連項目: [textFont], [textSize], [text].

# textFont

`textFont`は書体デート(フォント)を設定する。すぐは見える効果はないが、 次の[text]の呼び出しに影響を与える。

```prerender
fill(0);
textFont(loadFont("Courier New"), 12);
text("Courier New", 10, 20);
textFont(loadFont("Verdana"), 15);
text("Verdana", 10, 40);
textFont(loadFont("Arial"), 15);
text("Arial", 10, 60);
```

関連項目: [text], [loadFont], [textSize].

# color

`color`は色を表す。

```prerender
color red = color(255, 0, 0);
color blue = color(0, 0, 255);
fill(red);
stroke(blue);
rect(10, 10, 80, 80);
```

関連項目: [fill()], [background()], [red()], [green()], [blue()], [hue()],
[saturation()], [brightness()], [colorMode()].

# abs

`abs`は数の絶対値を返す。

# alpha

`alpha`は色から透明度を抽出する。

```prerender
color opaque = color(255, 0, 0);
color transparent = color(255, 0, 0, 10);
fill(0); text(alpha(opaque), 10, 20); // 255
text(alpha(transparent), 20, 40); // 10
fill(opaque);
ellipse(50, 50, 20, 20);
fill(transparent);
rect(10, 10, 40, 40);
```

# append

`append()`は配列にもう一つの要素分を追加する。

```prerender
String[] namae = {"たろう", "花子"};
append(namae, "次郎");
fill(0); textSize(20);
for (int i = 0; i < namae.length; i++) {
  text(namae[i], 10, 30+i*20);
}
```

# concat

`concat()`は２つの配列を結合する。

# arc

`arc`は弧を描く。

```prerender
arc(50, 50, 40, 20, PI/4, 2*PI);
```

呼び方:`arc(x, y, width, height, start, stop);`

*   x, y --- 楕円の中心の座標。
*   width, height --- 楕円の横幅と縦幅。
*   start, stop --- 弧の角度を指定する。

関連項目: [ellipse()].

# point

`point`は一点を描く。

```prerender
strokeWeight(5);
point(50, 50);
```

呼び方:`point(x,y);`

*   x, y --- 点の座標。

関連項目: [strokeWeight()], [stroke()], [line()].

# break

ループ([while], [for], [do])や[switch]から脱出する命令。

# continue

ループ([while], [for], [do])の実行を一旦止めて、ループの頭から実行再開する。

```prerender
int i = 0;
while (i < 10) {
  fill(0); text(str(i), 10, i*10);
  i++;
  continue;
  text("絶対実行しない", 50, 50);
}
```

# binary

`binary`は数を２進法(バイナリー)で表現する。返す値は文字列([String]).

```prerender
x = 1023; // Binary 1111111111.
fill(0); text(binary(x), 10, 20);
text(binary(x, 5), 10, 40);
```

呼び方: `binary(input, num_digits)`

*   `input` --- 二進法で表現する数
*   `num_digits` --- 最大返す数字の上限

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

```
float x = 9.3;
float c = ceil(x); // 10.0
```

# floor

`floor()`は数に対してそれ以下である最も近い整数を返す。

```
float x = 9.3;
float c = floor(x);  // 9.0
```

# round

`round()`は数に対して最も近い整数を返す。

```
float x = 9.3;
float c = round(x);  // 9.0
```

# sin

`sin()`は角度のサイン関数を計算する。

# cos

`cos()`は角度のコサイン関数を計算する。

# tan

`tan()`は角度のサインとコサインの比率を計算する。

# class

`class`はオブジェクト指向のクラスの定義を表す。

```prerender
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
fill(0); text(wanwan, 10, 30);
```

# this

[class]の定義の中に自分自身のオブジェクトに参照する方法。

関連項目: [class].

# toString

オブジェクトに対して、文字列を期待する文脈で呼ばれるメソッド。 例えば、`str()`にオブジェクトを渡されたとき。

```prerender
class Inu {
  Inu(String namae) {
    this.namae = namae;
  }
  String toString() {
    return "犬、名前:" + this.namae;
  }
}

size(150, 100); fill(0);
fill(0); text(str(new Inu("ワンワン")), 10, 30);
```

# final

`final`は変数の値が固定して変えられないことを表す。

# dist

`dist()`は２つの点に対して距離を計算する。

```prerender
void draw() {
  background(255); fill(0);
  text(dist(50, 50, mouseX, mouseY), 50, 50);
}
```

# cursor

`cursor()`はマウスのカーソルの形を指定する。

```prerender
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
```

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

```prerender
ellipse(50, 50, 40, 40);
copy(50, 50, 24, 24, 0, 0, 50, 50);
```

呼び方: `copy(x, y, w, h, dx, dy, dw, dh)`

*   x, y --- コピーの元の長方形の左上の角のX,Y座標
*   w, h --- コピーする資格の横幅と縦幅
*   dx, dy --- コピーの目的地の長方形の左上の角のX,Y座標
*   dw, dh --- コピーの目的地の横幅と縦幅

# key

最後に押された文字または記号を文字列として保存している変数。 矢印などの文字ではないキーの判断

関連項目: [keyReleased()], [keyTyped()], [key], [keyCode], [keyCodes].

```example
void setup() {
  size(200, 200);
  fill(0);
  textSize(30);
}
void draw() {
  text("key " + str(key), 10, 60);
}
```

# keyCode

最後に押されたキーのコード。通常イベント関数で使います。 コードの一覧は[keyCodes]に参照。

関連項目: [keyPressed()], [keyReleased()], [keyTyped()].

```example
void setup() {
  size(400, 200);
  fill(0);
  textSize(30);
}
void draw() {
  background(220);
  text("keyCode " + keyCode, 10, 60);
}
```

# keyPressed

**関数**: `keyPressed()`を定義すれば、キーが押されたたび に呼ばれる関数です。

**変数**: `keyPressed`は最後に押されたキーのコードです。

関連項目: [keyReleased()], [keyTyped()], [key], [keyCode], [keyCodes].

```example
void setup() {
  size(400, 200);
  fill(0);
  textSize(20);
}
void draw() {
  background(220);
  text("keyPressed " + keyPressed, 10, 60);
}
```

```example
void setup() {
  size(400, 200);
  fill(0);
  textSize(10);
  background(220);
}
int y = 10;
void keyPressed() {
  text("keyPressed() key " + str(key) + " keyCode " + keyCode, 10, y);
  y += 10;
  if (y > 200) {
    background(220);
    y = 10;
  }
}
```

# keyTyped

`keyTyped()`を定義すれば、キーボードの文字または数字や記号のキー 押されたときに呼ばれる関数です。

関連項目: [keyPressed()], [keyReleased()], [key], [keyCode], [keyCodes].

```example
void setup() {
  size(400, 200);
  fill(0);
  textSize(10);
  background(220);
}
int y = 10;
void keyTyped() {
  text("keyTyped() key " + str(key) + " keyCode " + keyCode, 10, y);
  y += 10;
  if (y > 200) {
    background(220);
    y = 10;
  }
}
```

# keyReleased

`keyReleased()`を定義すれば、キーが話されたたびに 呼ばれる関数です。

関連項目: [keyPressed()], [keyTyped()], [key], [keyCode], [keyCodes].

```example
void setup() {
  size(400, 200);
  fill(0);
  textSize(10);
  background(220);
}
int y = 10;
void keyReleased() {
  text("keyReleased() key " + str(key) + " keyCode " + keyCode, 10, y);
  y += 10;
  if (y > 200) {
    background(220);
    y = 10;
  }
}
```

# keyCodes

以下のキーの条件を調べるときに先に`key == CODED`を確かめなければなりません。 [CODED]に参照。

*   矢印キー: [UP], [DOWN], [RIGHT], [LEFT].
*   [ALT], [CONTROL], [SHIFT].

**注意**: Processing.jsではブラウザの環境によって使えないキーコードがあります。 以下のスケッチで確認ください。

```example
// Keycodes
void setup() {
  size(400, 200);
  textSize(30);
  textFont(loadFont("fixed"));
  fill(0);
}

void draw() {
  background(220);
  if (keyPressed) {
    text("keyPressed", 10, 30);
    String label;
    if (key == CODED) {
      label = "keyCode " + str(keyCode) + " ";
      switch (keyCode) {
        case UP: label = label + "UP"; break;
        case DOWN: label = label + "DOWN"; break;
        case LEFT: label = label + "LEFT"; break;
        case RIGHT: label = label + "RIGHT"; break;
        case ESC: label = label + "ESC"; break;
        case ENTER: label = label + "ENTER"; break;
        case SHIFT: label = label + "SHIFT"; break;
        case ALT: label = label + "ALT"; break;
        case CONTROL: label = label + "CONTROL"; break;
        case RETURN: label = label + "RETURN"; break;
        case ENTER: label = label + "ENTER"; break;
        case DELETE: label = label + "DELETE"; break;
        case BACKSPACE: label = label + "BACKSPACE"; break;
      }
      text(label, 10, 100);
    } else {
      label = "key '" + str(key) + "'";
      text(label, 10, 100);
    }
    return;
  }
}
```

# UP

上の矢印キーのコード。一覧は[keyCodes]に参照。 `keyCode == UP`を調べる先に`key == CODED`を確かめなければなりません。

関連項目: [keyCode], [keyCodes].

# DOWN

下の矢印キーのコード。一覧は[keyCodes]に参照。 `keyCode == DOWN`を調べる先に`key == CODED`を確かめなければなりません。

関連項目: [keyCode], [keyCodes].

# ALT

「Alt」キーのコード。 `keyCode == ALT`を調べる先に`key == CODED`を確かめなければなりません。

関連項目: [keyCode], [keyCodes].

# CONTROL

「Ctrl」キーのコード。 `keyCode == CONTROL`を調べる先に`key == CODED`を確かめなければなりません。

関連項目: [keyCode], [keyCodes].

# SHIFT

「Shift」キーのコード。 `keyCode == SHIFT`を調べる先に`key == CODED`を確かめなければなりません。

関連項目: [keyCode], [keyCodes].

# BACKSPACE

「Backspace」キーのコード。

関連項目: [keyCode], [keyCodes].

# TAB

「Tab」キーのコード。

関連項目: [keyCode], [keyCodes].

# ENTER

「Enter」キーのコード。

関連項目: [keyCode], [keyCodes].

# RETURN

「Return」キーのコード。

関連項目: [keyCode], [keyCodes].

# ESC

「Esc」キーのコード。

関連項目: [keyCode], [keyCodes].

# DELETE

「Delete」キーのコード。

関連項目: [keyCode], [keyCodes].

# CODED

[keyCode]の値を調べるときに先`key == CODED`を確かめる必要なときがあります。 詳しく[keyCodes]に参照。

関連項目: [key], [keyCodes].

# loadImage

`loadImage()`は画像のデートを読み込んでいます。ないProcessing.jsでは
ファイルシステムにアクセスできないので、画像データはサーバからダウンロード されます。ダウンロードは時間かかる場合があるので、`@pjs
preload`の命令が 必要です。

```prerender
/* @pjs preload="/static/Walker44.png"; */
PImage walker = loadImage("/static/Walker44.png");
image(walker, 10, 10, 80, 80);
```

関連項目: [@pjs preload][preload], [image()], [createImage()].

# PImage

画像の形。

関連項目: [loadImage()], [image()].

# PAudio

音のデータ。

```prerender
PAudio sound = loadSound("/static/explosion.ogg");

void mouseClicked() {
  sound.play();
}

void draw() {
  if (sound.isPlaying()) {
    background(50);
  } else {
    background(220);
  }
}
```

**注意**：標準のProcessing.jsに存在しない。

関連項目: [音のギャラリー][SoundGallery]

# loadSound

音のデータをロードする。 [PAudio]に参照

**注意**：標準のProcessing.jsに存在しない。

# pixels

**画像データ**: [PImage]のフィルドとして画像データを保存します。

```prerender
PImage img = createImage(60, 60, RGB);
for (int i = 0; i < img.pixels.length; i++) {
  int x = int(i/60);
  int y = int(i % 60);
  img.pixels[i] = color(dist(x, y, 0, 0)/sqrt(2*60*60)*255);
}
image(img, 20, 20);
```

# @pjs preload {#ref-preload}

`@pjs preload`はProcessing.jsでは画像データを予めダウンロードするような
命令です。[loadImage()]で読み込む画像のファイルが全て`@pjs preload`で ファイル名の記述が必要です。

関連項目: [loadImage()], [image()].

```prerender
/* @pjs preload="/static/Walker44.png"; */
PImage walker = loadImage("/static/Walker44.png");
image(walker, 10, 10, 80, 80);
```

# @pjs {#ref-pjs}

Processing.jsのコンパイラーへの命令。

*   [@pjs preload][preload]

# imageMode

`imageMode()`は画像の移す位置を設定します。

*   `imageMode(CENTER)`は画像を写すときに中心点を使う設定します。
*   `imageMode(CORNER)`は画像を写すときに左上の角を使う設定します。
*   `imageMode(CORNERS)`は画像の左上と右下の角を使う設定します。

```prerender
/* @pjs preload="/static/baloon1-170x200.png"; */
// SpriteExample
PImage img = loadImage("/static/baloon1-170x200.png");
imageMode(CORNERS);
image(img, 50, 50, 85, 100);
```

```prerender
/* @pjs preload="/static/baloon1-170x200.png"; */
// SpriteExample
PImage img = loadImage("/static/baloon1-170x200.png");
imageMode(CORNER);
image(img, 50, 50, 85, 100);
```

```prerender
/* @pjs preload="/static/baloon1-170x200.png"; */
// SpriteExample
PImage img = loadImage("/static/baloon1-170x200.png");
imageMode(CENTER);
image(img, 50, 50, 85, 100);
```

# image

`image()`は画像データをキャンバスにスタンプのように写します。

呼び方:`image(img, x, y, width, height);`

*   x, y ---
    画像を写す座標。`imageMode`は`CENTER`の設定の場合、画像の中心の座標。`imageMode`は`CORNER`または`CORNERS`の設定の場合、画像の左上の角の座標。
*   width, height ---
    画像の縦幅や横幅。`imageMode`は`CORNERS`の場合は`width`と`height`ではなく、右下の角の座標として使われます。

関連項目: [loadImage()], [createImage()], [imageMode()].

# createImage

`createImage()`は新しい空画像を作ります。

```prerender
PImage img = createImage(60, 60, RGB);
for (int i = 0; i < img.pixels.length; i++) {
  int x = int(i/60);
  int y = int(i % 60);
  img.pixels[i] = color(dist(x, y, 0, 0)/sqrt(2*60*60)*255);
}
image(img, 20, 20);
```
