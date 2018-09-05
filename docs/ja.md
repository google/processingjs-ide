# Processing.js {#ref-help}

* 夏期ワークショップ
  * [はじめに][WhackACircle0]
  * [◯たたき1][WhackACircle1]
  * [◯たたき1][WhackACircle2]
* 迷路を解く
  * [キャラクタを表示][Maze1]
  * [キャラクターを動かす][Maze2]
  * [壁の検出][Maze3]
  * [右手法][Maze4]
  * [ゴールの検出][Maze5]
  * [完成プログラム][Maze6]
* [索引][index]
* [デモ][Demos]
* [ゲーム][Games]

# はじめに {#ref-WhackACircle0}

今回は Scratch のようにブロックでコードを書くプログラミング言語ではなく、文字で書かれたプログラミング言語で、簡単なゲームを作ってみましょう。

このゲームは午前中に Scratch で作った「猫たたき」のように◯が現れたり消えたりして、◯をクリックできたら得点がもらえるゲームです。

```render
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
  maru(0, 0);
  maru(1, 0);
  maru(1, 1);
  maru(2, 1);
  maru(0, 2);
  maru(2, 2);
}
void draw() {
  exit();
}
```

## Processing って何？

Processing は絵などを描けるプログラミング言語です。アプリ開発などで広く使われている Java というプログラミング言語に近いので、Processing をマスターできたらあと一歩で Java でプログラムを書いて実際のエンジニアになれます。
Processing で作る「◯たたき」
では、本番に入って Processing のコードを書いてみましょう！

[◯たたき1][WhackACircle1]


# ステップ1 {#ref-WhackACircle1}

[前に戻る][WhackACircle0]
[◯たたき2][WhackACircle2]

# ステップ1 {#ref-WhackACircle2}

[前に戻る][WhackACircle1]

# キャラクターを表示 {#ref-Maze1}

まずは迷路を表示しましょう。 
下にある「読み込む」ボタンを押してから画面の左上にある
「実行」ボタンをおしましょう。

```example
/* @pjs preload="/static/labyrinth1.png"; */
PImage imgLabyrinth = loadImage("/static/labyrinth1.png");
size(360, 360);  // キャンバスの大きさの設定
image(imgLabyrinth, 1, 1, 360, 360); // 迷路の表示
```

そして、キャラクターを表示しましょう。キャラクターはマウスのカーソル
のところに表示されます。Processing.jsでは画像はスクラッチのスプライトのよう
ではなく、スタンプのようなものです。なので、もともとの背景を壊さないように
[get()]を使って画像を保存して、あと背景を回復をしなければなりません。

