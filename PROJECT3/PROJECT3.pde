/*
BEE DANETARAS PROJECT 3

SOURCE CODE: https://www.openprocessing.org/sketch/884188
*/


float roomRadius;
float xRotation;
float yRotation;
float xSaved;
float ySaved;
float mouseXSaved;
float mouseYSaved;
float camX;
float camZ;
boolean wPressed;
boolean aPressed;
boolean sPressed;
boolean dPressed;
boolean ePressed;
boolean qPressed;
boolean pressed;
float zoom;


void setup() {
  size(500, 500, P3D);
  rectMode(CENTER);
  textAlign(LEFT, CENTER);
  textSize(20);
  
  /*wallTexture = loadImage("doge.jpg");
  textures[0] = loadImage("helth.jpg");
  textures[1] = loadImage("lepdanz.jpg");
  textures[2] = loadImage("lqsub.jpg");
  textures[3] = loadImage("sqwek.jpg");
  textures[4] = loadImage("byych.gif");
  
  img = loadImage("doge.jpg");
  img = loadImage("helth.jpg");
  img = loadImage("lepdanz.jpg");
  img = loadImage("lqsub.jpg");
  img = loadImage("sqwek.jpg");
  img = loadImage("byych.gif");*/
  
  
  roomRadius = width * 2;
  
  xSaved = PI / 6;
  ySaved = -PI / 6;
  xRotation = ySaved;
  yRotation = xSaved;
}

void draw() {
  
  lights();
  
  pushMatrix();
  translate(width / 2, height / 2, -width);
  
  translate(0, 0, round(zoom / 10) * 10);
  

  rotateX(xRotation);
  rotateY(yRotation);
  
  translate(camX, 0, camZ);
  
  drawWalls();
  drawXYZ();
  

  
  popMatrix();
  drawInterface();
  
  if (pressed) {
    xRotation = ySaved + ((mouseYSaved - mouseY) / 100);
    yRotation = xSaved + ((mouseX - mouseXSaved) / 100);
  }
  
  if (keyPressed) {
    float speed = 15;
    float zoomSpeed = 15;
    
    if (wPressed) {
      camX += speed;
    }
    if (aPressed) {
      camZ -= speed;
    }
    if (sPressed) {
      camX -= speed;
    }
    if (dPressed) {
      camZ += speed;
    }
    if (ePressed) {
      zoom += zoomSpeed;
    }
    if (qPressed) {
      zoom -= zoomSpeed;
    }
  }
}

void drawInterface() {
  noStroke();
  fill(0, 155);
  float rw = 105;
  float rh = 40;
  rectMode(CORNER);
  rect(0, 0, rw, rh);
  fill(255);
  text("Zoom: " + round(zoom / 10), 20, 20, 20);
  rectMode(CENTER);
}

