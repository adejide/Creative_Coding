let drop = []; // this variable contains the incrementing value that changes show and update

function setup() {
  createCanvas(600, 600);
  for (let i = 0; i < 100; i++) { //this for loop's purpose is to continuously load 100 rectangles as long the var i is less than 100
    drop.push(new Drop());
  }
}

function draw() {
  background(255);
  for (let i = 0; i < drop.length; i++) { //this part of the code is continuously updating the methods in the Drop class, making new rects appear
    drop[i].show();
    drop[i].update();
    drop[i].update_2();
  }
}

class Drop {
  constructor() {
    this.x = random(0, width); //random x position
    this.y = random(0, -height); //random y position
    this.y_2 = random(0, height)
  }

  show() {
    this.show = function() {
      noStroke();
      let randomColor = color(random(255),random(255),random(255));
      frameRate(30); //had to adjust it because otherwise it went too fast
      fill(randomColor);
      rect(this.x, this.y, 20, 20); //rectangles
      rect(this.x, this.y_2, 20, 20);
    }
  }

  update() {
    this.update = function() {
      this.speed = random(5, 12); //random speed for shapes
      this.y = this.y + this.speed; //the y is increasing by 8
      // push()
      if (this.y > height) {
        this.y = 0;
      // pop()
      }
    }
  }

  update_2() {
    this.update_2 = function() {
      this.speed = random(-5, -12); //random speed for shapes
      this.y_2 = this.y_2 + this.speed; //the y is increasing by 8
      // push()
      if (this.y_2 < -height) {
        this.y_2 = height;
      // pop()
      }
    }
  }
}

function mousePressed() {
  loop();
}
function mouseReleased() {
  noLoop();
}

// for (let it = 0; it < 0; it++) {
//   rectMode(CENTER);
//   fill(0);
//   rect(it, it, 300, 300);
// }
