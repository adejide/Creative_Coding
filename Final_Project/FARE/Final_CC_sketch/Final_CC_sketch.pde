PFont mtaStyle;
String[] FARE = {"F", "A", "R", "E"};
color blu = #0039A6;
color yellow = #FCCC0A;
float angle = 0;
mtaLines F = new mtaLines();
mtaLines A = new mtaLines();
mtaLines R = new mtaLines();
mtaLines E = new mtaLines();

void setup() {
  size(1000, 1000);
  background(0);
  smooth();
  mtaStyle = createFont("Helvitica", 60); 

  String[] fontList = PFont.list();
  println(fontList);
}

void draw() {
  textFont(mtaStyle);
  textAlign(CENTER, CENTER);

  F.blueCircle1();
  A.yellowCircle1();
  R.blueCircle2();
  E.yellowCircle2();
  
  if (360 > angle) {
    angle = 0;
  }
}

class mtaLines {
  int wid = 100;
  int hei = 100;
  float y = sin(radians(angle)) * height/2;

  void blueCircle1() {
    pushMatrix();
    noStroke();
    fill(blu);
    ellipse(100, height/2, wid, hei);
    popMatrix();
  }

  void yellowCircle1() {
    pushMatrix();
    noStroke();
    fill(yellow);
    ellipse(350, height/2, wid, hei);
    popMatrix();
  }
  
  void blueCircle2() {
    pushMatrix();
    noStroke();
    fill(blu);
    ellipse(600, height/2, wid, hei);
    popMatrix();
  }

void yellowCircle2() {
    pushMatrix();
    noStroke();
    fill(yellow);
    ellipse(850, height/2, wid, hei);
    popMatrix();
  }
}

void mouseClicked() {
  int value = 0;
  if (value == 0) {
    text("F", 100, height/2);
  } else {
    F.blueCircle1();
  }
}