void drawWalls() {
  PImage img;
  PImage[] imgs = new PImage[5];
  float space = 300;
  PShape wall;
  
  img = loadImage("doge.jpg");
  imgs[0] = loadImage("helth.jpg");
  imgs[1] = loadImage("lepdanz.jpg");
  imgs[2] = loadImage("lqsub.jpg");
  imgs[3] = loadImage("sqwek.jpg");
  imgs[4] = loadImage("byych.gif");
  
  noStroke();
  noFill();
  wall = createShape(BOX, roomRadius * 2, roomRadius * 2, 1, PImage img);
  wall.setTexture(PImage img);
  
  
  pushMatrix();
  translate(0, 0, roomRadius);
  shape(wall);
  //box(roomRadius * 2, roomRadius * 2, 1);
  for (int i = 0; i < roomRadius; i += space) {
    line(i, roomRadius, -1, i, -roomRadius, -1);
    line(-i, roomRadius, -1, -i, -roomRadius, -1);
    line(roomRadius, i, -1, -roomRadius, i, -1);
    line(roomRadius, -i, -1, -roomRadius, -i, -1);
  }
  popMatrix();
  
  pushMatrix();
  translate(0, 0, -roomRadius);
  box(roomRadius * 2, roomRadius * 2, 1);
  for (int i = 0; i < roomRadius; i += space) {
    line(i, roomRadius, 1, i, -roomRadius, 1);
    line(-i, roomRadius, 1, -i, -roomRadius, 1);
    line(roomRadius, i, 1, -roomRadius, i, 1);
    line(roomRadius, -i, 1, -roomRadius, -i, 1);
  }
  popMatrix();
  
  pushMatrix();
  translate(roomRadius, 0, 0);
  box(1, roomRadius * 2, roomRadius * 2);
  for (int i = 0; i < roomRadius; i += space) {
    line(-1, i, roomRadius, -1, i, -roomRadius);
    line(-1, -i, roomRadius, -1, -i, -roomRadius);
    line(-1, roomRadius, i, -1, -roomRadius, i);
    line(-1, roomRadius, -i, -1, -roomRadius, -i);
  }
  popMatrix();
  
  pushMatrix();
  translate(-roomRadius, 0, 0);
  box(1, roomRadius * 2, roomRadius * 2);
  for (int i = 0; i < roomRadius; i += space) {
    line(1, i, roomRadius, 1, i, -roomRadius);
    line(1, -i, roomRadius, 1, -i, -roomRadius);
    line(1, roomRadius, i, 1, -roomRadius, i);
    line(1, roomRadius, -i, 1, -roomRadius, -i);
  }
  popMatrix();
  
  pushMatrix();
  translate(0, roomRadius, 0);
  box(roomRadius * 2, 1, roomRadius * 2);
  for (int i = 0; i < roomRadius; i += space) {
    line(roomRadius, -1, i, -roomRadius, -1, i);
    line(roomRadius, -1, -i, -roomRadius, -1, -i);
    line(i, -1, roomRadius, i, -1, -roomRadius);
    line(-i, -1, roomRadius, -i, -1, -roomRadius);
  }
  popMatrix();
  
  pushMatrix();
  translate(0, -roomRadius, 0);
  box(roomRadius * 2, 1, roomRadius * 2);
  for (int i = 0; i < roomRadius; i += space) {
    line(roomRadius, 1, i, -roomRadius, 1, i);
    line(roomRadius, 1, -i, -roomRadius, 1, -i);
    line(i, 1, roomRadius, i, 1, -roomRadius);
    line(-i, 1, roomRadius, -i, 1, -roomRadius);
  }
  popMatrix();
}

/*void drawBackground() {
  background(0);
  noFill();
  stroke(255);
  strokeWeight(2);
  rectMode(CORNERS);
  rect(1, 1, width - 1, height - 2);
  rectMode(CENTER);
}*/

void drawXYZ() {
  strokeWeight(5);
  
  //x
  stroke(255, 0, 0);
  line(-roomRadius, 0, 0, roomRadius, 0, 0);
  
  //y
  stroke(0, 255, 0);
  line(0, -roomRadius, 0, 0, roomRadius, 0);
  
  //z
  stroke(255, 255, 0);
  line(0, 0, -roomRadius, 0, 0, roomRadius);
}


void mousePressed() {
  if (!pressed) {
    mouseXSaved = mouseX;
    mouseYSaved = mouseY;
    pressed = true;
  }
}

void mouseReleased() {
  pressed = false;
  xSaved = yRotation;
  ySaved = xRotation;
}

void mouseOut() {
  pressed = false;
  xSaved = yRotation;
  ySaved = xRotation;
}

void keyPressed() {
  if (key == 'w') {
    wPressed = true;
  } else if (key == 'a') {
    aPressed = true;
  } else if (key == 's') {
    sPressed = true;
  } else if (key == 'd') {
    dPressed = true;
  } else if (key == 'e') {
    ePressed = true;
  } else if (key == 'q') {
    qPressed = true;
  }
}

void keyReleased() {
  if (key == 'w') {
    wPressed = false;
  } else if (key == 'a') {
    aPressed = false;
  } else if (key == 's') {
    sPressed = false;
  } else if (key == 'd') {
    dPressed = false;
  } else if (key == 'e') {
    ePressed = false;
  } else if (key == 'q') {
    qPressed = false;
  }
}
