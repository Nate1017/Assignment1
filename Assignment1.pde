int arraySize = 10;

float[] x = new float[arraySize];
float[] y = new float[arraySize];
float[] xSpeed = new float[arraySize];
float[] ySpeed = new float [arraySize];


void setup() {
  size(displayWidth, displayHeight);
  background(0);
  for (int i = 0; i < arraySize; i++) {
    xSpeed[i] = random(-2, 2);
    ySpeed[i] = random(-2, -2);
    x[i] = random(26, width-26);
    y[i] = random(26, height-26);
  }
}

void draw() {
  text("Press 'x' or 'X' to start over", displayHeight/2 + 10, displayWidth/2 + 10);
  text("Hold down 'r' or 'R' to make brush red", displayHeight/2, displayWidth/2);
  
  stroke(0);
  fill(255);
  smooth();

  for (int i = 0; i < arraySize; i++) {
    x[i] = x[i]+xSpeed[i];
    y[i] = y[i]+ySpeed[i];
    
    fill(random(255));
    ellipse(x[i], y[i], 50, 50);

    if (x[i] >= width-25 || x[i] <=26) {
      xSpeed[i] = -xSpeed[i];
    }

    if (y[i] >= height-26 || y[i] <= 26) {
      ySpeed[i] = -ySpeed[i];
    }
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame("drawing-######.png");
  }

  if (key == 'x' || key == 'X') {
    background(0);
  }
  
  if(key == 'r' || key == 'R'){
    fill(158, 10, 10);
    ellipse(mouseX, mouseY, 30, 30);
  }
}

void mouseDragged() {
  fill(255);
  ellipse(mouseX, mouseY, 30, 30);
}
