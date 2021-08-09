//Changes since last Vid Posted:
  //

//Things to Add: (Fix all the bugs!)
  //Pieces have multiple ninjoids
  //Pieces have single rotation center point
  //Make all 41 pieces (42-ninjoid set)
  //Implement basic 41-bag for now
  //Figure out how to make ninjoids occur in the 42-bag.
  //Layers clear upon filling
  //Add scoring
  //Rework inputs so DAS and rotation charges are a thing and frame perfect inputs don't scare the collision detection
  //Add pushdown to input display
  //Make pushdown disable other movement
  //Add another way to view the board simultaneously for easier board state recognition

PFont pqrf; PFont ffff;
ArrayList<Ninjoid> ninjoids;
int scale;
int time; int time1; //time1 is the time when the game started
String mins; String secs; //used in the timer

//Input Display Positions
float upPos = 8.75; float downPos = 8.75; float leftPos = 8.75; float rightPos = 8.75;
float qPos = 8.75; float wPos = 8.75; float aPos = 8.75; float sPos = 8.75; float zPos = 8.75; float xPos = 8.75;
float ePos = 8.75; float rPos = 8.75;

int gamestate = 0;
int camAng = 0;
int pushSpd = 200;

int curPiec = -1;

void setup()  {
  size (600,600, P3D); //Size of the Window
  pqrf = createFont("PQRfont.ttf",32);
  ffff = createFont("FFFf.ttf",16);
  textFont(ffff);
  scale = width/12;
  hint(ENABLE_DEPTH_SORT); //Fixes 3D rendering!
  
  ninjoids = new ArrayList<Ninjoid>();
  
}

void draw()  {
  background(128,128,128);
  time = millis() - time1;
  if (((time/60000)%1000) < 10) mins = "0"+str((time/60000)%1000); else mins = str((time/60000)%1000);;
  if (((time/1000)%60) < 10) secs = "0"+str((time/1000)%60); else secs = str((time/1000)%60);
  
  
  //Text
  fill(0);
  textAlign(CENTER);
  textSize(30);
  textFont(pqrf);
  text("PQR was here!",15*scale,20.5*scale,-5*scale);
  textSize(10);
  textFont(ffff);
  text("TriDtris Test lol",2*scale,-.25*scale,2*scale);
  if (gamestate == 0)  {
    fill(255);
    text("Press Space to Start!",2.02*scale,3.05*scale,4.45*scale);
    fill(0);
    text("Press Space to Start!",2*scale,3*scale,4.5*scale);
  }
  else if (gamestate == 4)  {
    fill(255);
    text("Game Over!",2.02*scale,3.05*scale,4.45*scale);
    fill(0);
    text("Game Over!",2*scale,3*scale,4.5*scale);
  }
  text("Game State: "+gamestate,6.25*scale,.25*scale,1*scale);
  text("Piece Count: "+(curPiec+1),6.25*scale,.75*scale,1*scale);
  text("Ninjoid Count: "+(ninjoids.size()-3),6.25*scale,1.25*scale,1*scale);
  text("Next:",6*scale,1.75*scale,3*scale);
  if (gamestate > 0 && gamestate != 4)  {
    text("Time:",6*scale,5.75*scale,3*scale);
    text(mins+":"+secs,6*scale,6.25*scale,3*scale);
  }
   
  //Input Display
  text("Q",4.75*scale,qPos*scale,3*scale);  
  text("W",5.25*scale,wPos*scale,3*scale);  
  text("A",5.75*scale,aPos*scale,3*scale);  
  text("S",6.25*scale,sPos*scale,3*scale);  
  text("Z",6.75*scale,zPos*scale,3*scale);  
  text("X",7.25*scale,xPos*scale,3*scale);  
  text("^",7.75*scale,upPos*scale,3*scale);  
  text("<",8.25*scale,leftPos*scale,3*scale);  
  text("v",8.75*scale,downPos*scale,3*scale);
  text(">",9.25*scale,rightPos*scale,3*scale);  
  text("E",5.74*scale,(ePos-1)*scale,3*scale);
  text("R",6.03*scale,(rPos-1)*scale,3*scale);
  text("cam     a",5.6*scale,7.8*scale,3*scale);
  
  //Camera
  //if (camAng == 0)  {
    camera(3.125*scale, .5*scale, 11*scale,
          3.625*scale, 4*scale, 2*scale,
          0, 1, 0);
          /*
  }
  else if (camAng == 1)  {                   //Not necessary but I don't want to delete just in case.
    camera(-7*scale, .5*scale, 4.125*scale,
          2*scale, 4*scale, 3.625*scale,
          0, 1, 0);
  }
  else if (camAng == 2)  {
    camera(-.125*scale, .5*scale, -7*scale,
          .375*scale, 4*scale, 2*scale,
          0, 1, 0);
  }
  else if (camAng == 3)  {
    camera(11*scale, .5*scale, -.125*scale,
          2*scale, 4*scale, .375*scale,
          0, 1, 0);
  }
  */
  
  //Main Grid
  strokeWeight(1);
  stroke(0,0,0,64);
  for (int j=0; j<8; j++) {
    for (int i=0; i<5; i++) {
      line(0*scale,j*scale,i*scale,4*scale,j*scale,i*scale);
      line(i*scale,j*scale,0*scale,i*scale,j*scale,4*scale);
    }
  }
  stroke(0);
  for (int i=0; i<5; i++) {
    line(0*scale,8*scale,i*scale,4*scale,8*scale,i*scale);
    line(i*scale,8*scale,0*scale,i*scale,8*scale,4*scale);
  }
  line(0*scale,8*scale,0*scale,0*scale,0*scale,0*scale);
  line(0*scale,8*scale,4*scale,0*scale,0*scale,4*scale);
  line(4*scale,8*scale,4*scale,4*scale,0*scale,4*scale);
  line(4*scale,8*scale,0*scale,4*scale,0*scale,0*scale);
  
  //Preview Grid
  strokeWeight(1);
  stroke(0,0,0,64);
  for (int j=0; j<1; j++) {
    for (int i=1; i<4; i++) {
      line(5*scale,(j+2)*scale,(i+1)*scale,7*scale,(j+2)*scale,(i+1)*scale);
      line((i+4)*scale,(j+2)*scale,2*scale,(i+4)*scale,(j+2)*scale,4*scale);
    }
  }
  stroke(0);
  for (int i=1; i<4; i++) {
    line(5*scale,3*scale,(i+1)*scale,7*scale,3*scale,(i+1)*scale);
    line((i+4)*scale,3*scale,2*scale,(i+4)*scale,3*scale,4*scale);
  }
  line(5*scale,3*scale,2*scale,5*scale,2*scale,2*scale);
  line(5*scale,3*scale,4*scale,5*scale,2*scale,4*scale);
  line(7*scale,3*scale,4*scale,7*scale,2*scale,4*scale);
  line(7*scale,3*scale,2*scale,7*scale,2*scale,2*scale);
  
  //Pieces
  for (int i = 0; i < ninjoids.size(); i++) {
    fill(255,0,0,64);
    ninjoids.get(i).move();
    ninjoids.get(i).display();
  }
}

