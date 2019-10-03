let drop = [];

function setup() {
  createCanvas(600, 600);
  for (let i = 0; i < 100; i++) {
    drop.push(new Drop());
  }
}

function draw() {
  background(255);
  for (let i = 0; i < drop.length; i++) {
    drop[i].show();
    drop[i].update();
  }
}

class Drop {
  constructor() {
    this.x = random(0, width);
    this.y = random(0, -height);
  }

  show() {
    this.show = function() {
      noStroke();
      let randomColor = color(random(255),random(255),random(255));
      frameRate(30);
      fill(randomColor);
      rect(this.x, this.y, 25, 25);
    }
  }

  update() {
    this.update = function() {
      this.y = this.y + 8;

      if (this.y > height) {
        this.y = 0;
      }
    }
  }
}