```example
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

次は[キャラクターを動かす][Maze2]

# キャラクターを動かす {#ref-Maze2}

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

キャラクターは壁を無視して動いてます。
`imgSave = get(...)`や`image(imgSave,...)`をしなければ、キャラクターは壁に当たると壁を消して穴を開けてしまいます。
これは、実際には壁ではなくてただの背景画像が表示されているだけだからです。壁が実際にあるように見せるのが、プログラマの仕事です。

次は[壁の検出][Maze3]

# 壁の検出 {#ref-Maze3}

[前に戻る][Maze2]

壁を検出するには[get()]関数を利用して、指定した位置のピクセルの色を調べます。[imageMode]([CENTER])の設定によって、キャラクターの位置はスタンプの中心を示すようになるので、キャラクターの進行方向の前の位置を調べましょう。

その前に、dx, dyには常に０か１の値しか与えないようにします。たとえば、下は（０，１）、上は（０，−１）、右は（１，０）、左は（−１，０）です。最初の設定では上方向にしましょう。

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

次は[右手法][Maze4]

# 右手法 {#ref-Maze4}

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


完成スケッチこちらです。
```hidden
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
  } else if (wallAhead()) {
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
```

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

完成スケッチこちらです。

```hidden
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

他にも問題が残ってます。右に空き通路を検出すると、キャラクターはまた無限ループに入ってしまいます。今度の原因は、右に曲がったすぐ後に右側に壁がないとキャラクターがすぐにまた右に曲がってしまうことです。これを直すには、曲がってから数ピクセルはまっすぐに進む必要があります。

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

* `dx`, `dy`には-1/0/1の以外の値を与えない。
* 右側に空き通路を検出する関数はキャラクターが確実に入れる広さか確認する。

次は[ゴールの判定][Maze5]

# ゴールの判定 {#ref-Maze5}

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

完成スケッチこちらです。

```hidden
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

次は[完成プログラム][Maze6]

# 完成プログラム {#ref-Maze6}

[前に戻る][Maze5]

```example
/* @pjs preload="/static/labyrinth4.png"; */
/* @pjs preload="/static/Walker44.png"; */
PImage imgLabyrinth = loadImage("/static/labyrinth4.png");
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

# プログラミング体験ワークショップ {#ref-tts-workshop}

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

``` prerender
// キャンバスの大きさを設定する。
size(150, 150);
// キャンバスをホワイトで塗る
background(255);
// 今度描く色は黒に設定する。
fill(0);
// 四角を描く。
rect(25, 25, 100, 100);
```

# ステップ1 {#ref-step1}

今回のワークショップのテーマはコンピューターに言葉を話させることです。こちらのプログラムを入力してみましょう。

```example
// 「こんにちは」と話して。 
speak("こんにちは");
```

ここに書いてある2行のうち、「//」 から初めの行は人間への説明です。コンピュータはこちらを無視しますので入力を省略しても大丈夫です。コンピューターへの命令は２行目のみです。

```
speak("こんにちは");
```

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

* 「`String yotei[]`」 の「`[]`」は 「ふくすうの言葉 (String) を記憶する変数を作ります、その変数の名前は 「`yotei`」 です」 という意味です。
* 「`{`」 と「`}`」で覚えてほしい言葉は囲まれています。
* 「`yotei[0]`」と「`yotei[1]`」はふくすうの覚えてるのものから思い出す命令です。「`[0]`」は1つ目と「`[1]`」は二つ目を指します。というわけで、覚えているものは０から数えます。
* 「`yotei.length`」は配列の長さといい、覚えているものの数という意味です。

次は[ステップ4][step4]に進みましょう。

# ステップ4：「いつだれがどこでどうした」ゲーム {#ref-step4}

[ステップ3][step3]に戻る。

今回はいままでのステップで学んだことを活かして「いつだれがどこでどうした」というゲームを作ってみましょう。プログラムは長くなりましたので、タイピング代わりにヘルプの画面で
「トップ」→「ステップ4」を押してから「読み込む」ボタンを押してプログラムを読み込みましょう。

```example
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
最後の2つの数は横幅と高さを表しています。例えば、縦の長い丸を描いてみましょう。
顔に似ているでしょうか？

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

口と目を前と同じように`ellipse()`を使いましょう。次の見本のプログラムに進む前に
自分で目と口を描いてみましょう。

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

プログラムの実行中でユーザの入力に対応するにはいくつかの方法ありますが、
こちらで**イベント**を紹介します。ユーザーはマウスクリックしたときに
[mouseClicked()]という関数が呼ばれます。

```example
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
```

マウスイベントについてもっと詳しくは[マウス][Mouse]に参考ください。

# マウス {#ref-Mouse}

マウスの入力は[イベント][Events]によって行う。イベントのリスト:

* [mouseClicked()] マウスはクリックされたとき
* [mousePressed()] マウスのボタンが押されたとき
* [mouseReleased()] マウスのボタンが話されたとき
* [mouseMoved()] マウスが動いたとき
* [mouseDragged()] マウスが押されたままに動いたとき
* [mouseOver()] マウスのカーソルはキャンバスに入ったとき
* [mouseOut()] マウスのカーソルがキャンバスから離れたとき
* [mouseX], [mouseY] マウスのXとY座標
* [mouseButton] マウスイベントの関数の中は押されたボタンを表す

# 形状ゲーム {#ref-ShapeGame}

ここまでに勉強してきたことを合わせて簡単のゲームを作ってみましょう。
キャンバスに形状を３つ書いて、英語で形状の名前を話して、ユーザー
に形を当てましょう。正しければ「ピンポン」、間違っていれば「ぶぶ」と
コンピューターに話させましょう。

```example
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

* [draw()]
* [noLoop()]
* [loop()]

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

# frameRate

`frameRate(x)`は`setup()`の中で使える関数で、`draw()`が呼ばれる頻度を設定します。
括弧の中には`draw()`関数を1秒間に何回呼ぶかを指定します。
たとえば、`frameRate(10)`を実行すると、`draw()`の実行が終わってから
次に`draw()`を呼ぶまで0.1秒待ちます。`frameRate(1)`では1秒待ちます。

# インデックス {#ref-index}

## 実行

`setup()`と`draw()`はプログラムの中で定義する必要があります。

* [void setup() {...}][setup] 設定するための関数
* [void draw() {...}][draw] アニメーションのフレームを描くための関数
* [exit()] 実行を終了する

## アニメーション

* [noLoop()] アニメーションの繰り返しを止める
* [loop()] アニメーションの繰り返しを再開する
* [millis()] 実行時間をミリ秒単位で返す

## キャンバス

* [background()] キャンバスを色で塗る
* [size()] キャンバスの大きさを設定する
* [dist()] 2点間の距離を計算する
* [copy()] 画像の一部を別の位置にコピーする

## 図形

* [ellipse()] 楕円
* [rect()] 長方形
* [triangle()] 三角形
* [line()] 直線
* [arc()] 円弧

## 筆の設定

* [fill()] 塗りつぶしの色を設定する
* [stroke()] ペンの色を設定する
* [strokeCap()] ペンの端の形を設定する
* [strokeWeight()] ペンの太さを設定する

## 画像

* [image()] 画像を写す
* [loadImage()], [@pjs preload][preload] 画像データを読み込む
* [createImage()] 空画像を作る
* [get()] 画像データをキャンバスから抽出する

## 文字

* [textSize()] 文字の大きさを設定する
* [text()] 文字を表示する
* [textFont()] 字体を設定する
* [loadFont()] 字体を読み込みする

## スピーチ

* [speak()] 声で話す

## [マウス][Mouse]

* [mouseClicked()] マウスのボタンがクリックされたとき
* [mousePressed()] マウスのボタンが押されたとき
* [mouseReleased()] マウスのボタンが離されたとき
* [mouseOver()] マウスがキャンバス内に入ったとき
* [mouseOut()] マウスがキャンバスの外に出たとき
* [mouseX], [mouseY], [pmouseX], [pmouseY] マウスのX座標とY座標
* [mouseButton] マウスイベント関数の中で押されたボタンを表す
* [cursor()] マウスカーソルの形を変える

## キーボード

* [keyPressed()], [keyReleased()], [keyTyped()] キーボードのイベント関数
* [key], [keyCode], [keyPressed] 押されたキーの変数
* [keyCodes] キーコードの一覧

## データ

* 単純な型
  * [int], [float], [boolean], [byte], [short], [double], [char]
* [Array]
  * [append()], [concat()]
* [HashMap]
  * [entrySet()]
* [PImage] 画像

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

## 数学関数

* [abs()]
* [ceil()], [floor()], [round()]
* [sin()], [cos()], [tan()]

# size

`size(x_size, y_size)`はキャンバスの大きさを定めます。スケッチの実行の最初に一回だけ呼ばなければいけない関数です。

```prerender
// キャンバスの大きさを300×200に設定します。
size(300, 200);
// キャンバスをピンクで塗りつぶします。
background(250, 200, 200);
```

# background

キャンバスを一つの色で塗りつぶます。色を指定する方法は2つあります。
1個の数値を指定した場合は、グレースケールで明るさを指定します。
0は黒、255は白、その中間は数値に応じた灰色を意味します。例えば

```prerender
// キャンバスを灰色に塗ります。
background(150);
```

3個の数値を指定した場合は、RGBモデルで任意の色を指定できます。
R・G・Bそれぞれを0から255までの数値で指定します。

```prerender
// キャンバスを赤で塗ります。
background(255, 0, 0);
```

# loop

スケッチの実行ループが止まっているときに`loop()`を呼ぶと、実行ループを再開します。

## 参考

* [draw()]
* [noLoop()]

# noLoop

スケッチの実行ループを停止します。
なお、マウスなどのイベントが発生したときは対応する関数が呼ばれるので、
スケッチの実行が完全に停止するわけではありません。

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

* [JumpingBall]
* [TouchTheNumber]
* [形状ゲーム][ShapeGame]

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

* x --- 中心のX座標
* y --- 中心のY座標
* width --- 楕円の幅
* height --- 楕円の高さ

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

`fill()`は筆の中の色を設定する。筆には２つの色が設定できます。中の色は形状の中に塗ります。
端の色は形状の堺麺を描く時に使います。

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

* `true` 「真」
* `false` 「偽」

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

ユーザがマウスのボタンを押すと`mousePressed()`関数が呼ばれます。
この関数を定義すれば、「マウスで絵を描く」のような操作が実装できます。

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

ユーザがマウスのボタンを離すと`mouseReleased()`関数が呼ばれます。
この関数を定義すれば、「マウスで絵を描く」のような操作が実装できます。

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

[マウスイベント][Mouse]の中で使い、押されたボタンを表す。
押されたボタンが左ボタンのときは[LEFT]に、右ボタンがときは[RIGHT]になる。

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

関連項目: [mouseX], [pmouseX], [pmouseY], [mousePressed()], [mouseReleased()], [mouseClicked()].

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

関連項目: [mouseX], [pmouseX], [pmouseY], [mousePressed()], [mouseReleased()], [mouseClicked()].

```prerender
void draw() {
  ellipse(mouseX, mouseY, 5, 5);
}
```

# LEFT

**マウス**: `LEFT`は[mouseButton]を参照するときにマウスの左ボタンを表す。

関連項目: [mouseButton], [mousePressed()], [mouseReleased()], [mouseClicked()].

**キーボード**: 左の矢印キーのコード。一覧は[keyCodes]に参照。
`keyCode == LEFT`を調べる先に`key == CODED`を確かめなければなりません。

関連項目: [keyCode], [keyCodes].


# CENTER

**マウス**: `CENTER`は[mouseButton]を参照するときにマウスの真ん中ボタンを表す。

関連項目: [mouseButton], [mousePressed()], [mouseReleased()], [mouseClicked()].

# RIGHT

**マウス**: `RIGHT`は[mouseButton]を参照するときにマウスの右ボタンを表す。

関連項目: [mouseButton], [mousePressed()], [mouseReleased()], [mouseClicked()].

**キーボード**: 右の矢印キーのコード。一覧は[keyCodes]に参照。
`keyCode == RIGHT`を調べる先に`key == CODED`を確かめなければなりません。

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

* `ROUND` - 丸い
* `SQUARE` - 四角い。線は座標で表している点までぴったり及びます。
* `PROJECT` - 四角い。線は座標で表している点から筆の大きさの部分まで出ています。

# ROUND

線を描く筆を丸い形に設定します。
[strokeCap()]を見てください。

```prerender
strokeCap(ROUND);
strokeWeight(20);
line(20, 20, 80, 80);
```

関連項目: [strokeCap], [strokeWeight], [stroke], [SQUARE], [PROJECT].

# SQUARE

線を描く筆を四角い形に設定します。
[strokeCap()]を見てください。

```prerender
strokeCap(SQUARE);
strokeWeight(20);
line(20, 20, 80, 80);
```

関連項目: [strokeCap], [strokeWeight], [stroke], [ROUND], [PROJECT].

# PROJECT

線を描く筆を四角い形に設定します。[SQUARE]と比べて、筆の大きさは線の先端に出ています。
[strokeCap()]を見てください。

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

# text

`text()`はキャンバスに言葉を表示します。表示する位置を座標で指定します。

```prerender
size(150, 100); fill(0); textSize(20);
text("こんにちは", 20, 50);
```

関連項目: [textSize], [fill], [textFont].

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

ループの一つの種類。[while]と違って、初めて条件を調べる前に一回ループの本体
を実行する。

```prerender
do {
  fill(0);
  text("一回だけ実行する!", 5, 50);
} while (false);
```

関連項目: [while], [for], [break], [continue].

# if

条件付き実行する。条件が満たされたら、条件付きのブロックを実行する。
条件は満たさなければ、[else]のブロックを実行する。[else]のブロックはなければ、
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

条件付きの実行の[if]のブロックに条件が満たされないときに実行するブロック
指定する。

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

`switch`文は一つの変数の値を検出して、複数の値に対して比べて多重分岐から
一つの分岐を実行する。

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

* [for]
* [while]
* [do]

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

# LabyrinthSolver

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
 
# LabyrinthMapper

このプログラムは迷路の画像を解析して地図を作っていきます。

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

# LabyrinthSearch

このプログラムは最短の道を探しています。

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

# LabyrinthBacktrace

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

# 配列 {#ref-Array}

`Array`は配列といい、データのリストを持っている。複数のデータを保存するとき、
番号を使って取り出せるのだ。

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

`HashMap`はハッシュテーブルデータ構造である。データはキーと値の組で保存され、
キーに対して値を素早く参照できる。

```prerender
HashMap<Integer, String> map = new HashMap();
map.put(123, "XYZ");
fill(0); text(map.get(123), 10, 30);
```

関連項目：[get], [put], [entrySet].

# get

`get()`は複数の意味持っている。

* [HashMap]の場合、キーに対して値を取り出す。
* 画像の場合は、ピクセルデートを読み込みます。

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
// 抽出された色で四角を描く。
rect(72, 0, 28, 28);
```

# put

`put`は複数の意味を持っている。

* [HashMap]の場合、キーに対して与えられた値を保存する。

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

`textFont`は書体デート(フォント)を設定する。すぐは見える効果はないが、
次の[text]の呼び出しに影響を与える。

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

関連項目: [fill()], [background()], [red()], [green()], [blue()], [hue()], [saturation()], [brightness()], [colorMode()].

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

呼び方:`arc(x, y, width, height, start, stop)`

* x, y --- 楕円の中心の座標。
* width, height --- 楕円の横幅と縦幅。
* start, stop --- 弧の角度を指定する。

関連項目: [ellipse()].


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

オブジェクトに対して、文字列を期待する文脈で呼ばれるメソッド。
例えば、`str()`にオブジェクトを渡されたとき。

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

* x, y --- コピーの元の四角の左上の角のX,Y座標
* w, h --- コピーする資格の横幅と縦幅
* dx, dy --- コピーの目的地の四角の左上の角のX,Y座標
* dw, dh --- コピーの目的地の横幅と縦幅

# key

最後に押された文字または記号を文字列として保存している変数。
矢印などの文字ではないキーの判断

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

最後に押されたキーのコード。通常イベント関数で使います。
コードの一覧は[keyCodes]に参照。

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

**関数**: `keyPressed()`を定義すれば、キーが押されたたび
に呼ばれる関数です。

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

`keyTyped()`を定義すれば、キーボードの文字または数字や記号のキー
押されたときに呼ばれる関数です。

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

`keyReleased()`を定義すれば、キーが話されたたびに
呼ばれる関数です。

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

[keyCode]の値を調べるときに次のキーコードを使えます。

* [BACKSPACE], [TAB], [ENTER], [RETURN], [ESC], [DELETE].

以下のキーの条件を調べるときに先に`key == CODED`を確かめなければなりません。
[CODED]に参照。

* 矢印キー: [UP], [DOWN], [RIGHT], [LEFT].
* [ALT], [CONTROL], [SHIFT].

**注意**: Processing.jsではブラウザの環境によって使えないキーコードがあります。
以下のスケッチで確認ください。

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
      label = "key " + str(key) + " ";
      switch (keyCode) {
        case RETURN: label = label + "RETURN"; break;
        case ENTER: label = label + "ENTER"; break;
        case DELETE: label = label + "DELETE"; break;
        case BACKSPACE: label = label + "BACKSPACE"; break;
      }
      text(label, 10, 100);
    }
    return;
  }
}
```

# UP

上の矢印キーのコード。一覧は[keyCodes]に参照。
`keyCode == UP`を調べる先に`key == CODED`を確かめなければなりません。

関連項目: [keyCode], [keyCodes].

# DOWN

下の矢印キーのコード。一覧は[keyCodes]に参照。
`keyCode == DOWN`を調べる先に`key == CODED`を確かめなければなりません。

関連項目: [keyCode], [keyCodes].

# ALT

「Alt」キーのコード。
`keyCode == ALT`を調べる先に`key == CODED`を確かめなければなりません。

関連項目: [keyCode], [keyCodes].

# CONTROL

「Ctrl」キーのコード。
`keyCode == CONTROL`を調べる先に`key == CODED`を確かめなければなりません。

関連項目: [keyCode], [keyCodes].

# SHIFT

「Shift」キーのコード。
`keyCode == SHIFT`を調べる先に`key == CODED`を確かめなければなりません。

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

[keyCode]の値を調べるときに先`key == CODED`を確かめる必要なときがあります。
詳しく[keyCodes]に参照。

関連項目: [key], [keyCodes].

# loadImage

`loadImage()`は画像のデートを読み込んでいます。ないProcessing.jsでは
ファイルシステムにアクセスできないので、画像データはサーバからダウンロード
されます。ダウンロードは時間かかる場合があるので、`@pjs preload`の命令が
必要です。

```prerender
/* @pjs preload="/static/Walker44.png"; */
PImage walker = loadImage("/static/Walker44.png");
image(walker, 10, 10, 80, 80);
```

関連項目: [@pjs preload][preload], [image()], [createImage()].

# PImage

画像の形。

関連項目: [loadImage()], [image()].

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
命令です。[loadImage()]で読み込む画像のファイルが全て`@pjs preload`で
ファイル名の記述が必要です。

関連項目: [loadImage()], [image()].

```prerender
/* @pjs preload="/static/Walker44.png"; */
PImage walker = loadImage("/static/Walker44.png");
image(walker, 10, 10, 80, 80);
```

# @pjs {#ref-pjs}

Processing.jsのコンパイラーへの命令。

* [@pjs preload][preload]

# image

`image()`は画像データをキャンバスにスタンプのように写します。

関連項目: [loadImage()], [createImage()].

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

