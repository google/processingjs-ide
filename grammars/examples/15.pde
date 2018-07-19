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
