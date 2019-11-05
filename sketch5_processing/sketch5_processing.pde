PImage img;
PFont font;
color pastyel = #fdfd96; //main color for text
//next thing is to modify text and add it to an array

void setup() {
  size(1920, 1080);
  font = createFont("SedgwickAveDisplay-Regular.ttf", 60);
  textFont(font);
  textAlign(CENTER, CENTER); //centers the text
  img = loadImage("bumblebill.jpg");
}

void draw() {
  //background(135, 206, 235); //added so background is consistent
  image(img, 0, 0);
  fill(pastyel);
  text("this is KILL BILL", width/2, height/2); //displays the text
}

void mouseClicked() { //changes the color of the text when clicked 
 if (mouseX > width/2) { //on different halves of screen
   pastyel = 0;
 } else {
   pastyel = #fdfd96;
 }
}
