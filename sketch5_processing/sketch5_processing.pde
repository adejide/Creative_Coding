PImage bee; //this is the variable for the main image
PImage sparkle; //this is the variable for the png image
PFont font; //single variable for font
color pastyel = #fdfd96; //initial color for text
int i = 25; 
int id = 0;

void setup() {
  size(1920, 1080); //size of screen is fitted for image (bee)
  font = createFont("SedgwickAveDisplay-Regular.ttf", 60); //loaded text from Google Fonts
  textFont(font); 
  textAlign(CENTER, CENTER); //centers the text
  bee = loadImage("bumblebill.jpg"); //bee is loaded
  sparkle = loadImage("sparkle.png"); //sparkle is loaded
}

void draw() {
  //image(bee, 0, 0); //bee is displayed on screen
  sparkle.resize(100, 100); //sparkle png had to be resized for repetition

  pixelateImage(i); //function called for image to be pixelated 
  for (int j = 0; j < 200; j++) {
    frameRate(4); //frameRate slowed for flash type effect
    tint(255, random(125)); //tint of sparkle is adjusted 
    image(sparkle, random(1920), random(150, 860)); //random multiples of png are displayed randomly
  }
  
  int s = second(); //initialized variable s for time to be calculated
  
  if (s % 2 == 0) { //conditional made to flash text every other second
  fill(pastyel); 
  text("pixelated", width/2, height/2); //displays the text
  }
}

void mouseClicked() { //changes the color of the text when clicked in certain areas
  if (mouseX > width/2) { //on different halves of screen
    pastyel = 255;
  } else if (mouseY > height/2) {
    pastyel = #fdfd96;
  } else { 
    pastyel = #cc3216;
  }

  if (i > 0) {
    pixelateImage(i);
    i--;
  } 
}

void pixelateImage(int pixel_size) { //this code from Stanford.edu was manipulated for my code
  // calculate x position
  float x_offset = width / 2 - bee.width / 2;
  // calculate y position
  float y_offset = height / 2 - bee.height /2;
  // disable shape stroke
  noStroke();
  // loop over size of image in horizontal and vertical
  for (int x=0; x < bee.width; x+=pixel_size) {
    for (int y=0; y < bee.height; y+=pixel_size) {
      // get pixel color at location
      color pixel_color = bee.get(x, y);
      // set shape fill color
      fill(pixel_color);
      // draw shape
      rect(x + x_offset, y + y_offset, pixel_size, pixel_size);
    }
  }
}
