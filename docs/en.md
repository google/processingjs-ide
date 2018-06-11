# Help {#ref-help}

Welcome to the Processing Workshop. Let's make computer speak!
Let's start with a simple example. See if you can make the
computer greet you. Let's get started. Go to [step1].

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

    String name = "たろう";
    speak("こんにちは、" + name)

Next, proceed to the [step3] or go back to [step1].

# Step 3 {#ref-step3}

Let's get familiar with a loop. A loop is some instruction that
we would like the computer to execute multiple times. For example,
let the computer count from 1 to 5:

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
      fill(0);
      ellipse(mouseX, mouseY, 10, 10);
    }

Next, proceed to the [step5] or go back to [step3].

# Step 5 {#ref-step5}

Nothing here yet.

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

* [draw()]
* [loop()]
* [noLoop()]
* [setup()]
* [speak()]


# speak

The function `speak()` makes the computer produce some speech output. For example:

    speak("こんにちは");

In order to specify a different language, add a second argument:

    speak("Hello", "en");
    speak("Привет", "ru");
