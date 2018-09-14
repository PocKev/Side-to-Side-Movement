//Mover
PVector position;
PVector leftVel, rightVel, downVel;

boolean left, right;
boolean onGround;
float incVel = 3;
float w = 32, h = 55; //width and height for hitbox player
float gravity = 0.7;

void setup() {
  size(1000, 600);
  
  position = new PVector(width / 2, height * 1 / 3);
  leftVel = new PVector(0, 0);
  rightVel = new PVector(0, 0);
  downVel = new PVector(0, 0);
  
  left = false;
  right = false;
  onGround = false;
}

void draw() {
  background(0);
  stroke(255);
  line(0, height * 2/3, width, height * 2/3);
  fill(0);
  rect(width / 4, height * 1.5/3, width * 1/2, height * 0.06/3);
  
  move();
  collision();
  display();
  //System.out.println(downVel);
}

void move() {
  if (left) {
    leftVel = new PVector(-incVel, 0);
  } else {
    leftVel = new PVector(0, 0);
  }
  if (right) {
    rightVel = new PVector(incVel, 0);
  } else {
    rightVel = new PVector(0, 0);
  }
  if (!onGround) {
    downVel.y += gravity;
  } else {
    downVel = new PVector(0, 0);
  }
  
  position = position.add(leftVel);
  position = position.add(rightVel);
  position = position.add(downVel);
  
}

void jump() {
  if (onGround) {
    onGround = false;
    downVel = new PVector(0, -13);
    //System.out.print("JUMP");
  }  
}

void display() {
  rectMode(CORNER);
  fill(200);
  rect(position.x, position.y, w, h);
}

void collision() {
  downVel.limit(25);
  if (position.y + h >= height * 2/3) { //position.y + h is the bottom of the hitbox, collision for floor
    position.y = height * 2/3 - h;
    onGround = true;
  } 
  else if (position.y + h >= height * 1.48/3 && position.y + h < height * 1.6/3 && 
  position.x < width * 3/4 && position.x + w > width / 4) { //top collision with center board
    if (downVel.y > 0) {
      position.y = height * 1.5/3 - h;
      onGround = true;
    }
    else {
      
    }
  }
  else if (position.y >= height * 1.4/3 && position.y < height * 1.55/3 && 
  position.x < width * 3/4 && position.x + w > width / 4) { //buttom collision with center board
    if (downVel.y < 0) {
      downVel.y *= -1;
    }
  }
  else {
    onGround = false;
  }
  
}

void keyPressed() {
  switch(key) {
    case 'a':
      left = true;
      break;
    case 'd':
      right = true;
      break;
    case 'w':
      jump();
      break;
  }
}

void keyReleased() {
  switch(key) {
    case 'a':
      left = false;
      break;
    case 'd':
      right = false;
      break;
    case 'w':
      
      break;
  }
}
