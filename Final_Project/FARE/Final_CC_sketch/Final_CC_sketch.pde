PFont mtaStyle;
String[] FARE = {"F", "A", "R", "E"}; //a string array that includes letters of "FARE"
color blu = #0039A6; //mta color for A and E express lines
color yellow = #FCCC0A; //mta color for F and R express lines
float angle = 0;
mtaLines F = new mtaLines(); //new objects for each letter for each method
mtaLines A = new mtaLines();
mtaLines R = new mtaLines();
mtaLines E = new mtaLines();
int posx;
int posy;

void setup() {
  size(1000, 1000); 
  background(0);
  smooth();
  mtaStyle = createFont("Helvetica", 60); //mta preferred font
}

void draw() {
  textFont(mtaStyle);
  textAlign(CENTER, CENTER);
  background(0);


  pushMatrix();
  fill(255);
  rect(posx, 400, 200, 200);
  posx = posx + 3;
  popMatrix();

  if (posx > 200) {  //if statements to show lines after meeting positional condition
    F.blueCircle1(); //calling the method and applying it so it shows
  }
  if (posx > 450) {
    A.yellowCircle1();
  }
  if (posx > 600) {
    R.blueCircle2();
  }
  if (posx > 850) {
    E.yellowCircle2();
  }

  if (360 > angle) {
    angle = 0;
  }
}

class mtaLines { //class for all ellipses
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
    text(FARE[0], 100, height/2);
    fill(0);
    text(FARE[1], 350, height/2);
    fill(255);
    text(FARE[2], 600, height/2);
    fill(0);
    text(FARE[3], 850, height/2);
  } else {
    F.blueCircle1();
  }
}
