/*
  Sketch to understand how curves work
 
 Idea: pick four points by clicking mouse on screen.
 When four points are selected, draw a curve through the lines.
 
 On a fifth mouse press, we reset everything and start fresh.
 */

int[] curveXPoints;
int[] curveYPoints;
int numMousePressed;
int numPoints;
int index;
boolean coordinatesComplete;

void setup() {
  size(800, 800);
  background(255);

  numPoints = 12;
  curveXPoints = new int[numPoints];
  curveYPoints = new int[numPoints];
  index = 0;
  coordinatesComplete = false;

  numMousePressed = 0;

  for (int i = 0; i<curveXPoints.length; i++) {
    curveXPoints[i] = 0;
    curveYPoints[i] = 0;
  }
}

void draw() {
  if (coordinatesComplete) {
    beginShape();
    stroke(1);
    // draw curve based on the collected points
    for (int i=0; i<curveXPoints.length; i++) {
      curveVertex(curveXPoints[i], curveYPoints[i]);
    }
    endShape();
  }
}  

void mousePressed() {
  index = numMousePressed % numPoints;

  if (index == 0) {
    emptyList(curveXPoints);
    emptyList(curveYPoints);

    // clear screen when we start building a new list of coordinates
    background(255);
    coordinatesComplete = false;
  }

  curveXPoints[index] = mouseX;
  curveYPoints[index] = mouseY;

  numMousePressed +=1;

  if (index == numPoints - 1) {
    coordinatesComplete = true;
  }

  // draw point pairs in curveXPoints and curveYPoints
  noStroke();
  fill(255, 0, 0);
  ellipse(curveXPoints[index], curveYPoints[index], 10, 10);
}

void emptyList(int[] list) {
  for (int i =0; i<list.length; i++) {
    list[i] = 0;
  }
}
