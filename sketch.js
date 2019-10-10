let drop = []; // this array contains the incrementing value that changes show and update
let l = 0;
let mid; //for middle square
let x;
let y;

function setup() {
  createCanvas(500, 500); //screen size
  for (let i = 0; i < 200; i++) { //this for loop's purpose is to continuously load 100 rectangles as long the var i is less than 100
    drop.push(new Drop());
  }

  mid = new Growth();
  background(0);
}

function draw() {
  // background(0);
  for (let i = 0; i < drop.length; i++) { //this part of the code is continuously updating the methods in the Drop class, making new rects appear
    push();
    frameRate(24);
    drop[i].show();
    pop();
    drop[i].update();
    drop[i].update_2();
  }

  mid.growth();
  mid.display();

  for (let i = 0; i < 600; i++) {
    push(); //This lightning code was inspired by Peter Farrell
    endX = x + random(-5, 5); //random x-val
    endY = y + 1; //y in
    strokeWeight(2); //for a nice thickness to the line
    stroke(255); //for line to be white
    line(x, y, endX, endY);
    x = endX;
    y = endY;
    pop();
  }
}

class Drop {
  constructor() {
    this.x = random(0, 1000); //random x position
    this.y = random(0, -1000); //random y position
    this.y_2 = random(0, 1000)
  }

  show() {
    this.show = function() {
      noStroke();
      let randomColor = color(random(255),random(255),random(255));
      frameRate(30); //had to adjust it because otherwise it went too fast
      fill(randomColor);
      push();
      rotate(PI / 3.0);
      rect(this.x, this.y, 20, 20); //rectangles
      rect(this.x, this.y_2, 20, 20);
      pop();
    }
  }

  update() {
    this.update = function() {
      this.speed = random(5, 12); //random speed for shapes
      this.y = this.y + this.speed; //the y is increasing this.speed
      if (this.y > height) {
        this.y = 0;
      }
    }
  }

  update_2() {
    this.update_2 = function() {
      this.speed = random(-5, -12); //random speed for shapes
      this.y_2 = this.y_2 + this.speed; //the y is increasing by 8
      if (this.y_2 < -height) {
        this.y_2 = height;
      }
    }
  }
}

class Growth {
 constructor() {
   this.w = width/2; //variable for width to start in middle
   this.h = height/2; //variable for height to start in middle
   let l = 0;
   // let d = dist(this.w, this.h, this.show, this.show.y);
 }

  growth() {
    fill(0);
    rectMode(CENTER);
    l++;
  }

  display() {
   rect(this.w, this.h, l, l);
  }
}

function mousePressed() {
  x = mouseX;
  y = mouseY;
}
