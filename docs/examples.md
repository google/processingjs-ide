# ShowCoordinates

このスケッチはキャンバスの座標をお見せします。

```example
// ShowCoordinates
void setup() {
  size(300, 300);
  fill(0);
  textSize(30);
}

void draw() {
  background(220);
  int ox = 0, oy = 30;
  if (mouseX > 150) ox = -130;
  if (mouseY > 150) oy = -5;
  text("(" + mouseX + "," + mouseY + ")", mouseX+ox, mouseY+oy);
}
```
