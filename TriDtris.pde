//Changes since last Vid Posted:
  //

//Things to Add: (Fix all the bugs!)
  //Piece Rotation Works
  //Make all 41 pieces (42 w/o ninjoid set)
  //Implement basic 41-bag for now
  //Figure out how to make ninjoids occur in the 42-bag.
  //Layers clear upon filling
  //Add scoring
  //DAS???
  //Add another way to view the board simultaneously for easier board state recognition

PFont pqrf; PFont ffff;
ArrayList<Ninjoid> ninjoids;
int scale;
int time; int time1; int timeN; //time1 is the time when the game started
String mins; String secs; //used in the timer

//Input Display Positions
float upPos = 8.75; float downPos = 8.75; float leftPos = 8.75; float rightPos = 8.75; float spacePos = 9.50;
float qPos = 7.75; float wPos = 7.75; float aPos = 7.75; float sPos = 7.75; float zPos = 7.75; float xPos = 7.75;
float ePos = 6.75; float rPos = 6.75;

int gamestate = 0;
int camAng = 0;
int pushSpd = 1000; boolean nope = false;
int horiA = 0; int horiB = 0;
int rotChargeA; int rotChargeB;

int curPiec = -1;
boolean colA = false; boolean colB = false; boolean colC = false;

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
  text("TriDtris Test lol",2*scale,-.2*scale,3*scale);
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
  text("Game State: "+gamestate,6.75*scale,-.25*scale,1*scale);
  text("Piece Count: "+(curPiec+1),6.75*scale,.25*scale,1*scale);
  text("Ninjoid Count: "+(ninjoids.size()-3),6.75*scale,.75*scale,1*scale);
  text("Next:",6*scale,1.75*scale,3*scale);
  if (gamestate > 0 && gamestate != 4)  {
    text("Time:",6*scale,5.75*scale,3*scale);
    text(mins+":"+secs,6*scale,6.25*scale,3*scale);
  }
   
  //Input Display
  text("E",5.54*scale,ePos*scale,3*scale);
  text("R",5.83*scale,rPos*scale,3*scale);
  text("cam     a",5.4*scale,6.8*scale,3*scale);
  text("Q",4.75*scale,qPos*scale,3*scale);  
  text("W",5.25*scale,wPos*scale,3*scale);  
  text("A",5.75*scale,aPos*scale,3*scale);  
  text("S",6.25*scale,sPos*scale,3*scale);  
  text("Z",6.75*scale,zPos*scale,3*scale);  
  text("X",7.25*scale,xPos*scale,3*scale);  
  text("^",4.75*scale,upPos*scale,3*scale);  
  text("<",5.25*scale,leftPos*scale,3*scale);  
  text("v",5.75*scale,downPos*scale,3*scale);
  text(">",6.25*scale,rightPos*scale,3*scale);  
  text("___",5*scale,spacePos*scale,3*scale);  
  text("___",5.1*scale,spacePos*scale,3*scale);  
  
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
  
  //-----------------------------------------------------------------------------------------------------------------  
  //Piece Collision
  
  if (millis() - timeN >= pushSpd && gamestate != 0 && gamestate != 4) {
    gamestate = 2;
    int checkA = curPiec;
    
    for (int i=(3*checkA); i<(3*checkA)+3; i++) {
      
      ninjoids.get(i).rot(rotChargeA, rotChargeB);
      ninjoids.get(i).move(horiA, horiB);
      ninjoids.get(i).drop();
      
      for (Ninjoid n : ninjoids) {
        if (n.state == 0 && n.pos.y == ninjoids.get(i).pos.y && n.pos.x == ninjoids.get(i).pos.x && n.pos.z == ninjoids.get(i).pos.z
        || ninjoids.get(i).pos.y > 7 || ninjoids.get(i).pos.x < 0 || ninjoids.get(i).pos.x > 3 || ninjoids.get(i).pos.z < 0 || ninjoids.get(i).pos.z > 3) {
          if (ninjoids.get(i).collide(n.ori, ninjoids.get(i).ori) == true || ninjoids.get(i).pos.y > 7 || ninjoids.get(i).pos.x < 0 || ninjoids.get(i).pos.x > 3 || ninjoids.get(i).pos.z < 0 || ninjoids.get(i).pos.z > 3) {
            colA = true;
          }
        }
      }
    }
    
    if (colA == true) {
      
      horiA *= -1; horiB *= -1;
      for (int i=(3*checkA); i<(3*checkA)+3; i++) {

        ninjoids.get(i).move(horiA, horiB);
              
        for (Ninjoid n : ninjoids) {
          if (n.state == 0 && n.pos.y == ninjoids.get(i).pos.y && n.pos.x == ninjoids.get(i).pos.x && n.pos.z == ninjoids.get(i).pos.z
          || ninjoids.get(i).pos.y > 7 || ninjoids.get(i).pos.x < 0 || ninjoids.get(i).pos.x > 3 || ninjoids.get(i).pos.z < 0 || ninjoids.get(i).pos.z > 3) {
            if (ninjoids.get(i).collide(n.ori, ninjoids.get(i).ori) == true || ninjoids.get(i).pos.y > 7 || ninjoids.get(i).pos.x < 0 || ninjoids.get(i).pos.x > 3 || ninjoids.get(i).pos.z < 0 || ninjoids.get(i).pos.z > 3) {
              colB = true;
            }
          }
        }
      }
      
      if (colB == true) {
        
             if (rotChargeA == 1) rotChargeA = 2; else if (rotChargeA == 2) rotChargeA = 1;
        else if (rotChargeA == 4) rotChargeA = 5; else if (rotChargeA == 5) rotChargeA = 4;
        else if (rotChargeA == 7) rotChargeA = 8; else if (rotChargeA == 8) rotChargeA = 7;
             if (rotChargeB == 1) rotChargeB = 2; else if (rotChargeB == 2) rotChargeB = 1;
        else if (rotChargeB == 4) rotChargeB = 5; else if (rotChargeB == 5) rotChargeB = 4;
        else if (rotChargeB == 7) rotChargeB = 8; else if (rotChargeB == 8) rotChargeB = 7;
        if (rotChargeB != 0) { int trader = rotChargeB; rotChargeB = rotChargeA; rotChargeA = trader; }
        
        for (int i=(3*checkA); i<(3*checkA)+3; i++) { 
          
          ninjoids.get(i).rot(rotChargeA, rotChargeB);
        
          for (Ninjoid n : ninjoids) {
            if (n.state == 0 && n.pos.y == ninjoids.get(i).pos.y && n.pos.x == ninjoids.get(i).pos.x && n.pos.z == ninjoids.get(i).pos.z
            || ninjoids.get(i).pos.y > 7 || ninjoids.get(i).pos.x < 0 || ninjoids.get(i).pos.x > 3 || ninjoids.get(i).pos.z < 0 || ninjoids.get(i).pos.z > 3) {
              if (ninjoids.get(i).collide(n.ori, ninjoids.get(i).ori) == true || ninjoids.get(i).pos.y > 7 || ninjoids.get(i).pos.x < 0 || ninjoids.get(i).pos.x > 3 || ninjoids.get(i).pos.z < 0 || ninjoids.get(i).pos.z > 3) {
                colC = true;
              }
            }
          }
        }
      
        if (colC == true) {
        
          for (int i=(3*checkA); i<(3*checkA)+3; i++) { 
          
            ninjoids.get(i).undrop();
            
            if (ninjoids.get(i).pos.y > 0 || (ninjoids.get(i).pos. y == 0 && (ninjoids.get(i).pos.x == 0 || ninjoids.get(i).pos.x == 3 || ninjoids.get(i).pos.z == 0 || ninjoids.get(i).pos.z == 3))) {
              println("1");
              ninjoids.get(i).die();
            }
            else {
              ninjoids.get(i).die();
              gamestate = 4;
            }
          }
        }
      }
    }
    timeN = millis();
    rotChargeA = 0; rotChargeB = 0;
    horiA = 0; horiB = 0;
    colA = false; colB = false; colC = false;
    if (gamestate != 4) gamestate = 3;
  }
  
  //Draw Pieces
  for (Ninjoid n : ninjoids) {
    n.display();
  }
}

