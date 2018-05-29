# Help {#ref-help}

This is online help. Any word can have a help entry.
You just need to have a `<div id="ref-keyword">`,
and then you can type **keyword** in the sketch editor,
put the cursor on it and press `[Help]` button and the
help entry will be shown.

# draw {#ref-draw}

`draw()` is a function that is repeatedly called during sketch execution. One can imagine the following top-level sketch execution loop:

		setup();
		while(noLoop() has not been called) {
			// Call with the frequency specifed by frameRate()
			draw();
		}

# setup {#ref-setup}

`setup()` is a function that is called once at the beginning of the sektch execution.

See also <a href='#ref-draw'>`draw()`</a>
