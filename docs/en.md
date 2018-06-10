# Help {#ref-help}

This is online help. Any word can have a help entry.
You just need to have a `<div id="ref-keyword">`,
and then you can type **keyword** in the sketch editor,
put the cursor on it and press `[Help]` button and the
help entry will be shown.

    // This is a simple sketch. 
    speak('こんにちは');

This is also `code`.

See also <a href='#ref-index'>index</a> and <a href='#ref-draw'>draw</a>.

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

See also <a href='#ref-draw'>draw()</a>

# Help index {#ref-index}

## A

## B

## C

## D

* <a href='#ref-draw'>draw()</a>

## N

* <a href='#ref-noLoop'>noLoop()</a>

## L

* <a href='#ref-loop'>loop()</a>

## S

* <a href='#ref-setup'>setup()</a>


