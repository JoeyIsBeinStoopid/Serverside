import processing.net.*;
Server elthingy;
String[] BString = new String[1];

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  elthingy = new Server(this, 5204);
  noStroke();
  textSize(10);
  BString[0] = "";
}

void draw() {
  background(255);
  fill(100);
  elthingy.write(BString[0]);
  fill(random(360), 100, 100);
  ellipse(random(width), random(height), random(width/2), random(height/2));
  rect(random(width), random(height), random(width/2), random(height/2));
  Client thisClient = elthingy.available();
  if (thisClient !=null) {
    String whatClientSaid = thisClient.readString();
    if (whatClientSaid != null) {
      println(thisClient.ip() + "t" + whatClientSaid);
    }
  }
}

void keyReleased() {
  if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      BString[0] = BString[0].substring(0, max(0, BString[0].length()-1));
      break;
    case TAB:
      BString[0] += "    ";
      break;
    case ENTER:
      saveStrings("yolo.txt", BString);
      println("Saved.");
      break;
    case RETURN:
      // comment out the following two lines to disable line-breaks
      BString[0] += "\n";
      break;
    case ESC:
    case DELETE:
      break;
    default:
      BString[0] += key;
    }
  }
}