void keyPressed()  {
  if (gamestate == 0 && keyCode == 32)  {
    time1 = millis();
    timeN = millis();
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
    pushSpd = 250;
    spacePos = 9.75;
    nope = true;
  }
  
  if (gamestate != 4)  {
    if (keyCode == LEFT) {
      leftPos = 9.0;
      horiA=-1;
    }
    else if (keyCode == RIGHT) {
      rightPos = 9.0;
      horiA=1;
    }
    else if (keyCode == UP) {
      upPos = 9.0;
      horiB=-1;
    }
    else if (keyCode == DOWN) {
      downPos = 9.0;
      horiB=1;
    }
    else if (keyCode == 32) {
      spacePos = 9.75;
    }
    else if (keyCode == 'Q') {
      qPos = 8.0;
    }
    else if (keyCode == 'W') {
      wPos = 8.0;
    }
    else if (keyCode == 'A') {
      aPos = 8.0;
    }
    else if (keyCode == 'S') {
      sPos = 8.0;
    }
    else if (keyCode == 'Z') {
      zPos = 8.0;
    }
    else if (keyCode == 'X') {
      xPos = 8.0;
    }
    else if (keyCode == 'E') {
      ePos = 7.0;
    }
    else if (keyCode == 'R') {
      rPos = 7.0;
    }
  }
}

void keyReleased()  {
  
  if ((gamestate ==  2 || gamestate == 3) && keyCode == 32)  {
    pushSpd = 1000;
    spacePos = 9.5;
    nope = false;
  }
  else if (gamestate != 4)  {
    if (keyCode == LEFT) {
      leftPos = 8.75;
      if(horiA == -1) horiA = 0;
    }
    else if (keyCode == RIGHT) {
      rightPos = 8.75;
      if(horiA == 1) horiA = 0;
    }
    else if (keyCode == UP) {
      upPos = 8.75;
      if(horiB == -1) horiB = 0;
    }
    else if (keyCode == DOWN) {
      downPos = 8.75;
      if(horiB == 1) horiB = 0;
    }
    else if (keyCode == 32) {
      spacePos = 9.5;
    }
    else if (keyCode == 'Q') {
      qPos = 7.75;
    }
    else if (keyCode == 'W') {
      wPos = 7.75;
    }
    else if (keyCode == 'A') {
      aPos = 7.75;
    }
    else if (keyCode == 'S') {
      sPos = 7.75;
    }
    else if (keyCode == 'Z') {
      zPos = 7.75;
    }
    else if (keyCode == 'X') {
      xPos = 7.75;
    }
    else if (keyCode == 'E')  {
      ePos = 6.75;
      camAng--;
      if (camAng < 0) camAng = 3;
      for (Ninjoid n : ninjoids)  {
        n.camLeft();
      }
    }
    else if (keyCode == 'R')  {
      rPos = 6.75;
      camAng++;
      if (camAng > 3) camAng = 0;
      for (Ninjoid n : ninjoids)  {
        n.camRight();
      }
    }
  }
}
