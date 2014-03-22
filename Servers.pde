import processing.net.*;
Server elthingy;
int elc;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  elthingy = new Server(this, 5204);
  elc = 0;
}

void draw() {
  background(elc);
  elc++;
  elthingy.write(elc);
  Client thisClient = elthingy.available();
  if (thisClient !=null) {
    String whatClientSaid = thisClient.readString();
    if (whatClientSaid != null) {
      println(thisClient.ip() + "t" + whatClientSaid);
    } 
  }
}
