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
