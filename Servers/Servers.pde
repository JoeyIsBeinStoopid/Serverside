import processing.net.*;
Server elthingy;
server els;
String[] BString = new String[1];

void setup() {
  elthingy = new Server(this, 5204);
  els = new server();
  els.display();
}

void draw() {
  els.run();
}