void keyPressed()  {
  if (gamestate == 0 && keyCode == 32)  {
    time1 = millis();
    gamestate = 1;
    
    //CurPiece is -1
    ninjoids.add(new Ninjoid(2,0)); //Ninjoid 0 is Alive
    ninjoids.add(new Ninjoid(2,1)); //Ninjoid 1 is Alive
    ninjoids.add(new Ninjoid(2,2)); //Ninjoid 2 is Alive
    curPiec++; //CurPiece is 0
    gamestate = 2;
    ninjoids.add(new Ninjoid(1,3)); //Ninjoid 3 is Next
    ninjoids.add(new Ninjoid(1,4)); //Ninjoid 4 is Next
    ninjoids.add(new Ninjoid(1,5)); //Ninjoid 5 is Next
    println("Let's get this party started!");
    gamestate = 3;
  }
  else if ((gamestate == 2 || gamestate == 3) && keyCode == 32)  {
    pushSpd = 500;
  }
  
  if (gamestate != 4)  {
    if (keyCode == LEFT) leftPos = 9.0;
    else if (keyCode == RIGHT) rightPos = 9.0;
    else if (keyCode == UP) upPos = 9.0;
    else if (keyCode == DOWN) downPos = 9.0;
    else if (keyCode == 'Q') qPos = 9.0;
    else if (keyCode == 'W') wPos = 9.0;
    else if (keyCode == 'A') aPos = 9.0;
    else if (keyCode == 'S') sPos = 9.0;
    else if (keyCode == 'Z') zPos = 9.0;
    else if (keyCode == 'X') xPos = 9.0;
    else if (keyCode == 'E') ePos = 9.0;
    else if (keyCode == 'R') rPos = 9.0;
  }
}

void keyReleased()  {
  
  if ((gamestate ==  2 || gamestate == 3) && keyCode == 32)  {
    pushSpd = 3000;
  }
  else if (gamestate != 4)  {
    for (int i=(3*curPiec); i<(3*curPiec)+3; i++){
      ninjoids.get(i).control(keyCode);
    }
    if (keyCode == LEFT) leftPos = 8.75;
    else if (keyCode == RIGHT) rightPos = 8.75;
    else if (keyCode == UP) upPos = 8.75;
    else if (keyCode == DOWN) downPos = 8.75;
    else if (keyCode == 'Q') qPos = 8.75;
    else if (keyCode == 'W') wPos = 8.75;
    else if (keyCode == 'A') aPos = 8.75;
    else if (keyCode == 'S') sPos = 8.75;
    else if (keyCode == 'Z') zPos = 8.75;
    else if (keyCode == 'X') xPos = 8.75;
    else if (keyCode == 'E')  {
      ePos = 8.75;
      camAng--;
      if (camAng < 0) camAng = 3;
      for (Ninjoid n : ninjoids)  {
        n.camLeft();
      }
    }
    else if (keyCode == 'R')  {
      rPos = 8.75;
      camAng++;
      if (camAng > 3) camAng = 0;
      for (Ninjoid n : ninjoids)  {
        n.camRight();
      }
    }
  }
  
}
