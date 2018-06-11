# Help {#ref-help}

Welcome to the Processing Workshop. Let's make computer speak!
Let's start with a simple example. See if you can make the
computer greet you. Let's get started.

* Start a tutorial from [step1].
* Look at some [Demos].
* Play some [Games].

# Step 1 {#ref-step1}

In this section, we will get familiar with how to make the computer
speak. We have a [speak()] method for that.

    // JustSpeak. This is a simple sketch. 
    speak("こんにちは");

Next, proceed to the [step2].

# Step 2 {#ref-step2}

In this section, we will get familiar with variables.
A variable has a name, and it can hold a value.
Variable _assignment_ can change the value that the variable holds.
Let's put your name in a variable.

    // GreetWithName
    String name = "たろう";
    speak("こんにちは、" + name)

Next, proceed to the [step3] or go back to [step1].

# Step 3 {#ref-step3}

Let's get familiar with a loop. A loop is some instruction that
we would like the computer to execute multiple times. For example,
let the computer count from 1 to 5:

    // Count5
    for (int i = 1; i <= 5; i++) {
      speak(str(i));
    }

Next, proceed to the [step4] or go back to [step2].

# Step 4 {#ref-step4}

To make our sketch a little interactive, we need a way to know
that some user input happened, for example, when the user clicked
mouse. Luckily, Processing.js handles such input events, and can
call a function whenever an input event happened. The only thing
we need to provide is a specially named function. For mouse clicks,
we need to have a function named [mouseClicked()].

    void mouseClicked() {
      ellipse(mouseX, mouseY, 10, 10);
      speak("ぶ");
    }

    void setup() {
      size(300, 300);
      background(200);
      fill(0);
    }

Next, proceed to the [step5] or explore the demo [Drawing].

# Step 5 {#ref-step5}

Let's do something differend depending on the where the user clicked.

    void mouseClicked() {
      float dist = sqrt((mouseX - 100)*(mouseX - 100) + (mouseY - 100)*(mouseY - 100));
      if (dist <= 40) {
        speak("ピンポン");
      } else {
        speak("ぶぶ");
      }
    }

    void setup() {
      size(300, 300);
      background(200);
      stroke(0);
      ellipse(100, 100, 80, 80);
    }

Next, proceed to the [step6].

# Step 6 {#ref-step6}

Let's play a simple game to learn some English words.

    String shapes[] = new String[3];
    shapes[0] = "circle";
    shapes[1] = "square";
    shapes[2] = "triangle";

    void mouseClicked() {
      int x = int(mouseX/100);
      if (x != next) {
        speak("ぶぶ");
        speak("もう一回いいます");
        speak(shapes[next], "en");
      } else {
        speak("ピンポン");
        next = -1;
      }
    }

    void setup() {
      size(300, 210);
      background(200);
      stroke(0);
      ellipse(60, 125, 50, 50);
      rect(120, 100, 50, 50);
      triangle(240, 100, 210, 150, 270, 150);
    }

    int next = -1;

    void draw() {
      if (next == -1) {
        speak("つぎの問題");
        next = int(random(3));
        speak(shapes[next], "en");
      }
    }

Congratulations, the tutorial is over!
You can go back to [step5] or explore some [Demos].

# Drawing

Other events can be used instead. Let's do some drawing:


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

# draw

`draw()` is a function that is repeatedly called during sketch execution. One
can imagine the following top-level sketch execution loop:

    setup();
    while(noLoop() has not been called) {
      // Call with the frequency specifed by frameRate()
      draw();
    }

# setup

`setup()` is a function that is called once at the beginning of the sektch execution.

See also [draw()].

# Help index {#ref-index}

## Execution loop

* [draw()]
* [setup()]
* [loop()]
* [noLoop()]
* [setup()]

## Drawing shapes

* [background()]
* [rect()]
* [ellipse()]
* [line()]

## Drawing setup

* [fill()]
* [stroke()]

## Sounds and speech

* [speak()]

##


# speak

The function `speak()` makes the computer produce some speech output. For example:

    speak("こんにちは");

In order to specify a different language, add a second argument:

    speak("Hello", "en");
    speak("Привет", "ru");

# size

Set the canvas size. By default, the canvas is initialized to 100x100, which is
pretty small.  You may call the function `size(width, height)` from your
[setup()] function in order to set a different canvas size.

    void setup() {
      size(300, 300);
      background(200);
    }

# background

Fills the canvas with a specified color. There are two ways to specify a color: grayscale and full color. For grayscale, pass one number between 0 and 255:

    // Fill the canvas with dark gray.
    background(100); 

For full color, use three numbers between 0 and 255 specifying Red, Green, and Blue respecitively.

    // Fill the canvas with red.
    background(255, 0, 0);

`background()` is a handy functions to clean up the previous frame before
drawing a next state of an animation. So it is handy to have at the beginning of [draw()].

# mouseX

A variable that holds the current X coordinate of the mouse cursor.

See also [Mouse].

# mouseY

A variable that holds the current Y coordinate of the mouse cursor.

See also [Mouse].

# Mouse handling {#ref-Mouse}

You have a few ways to handle mouse interaction in a Processing.js sketch:

* Polling: [mouseX], [mouseY]
* Events: [mousePressed()], [mouseReleased()] [mouseClicked()]

# mouseReleased

If you define a function `mouseReleased()`, then it will be called every time
the user releases the mouse button.

See [Mouse]

# mousePressed

If you define a function `mousePressed()`, then it will be called every time
the user presses the mouse button.

See [Mouse]

# mouseClicked

If you define a function `mouseClicked()`, then it will be called after the user
pressed and released a mouse button.

See [Mouse]

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

    // TouchTheNumber3x3

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

# Demos

* [Drawing]
