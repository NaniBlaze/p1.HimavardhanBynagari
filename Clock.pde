
class DigitalClock extends Clock {
  int fontSize;
  float x, y;
 
  DigitalClock(int _fontSize, float _x, float _y) {
    fontSize = _fontSize;
    x = _x;
    y = _y;
  }
 
  void getTime() {
    super.getTime();
  }
 
  void display() {
    textSize(30);
    textAlign(CENTER);
    text (nf(h,2) + ":" + nf(m, 2) + ":" + nf(s, 2), x, y);
  } 
}
 
class Clock {
  int h, m, s;
  Clock() {
  }
 
  void getTime() {
    h = hour();
    m = minute();
    s = second();
  }
}
