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
