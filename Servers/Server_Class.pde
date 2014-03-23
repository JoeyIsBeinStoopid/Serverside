class server {
  server() {
  }

  void display() {
    size(500, 500);
    colorMode(HSB, 360, 100, 100);
    noStroke();
  }

  void run() {
    Client thisClient = elthingy.available();
    background(255);
    fill(random(360), 100, 100);
    ellipse(random(width), random(height), random(width/2), random(height/2));
    rect(random(width), random(height), random(width/2), random(height/2));
    if (thisClient != null) {
      BString[0] = thisClient.readString();
      //println(BString[0]);
      if (thisClient.readString() != BString[0]) {
        if (thisClient.readString() != "") {
          elthingy.write(BString[0]);
        }
        else
        {
          println("I'm broken");
        }
      }
    }
    if (BString[0] != null)
    {
      fill(200);
      BString[0] = BString[0];
      BString[0] = thisClient.readString();
      //elthingy.write(BString[0]);
      text(BString[0]+(frameCount/10 % 2 == 0 ? "|" : ""), 35, 45);
      println(BString[0]);
    }
  }
}

