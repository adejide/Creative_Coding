PFont mtaStyle;
String[] FARE = {"F", "A", "R", "E"}; //a string array that includes letters of "FARE"
String txt;
color blu = #0039A6; //mta color for A and E express lines
color yellow = #FCCC0A; //mta color for F and R express lines
float angle = 0;
mtaLines F = new mtaLines(); //new objects for each letter for each method
mtaLines A = new mtaLines();
mtaLines R = new mtaLines();
mtaLines E = new mtaLines();
int posx;
int posy;
float y = 0;

void setup() {
  size(1000, 1000); 
  background(0);
  smooth();
  mtaStyle = createFont("Helvetica", 60); //mta preferred font
  String[] lines = loadStrings("F.txt");
  txt = join(lines, "\n");
}

void draw() {
  textFont(mtaStyle);
  textAlign(CENTER, CENTER);
  background(0);

  fill(255);
  text(txt, 0, 1000-y, width, height);
  y++;
  
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
  if (posx > 700) {
    R.blueCircle2();
  }
  if (posx > 950) {
    E.yellowCircle2();
  }

  if (360 > angle) {
    angle = 0;
  }
  
  mouseClicked();
}

class mtaLines { //class for all ellipses
  int wid = 100; //width size
  int hei = 100; //height size
  float y = sin(radians(angle)) * height/2; //trying to implement oscillation

  void blueCircle1() { //method for one of the mta line's cirlce
    pushMatrix();
    noStroke();
    fill(blu); //fill alpha
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

void mouseClicked() { //mouse event to show letters for the word "FARE"
  int value = 0;
  if (value == 0) { //This is always true, which means that something will take place when the mouse is clicked
    fill(255);
    text(FARE[0], 100, height/2);
    fill(0);
    text(FARE[1], 350, height/2);
    fill(255);
    text(FARE[2], 600, height/2);
    fill(0);
    text(FARE[3], 850, height/2);
  } 
}
