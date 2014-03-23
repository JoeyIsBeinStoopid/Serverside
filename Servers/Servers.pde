import processing.net.*;
Server elthingy;
server els;
String[] BString = new String[1];
String codename = "";

void setup() {
  elthingy = new Server(this, 5204);
  els = new server();
  els.display();
}

void draw() {
  background(0);
  els.run();
  fill(255);
  textSize(35);
}



