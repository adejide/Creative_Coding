import processing.sound.*;
SoundFile fTrain;
SoundFile aTrain;
SoundFile rTrain;
SoundFile eTrain;

PImage img;
PImage bg;

PFont mtaStyle;
String[] FARE = {"F", "A", "R", "E"}; //a string array that includes letters of "FARE"
String txt;
String txt_2;
String txt_3;
String txt_4;
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
int diam1 = 100; //width and height size
int diam2 = 100;
int diam3 = 100;
int diam4 = 100;
int i = 0;

void setup() {
  size(1000, 998);//background needed to be the same as image to have the bg 
  background(0);
  smooth();
  bg = loadImage("mta-cops.v1.cropped.jpg");
  img = loadImage("mta.jpg");
  mtaStyle = createFont("Helvetica", 60); //mta preferred font
  String[] lines = loadStrings("F.txt"); //from: https://www.nbcnewyork.com/news/local/Group-Uses-Sneaky-Advertising-to-Fight-MTAs-Fare-Beating-Crackdown-561292841.html
  String[] lines_2 = loadStrings("A.txt"); //from: https://www.vox.com/the-goods/2019/11/12/20959914/fare-evasion-costs-cities-millions
  String[] lines_3 = loadStrings("R.txt"); //from: https://newrepublic.com/article/155540/class-war-fare-dodging-crackdowns
  String[] lines_4 = loadStrings("E.txt"); //from: https://www.cityandstateny.com/articles/politics/new-york-city/can-you-stop-fare-evasion-without-criminalizing-poverty.html
  txt = join(lines, "\n");
  txt_2 = join(lines_2, "\n");
  txt_3 = join(lines_3, "\n");
  txt_4 = join(lines_3, "\n");
  fTrain = new SoundFile(this, "f2ndav.wav");
  fTrain.amp(0.2); // adjusts the volume
  aTrain = new SoundFile(this, "aat342.wav");
  aTrain.amp(0.1);
  //rTrain = new SoundFile(this, "ratqueensplaza.wav");
  //rTrain.amp(0.1);
  //eTrain = new SoundFile(this, "fast23ely.wav");
  //eTrain.amp(0.1);
  fTrain.loop();
  aTrain.loop();
  //rTrain.loop();
  //eTrain.loop();
  y = height;
}

void draw() {
  textFont(mtaStyle);
  textAlign(CENTER, CENTER);
  background(bg);

  pushMatrix();
  fill(255);
  image(img, posx, 250, width/2, height/2);
  img.resize(1000, 1000);
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
  
  pushMatrix();
  if (keyPressed) { //increases the size of the circles and triggers text
    if (key == 'f') {
      diam1++;
      fill(255);
      text(txt, 0, y, width, height*3.5); //the first text file will show
      y--;
    }

    if (key == 'a') {
      diam2++;
      fill(255);
      text(txt_2, 0, y, width, height*2.5);
      y--;
    }
    
    if (key == 'r') {
      diam3++;
      fill(255);
      text(txt_3, 0, y, width, height*2.5);
      y--;
    }
    
    if (key == 'e') {
      diam4++;
      fill(255);
      text(txt_4, 0, y, width, height*2.5);
      y--;
    }
    
     if (key == ENTER) {
       draw();
    } 
  }
  popMatrix();
}

class mtaLines { //class for all ellipses
  float y = sin(radians(angle)) * height/2; //trying to implement oscillation

  void blueCircle1() { //method for one of the mta line's cirlce
    pushMatrix();
    noStroke();
    fill(#FF6319); //fill alpha
    ellipse(100, height/2, diam1, diam1);
    popMatrix();
  }

  void yellowCircle1() {
    pushMatrix();
    noStroke();
    fill(blu);
    ellipse(350, height/2, diam2, diam2);
    popMatrix();
  }

  void blueCircle2() {
    pushMatrix();
    noStroke();
    fill(yellow);
    ellipse(600, height/2, diam3, diam3);
    popMatrix();
  }

  void yellowCircle2() {
    pushMatrix();
    noStroke();
    fill(blu);
    ellipse(850, height/2, diam4, diam4);
    popMatrix();
  }
}

void mouseClicked() { //mouse event to show letters for the word "FARE"
  int value = 0;
  if (value == 0) { //This is always true, which means that letters will show when the mouse is clicked or not
    fill(255);
    text(FARE[0], 100, height/2);
    fill(255);
    text(FARE[1], 350, height/2);
    fill(0);
    text(FARE[2], 600, height/2);
    fill(255);
    text(FARE[3], 850, height/2);
  }
}
