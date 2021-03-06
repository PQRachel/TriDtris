class Ninjoid  {
  int ninjNumA = 0; //Position in the ninjoid list used for determine which piece it's a part of.
  int ninjNumB = 0; //Each piece has 3 ninjoids: 0, 1, & 2
  int state = 2; //0=Dead, 1=Next, 2=Alive
  int ori = 0; int newori = 0; //Orientation ID
  PVector pos = new PVector(0,0,0);
  PVector v0 = pos;  PVector v1 = pos;  PVector v2 = pos;  PVector v3 = pos;  PVector v4 = pos; //Vertices of the ninjoids used for drawing.
  int timeN = millis();
  
  Ninjoid(int t, int n)  {
    state = t;
    ninjNumA = n;
    ninjNumB = n%3;
    
    //-----------------------------------------------------------------------------------------------------------------
    //Define Focal Point of Ninjoid
    if (state == 0)  {
    }
    else if (state == 1)  {
       if (camAng == 0) {
              if (ninjNumB == 0) { pos = new PVector (6,2,3); ori = 0; }
         else if (ninjNumB == 1) { pos = new PVector (6,2,2); ori = 0; }
         else if (ninjNumB == 2) { pos = new PVector (5,2,3); ori = 0; }
       }
      else if (camAng == 1) {
                if (ninjNumB == 0) { pos = new PVector (5,2,3); ori = 1; }
           else if (ninjNumB == 1) { pos = new PVector (6,2,6); ori = 1; }
           else if (ninjNumB == 2) { pos = new PVector (5,2,2); ori = 1; }
       }
      else if (camAng == 2) {
                  if (ninjNumB == 0) { pos = new PVector (5,2,2); ori = 2; }
             else if (ninjNumB == 1) { pos = new PVector (5,2,3); ori = 2; }
             else if (ninjNumB == 2) { pos = new PVector (6,2,2); ori = 2; }
       }
      else if (camAng == 3) {
                  if (ninjNumB == 0) { pos = new PVector (6,2,2); ori = 3; }
             else if (ninjNumB == 1) { pos = new PVector (5,2,2); ori = 3; }
             else if (ninjNumB == 2) { pos = new PVector (6,2,3); ori = 3; }
       }
    }
    else if (state == 2)  {
           if (camAng == 0) {
                  if (ninjNumB == 0) { pos = new PVector (2,0,2); ori = 0; }
             else if (ninjNumB == 1) { pos = new PVector (2,0,1); ori = 0; }
             else if (ninjNumB == 2) { pos = new PVector (1,0,2); ori = 0; }
            }
      else if (camAng == 1) {
                  if (ninjNumB == 0) { pos = new PVector (2,0,1); ori = 1; }
             else if (ninjNumB == 1) { pos = new PVector (1,0,1); ori = 1; }
             else if (ninjNumB == 2) { pos = new PVector (2,0,2); ori = 1; }
       }
      else if (camAng == 2) {
                  if (ninjNumB == 0) { pos = new PVector (1,0,1); ori = 2; }
             else if (ninjNumB == 1) { pos = new PVector (1,0,2); ori = 2; }
             else if (ninjNumB == 2) { pos = new PVector (2,0,1); ori = 2; }
       }
      else if (camAng == 3) {
                  if (ninjNumB == 0) { pos = new PVector (1,0,2); ori = 3; }
             else if (ninjNumB == 1) { pos = new PVector (2,0,2); ori = 3; }
             else if (ninjNumB == 2) { pos = new PVector (1,0,1); ori = 3; }
       }
    }
    
  }
    
  //-----------------------------------------------------------------------------------------------------------------
  //Move Next Piece to Spawn Zone
  void next()  {
    
      state = 2;
      
           if (camAng == 0) {
                    if (ninjNumB == 0) { pos = new PVector (2,-1,2); ori = 0; }
               else if (ninjNumB == 1) { pos = new PVector (2,-1,1); ori = 0; }
               else if (ninjNumB == 2) { pos = new PVector (1,-1,2); ori = 0; }
            }
      else if (camAng == 1) {
                    if (ninjNumB == 0) { pos = new PVector (2,-1,1); ori = 1; }
               else if (ninjNumB == 1) { pos = new PVector (1,-1,1); ori = 1; }
               else if (ninjNumB == 2) { pos = new PVector (2,-1,2); ori = 1; }
       }
      else if (camAng == 2) {
                    if (ninjNumB == 0) { pos = new PVector (1,-1,1); ori = 2; }
               else if (ninjNumB == 1) { pos = new PVector (1,-1,2); ori = 2; }
               else if (ninjNumB == 2) { pos = new PVector (2,-1,1); ori = 2; }
       }
      else if (camAng == 3) {
                    if (ninjNumB == 0) { pos = new PVector (1,-1,2); ori = 3; }
               else if (ninjNumB == 1) { pos = new PVector (2,-1,2); ori = 3; }
               else if (ninjNumB == 2) { pos = new PVector (1,-1,1); ori = 3; }
       }
  }  
  
  //-----------------------------------------------------------------------------------------------------------------
  //Camera Movement
  void camLeft()  {
         if (pos.x == 0 && pos. z == 0) { pos.x = 0; pos.z = 3; } 
    else if (pos.x == 0 && pos. z == 1) { pos.x = 1; pos.z = 3; } 
    else if (pos.x == 0 && pos. z == 2) { pos.x = 2; pos.z = 3; } 
    else if (pos.x == 0 && pos. z == 3) { pos.x = 3; pos.z = 3; } 
    else if (pos.x == 1 && pos. z == 0) { pos.x = 0; pos.z = 2; } 
    else if (pos.x == 1 && pos. z == 1) { pos.x = 1; pos.z = 2; } 
    else if (pos.x == 1 && pos. z == 2) { pos.x = 2; pos.z = 2; } 
    else if (pos.x == 1 && pos. z == 3) { pos.x = 3; pos.z = 2; } 
    else if (pos.x == 2 && pos. z == 0) { pos.x = 0; pos.z = 1; } 
    else if (pos.x == 2 && pos. z == 1) { pos.x = 1; pos.z = 1; } 
    else if (pos.x == 2 && pos. z == 2) { pos.x = 2; pos.z = 1; } 
    else if (pos.x == 2 && pos. z == 3) { pos.x = 3; pos.z = 1; } 
    else if (pos.x == 3 && pos. z == 0) { pos.x = 0; pos.z = 0; } 
    else if (pos.x == 3 && pos. z == 1) { pos.x = 1; pos.z = 0; } 
    else if (pos.x == 3 && pos. z == 2) { pos.x = 2; pos.z = 0; } 
    else if (pos.x == 3 && pos. z == 3) { pos.x = 3; pos.z = 0; } 
    else if (pos.x == 5 && pos. z == 2) { pos.x = 5; pos.z = 3; } 
    else if (pos.x == 5 && pos. z == 3) { pos.x = 6; pos.z = 3; } 
    else if (pos.x == 6 && pos. z == 2) { pos.x = 5; pos.z = 2; } 
    else if (pos.x == 6 && pos. z == 3) { pos.x = 6; pos.z = 2; } 
    
         if (ori==0)  ori=3;  else if (ori==1) ori=0;   else if (ori==2) ori=1;   else if (ori==3) ori=2;
    else if (ori==4)  ori=7;  else if (ori==5) ori=4;   else if (ori==6) ori=5;   else if (ori==7) ori=6;
    else if (ori==8)  ori=16; else if (ori==9) ori=17;  else if (ori==10) ori=18; else if (ori==11) ori=19;
    else if (ori==12) ori=20; else if (ori==13) ori=21; else if (ori==14) ori=22; else if (ori==15) ori=23;
    else if (ori==16) ori=15; else if (ori==17) ori=14; else if (ori==18) ori=13; else if (ori==19) ori=12;
    else if (ori==20) ori=11; else if (ori==21) ori=10; else if (ori==22) ori=9;  else if (ori==23) ori=8;
    
  }
  void camRight()  {
         if (pos.x == 0 && pos. z == 0) { pos.x = 3; pos.z = 0; } 
    else if (pos.x == 0 && pos. z == 1) { pos.x = 2; pos.z = 0; } 
    else if (pos.x == 0 && pos. z == 2) { pos.x = 1; pos.z = 0; } 
    else if (pos.x == 0 && pos. z == 3) { pos.x = 0; pos.z = 0; } 
    else if (pos.x == 1 && pos. z == 0) { pos.x = 3; pos.z = 1; } 
    else if (pos.x == 1 && pos. z == 1) { pos.x = 2; pos.z = 1; } 
    else if (pos.x == 1 && pos. z == 2) { pos.x = 1; pos.z = 1; } 
    else if (pos.x == 1 && pos. z == 3) { pos.x = 0; pos.z = 1; } 
    else if (pos.x == 2 && pos. z == 0) { pos.x = 3; pos.z = 2; } 
    else if (pos.x == 2 && pos. z == 1) { pos.x = 2; pos.z = 2; } 
    else if (pos.x == 2 && pos. z == 2) { pos.x = 1; pos.z = 2; } 
    else if (pos.x == 2 && pos. z == 3) { pos.x = 0; pos.z = 2; } 
    else if (pos.x == 3 && pos. z == 0) { pos.x = 3; pos.z = 3; } 
    else if (pos.x == 3 && pos. z == 1) { pos.x = 2; pos.z = 3; } 
    else if (pos.x == 3 && pos. z == 2) { pos.x = 1; pos.z = 3; } 
    else if (pos.x == 3 && pos. z == 3) { pos.x = 0; pos.z = 3; } 
    else if (pos.x == 5 && pos. z == 2) { pos.x = 6; pos.z = 2; } 
    else if (pos.x == 5 && pos. z == 3) { pos.x = 5; pos.z = 2; } 
    else if (pos.x == 6 && pos. z == 2) { pos.x = 6; pos.z = 3; } 
    else if (pos.x == 6 && pos. z == 3) { pos.x = 5; pos.z = 3; } 
    
         if (ori==0)  ori=1;  else if (ori==1) ori=2;   else if (ori==2) ori=3;   else if (ori==3) ori=0;
    else if (ori==4)  ori=5;  else if (ori==5) ori=6;   else if (ori==6) ori=7;   else if (ori==7) ori=4;
    else if (ori==8)  ori=23; else if (ori==9) ori=22;  else if (ori==10) ori=21; else if (ori==11) ori=20;
    else if (ori==12) ori=19; else if (ori==13) ori=18; else if (ori==14) ori=17; else if (ori==15) ori=16;
    else if (ori==16) ori=8;  else if (ori==17) ori=9;  else if (ori==18) ori=10; else if (ori==19) ori=11;
    else if (ori==20) ori=12; else if (ori==21) ori=13; else if (ori==22) ori=14; else if (ori==23) ori=15;
  }
  
  
  //-----------------------------------------------------------------------------------------------------------------
  //Rotational Ninjoid Movement
  void rot(int rca, int rcb)  {
    if (nope == false) {
    }
  }
  
  //-----------------------------------------------------------------------------------------------------------------
  //Horizontal Ninjoid Movement
  void move(int hA, int hB)  {
    if (nope == false) {
           if (hA == -1) pos.x--;
      else if (hA == 1)  pos.x++;
           if (hB == -1) pos.z--;
      else if (hB == 1)  pos.z++;
    }
  }
  
  //-----------------------------------------------------------------------------------------------------------------
  //Vertical Ninjoid Movement          //Much function, very wow
  void drop()  {
    pos.y++;
  }
  
  void undrop()  {
    pos.y--;
  }
    
  //-----------------------------------------------------------------------------------------------------------------
  //Die
  void die()  {
    if (gamestate == 2) {
      println("lol, I'm ded");
      for (int i=(3*curPiec); i<(3*curPiec)+3; i++) {
        ninjoids.get(i).state = 0;
      }
      curPiec++;
      for (int i=(3*curPiec); i<(3*curPiec)+3; i++) {
        ninjoids.get(i).next();
      }
      ninjoids.add(new Ninjoid(1,(3*(curPiec+1))));
      ninjoids.add(new Ninjoid(1,(3*(curPiec+1))+1));
      ninjoids.add(new Ninjoid(1,(3*(curPiec+1))+2));
      gamestate = 3;
    }
  }
    
  //-----------------------------------------------------------------------------------------------------------------
  //Collision
  boolean collide(int x, int o)  {
          if (x == 0 && (o == 12 || o == 16)) return false;
     else if (x == 1 && (o == 8  || o == 19)) return false;
     else if (x == 2 && (o == 11 || o == 23)) return false;
     else if (x == 3 && (o == 15 || o == 20)) return false;
     else if (x == 4 && (o == 13 || o == 17)) return false;
     else if (x == 5 && (o == 9  || o == 18)) return false;
     else if (x == 6 && (o == 10 || o == 22)) return false;
     else if (x == 7 && (o == 14 || o == 21)) return false;
     else if (x == 8 && (o == 1  || o == 19)) return false;
     else if (x == 9 && (o == 5  || o == 18)) return false;
    else if (x == 10 && (o == 6  || o == 22)) return false;
    else if (x == 11 && (o == 2  || o == 23)) return false;
    else if (x == 12 && (o == 0  || o == 16)) return false;
    else if (x == 13 && (o == 4  || o == 17)) return false;
    else if (x == 14 && (o == 7  || o == 21)) return false;
    else if (x == 15 && (o == 3  || o == 20)) return false;
    else if (x == 16 && (o == 0  || o == 12)) return false;
    else if (x == 17 && (o == 4  || o == 13)) return false;
    else if (x == 18 && (o == 5  || o == 9))  return false;
    else if (x == 19 && (o == 1  || o == 8))  return false;
    else if (x == 20 && (o == 3  || o == 15)) return false;
    else if (x == 21 && (o == 7  || o == 14)) return false;
    else if (x == 22 && (o == 6  || o == 10)) return false;
    else if (x == 23 && (o == 11 || o == 23)) return false;
    else return true;
  }
    
  //-----------------------------------------------------------------------------------------------------------------
  //Draws the Ninjoid
  void display()  {
    stroke(0);
    strokeWeight(3);
    
    if(ori == 0)  {
      v0 = new PVector(pos.x,pos.y,pos.z);
      v1 = new PVector(pos.x,pos.y+1,pos.z);
      v2 = new PVector(pos.x+1,pos.y+1,pos.z);
      v3 = new PVector(pos.x+1,pos.y+1,pos.z+1);
      v4 = new PVector(pos.x,pos.y+1,pos.z+1);
    }
    else if (ori == 1)  {
      v0 = new PVector(pos.x+1,pos.y,pos.z);
      v1 = new PVector(pos.x,pos.y+1,pos.z);
      v2 = new PVector(pos.x+1,pos.y+1,pos.z);
      v3 = new PVector(pos.x+1,pos.y+1,pos.z+1);
      v4 = new PVector(pos.x,pos.y+1,pos.z+1);
    }
    else if (ori == 2)  {
      v0 = new PVector(pos.x+1,pos.y,pos.z+1);
      v1 = new PVector(pos.x,pos.y+1,pos.z);
      v2 = new PVector(pos.x+1,pos.y+1,pos.z);
      v3 = new PVector(pos.x+1,pos.y+1,pos.z+1);
      v4 = new PVector(pos.x,pos.y+1,pos.z+1);
    }
    else if (ori == 3)  {
      v0 = new PVector(pos.x,pos.y,pos.z+1);
      v1 = new PVector(pos.x,pos.y+1,pos.z);
      v2 = new PVector(pos.x+1,pos.y+1,pos.z);
      v3 = new PVector(pos.x+1,pos.y+1,pos.z+1);
      v4 = new PVector(pos.x,pos.y+1,pos.z+1);
    }
    else if(ori == 4)  {
      v0 = new PVector(pos.x,pos.y+1,pos.z);
      v1 = new PVector(pos.x,pos.y,pos.z);
      v2 = new PVector(pos.x+1,pos.y,pos.z);
      v3 = new PVector(pos.x+1,pos.y,pos.z+1);
      v4 = new PVector(pos.x,pos.y,pos.z+1);
    }
    else if (ori == 5)  {
      v0 = new PVector(pos.x+1,pos.y+1,pos.z);
      v1 = new PVector(pos.x,pos.y,pos.z);
      v2 = new PVector(pos.x+1,pos.y,pos.z);
      v3 = new PVector(pos.x+1,pos.y,pos.z+1);
      v4 = new PVector(pos.x,pos.y,pos.z+1);
    }
    else if (ori == 6)  {
      v0 = new PVector(pos.x+1,pos.y+1,pos.z+1);
      v1 = new PVector(pos.x,pos.y,pos.z);
      v2 = new PVector(pos.x+1,pos.y,pos.z);
      v3 = new PVector(pos.x+1,pos.y,pos.z+1);
      v4 = new PVector(pos.x,pos.y,pos.z+1);
    }
    else if (ori == 7)  {
      v0 = new PVector(pos.x,pos.y+1,pos.z+1);
      v1 = new PVector(pos.x,pos.y,pos.z);
      v2 = new PVector(pos.x+1,pos.y,pos.z);
      v3 = new PVector(pos.x+1,pos.y,pos.z+1);
      v4 = new PVector(pos.x,pos.y,pos.z+1);
    }
    else if(ori == 8)  {
      v0 = new PVector(pos.x+1,pos.y,pos.z);
      v1 = new PVector(pos.x,pos.y,pos.z);
      v2 = new PVector(pos.x,pos.y+1,pos.z);
      v3 = new PVector(pos.x,pos.y+1,pos.z+1);
      v4 = new PVector(pos.x,pos.y,pos.z+1);
    }
    else if (ori == 9)  {
      v0 = new PVector(pos.x+1,pos.y+1,pos.z);
      v1 = new PVector(pos.x,pos.y,pos.z);
      v2 = new PVector(pos.x,pos.y+1,pos.z);
      v3 = new PVector(pos.x,pos.y+1,pos.z+1);
      v4 = new PVector(pos.x,pos.y,pos.z+1);
    }
    else if (ori == 10)  {
      v0 = new PVector(pos.x+1,pos.y+1,pos.z+1);
      v1 = new PVector(pos.x,pos.y,pos.z);
      v2 = new PVector(pos.x,pos.y+1,pos.z);
      v3 = new PVector(pos.x,pos.y+1,pos.z+1);
      v4 = new PVector(pos.x,pos.y,pos.z+1);
    }
    else if (ori == 11)  {
      v0 = new PVector(pos.x+1,pos.y,pos.z+1);
      v1 = new PVector(pos.x,pos.y,pos.z);
      v2 = new PVector(pos.x,pos.y+1,pos.z);
      v3 = new PVector(pos.x,pos.y+1,pos.z+1);
      v4 = new PVector(pos.x,pos.y,pos.z+1);
    }
    else if(ori == 12)  {
      v0 = new PVector(pos.x,pos.y,pos.z);
      v1 = new PVector(pos.x+1,pos.y,pos.z);
      v2 = new PVector(pos.x+1,pos.y+1,pos.z);
      v3 = new PVector(pos.x+1,pos.y+1,pos.z+1);
      v4 = new PVector(pos.x+1,pos.y,pos.z+1);
    }
    else if (ori == 13)  {
      v0 = new PVector(pos.x,pos.y+1,pos.z);
      v1 = new PVector(pos.x+1,pos.y,pos.z);
      v2 = new PVector(pos.x+1,pos.y+1,pos.z);
      v3 = new PVector(pos.x+1,pos.y+1,pos.z+1);
      v4 = new PVector(pos.x+1,pos.y,pos.z+1);
    }
    else if (ori == 14)  {
      v0 = new PVector(pos.x,pos.y+1,pos.z+1);
      v1 = new PVector(pos.x+1,pos.y,pos.z);
      v2 = new PVector(pos.x+1,pos.y+1,pos.z);
      v3 = new PVector(pos.x+1,pos.y+1,pos.z+1);
      v4 = new PVector(pos.x+1,pos.y,pos.z+1);
    }
    else if (ori == 15)  {
      v0 = new PVector(pos.x,pos.y,pos.z+1);
      v1 = new PVector(pos.x+1,pos.y,pos.z);
      v2 = new PVector(pos.x+1,pos.y+1,pos.z);
      v3 = new PVector(pos.x+1,pos.y+1,pos.z+1);
      v4 = new PVector(pos.x+1,pos.y,pos.z+1);
    }
    else if(ori == 16)  {
      v0 = new PVector(pos.x,pos.y,pos.z);
      v1 = new PVector(pos.x,pos.y,pos.z+1);
      v2 = new PVector(pos.x,pos.y+1,pos.z+1);
      v3 = new PVector(pos.x+1,pos.y+1,pos.z+1);
      v4 = new PVector(pos.x+1,pos.y,pos.z+1);
    }
    else if (ori == 17)  {
      v0 = new PVector(pos.x,pos.y+1,pos.z);
      v1 = new PVector(pos.x,pos.y,pos.z+1);
      v2 = new PVector(pos.x,pos.y+1,pos.z+1);
      v3 = new PVector(pos.x+1,pos.y+1,pos.z+1);
      v4 = new PVector(pos.x+1,pos.y,pos.z+1);
    }
    else if (ori == 18)  {
      v0 = new PVector(pos.x+1,pos.y+1,pos.z);
      v1 = new PVector(pos.x,pos.y,pos.z+1);
      v2 = new PVector(pos.x,pos.y+1,pos.z+1);
      v3 = new PVector(pos.x+1,pos.y+1,pos.z+1);
      v4 = new PVector(pos.x+1,pos.y,pos.z+1);
    }
    else if (ori == 19)  {
      v0 = new PVector(pos.x+1,pos.y,pos.z);
      v1 = new PVector(pos.x,pos.y,pos.z+1);
      v2 = new PVector(pos.x,pos.y+1,pos.z+1);
      v3 = new PVector(pos.x+1,pos.y+1,pos.z+1);
      v4 = new PVector(pos.x+1,pos.y,pos.z+1);
    }
    else if(ori == 20)  {
      v0 = new PVector(pos.x,pos.y,pos.z+1);
      v1 = new PVector(pos.x,pos.y,pos.z);
      v2 = new PVector(pos.x,pos.y+1,pos.z);
      v3 = new PVector(pos.x+1,pos.y+1,pos.z);
      v4 = new PVector(pos.x+1,pos.y,pos.z);
    }
    else if (ori == 21)  {
      v0 = new PVector(pos.x,pos.y+1,pos.z+1);
      v1 = new PVector(pos.x,pos.y,pos.z);
      v2 = new PVector(pos.x,pos.y+1,pos.z);
      v3 = new PVector(pos.x+1,pos.y+1,pos.z);
      v4 = new PVector(pos.x+1,pos.y,pos.z);
    }
    else if (ori == 22)  {
      v0 = new PVector(pos.x+1,pos.y+1,pos.z+1);
      v1 = new PVector(pos.x,pos.y,pos.z);
      v2 = new PVector(pos.x,pos.y+1,pos.z);
      v3 = new PVector(pos.x+1,pos.y+1,pos.z);
      v4 = new PVector(pos.x+1,pos.y,pos.z);
    }
    else if (ori == 23)  {
      v0 = new PVector(pos.x+1,pos.y,pos.z+1);
      v1 = new PVector(pos.x,pos.y,pos.z);
      v2 = new PVector(pos.x,pos.y+1,pos.z);
      v3 = new PVector(pos.x+1,pos.y+1,pos.z);
      v4 = new PVector(pos.x+1,pos.y,pos.z);
    }
    
    //Square Side
    beginShape(QUADS);
    if (state == 1) fill(255,255,255,32);
    else if (pos.y == -1)  {
      noStroke();
      fill(255,255,255,0);
    }
    else if (pos.y == 0) fill(255,0,255,64);
    else if (pos.y == 1) fill(255,0,0,64);
    else if (pos.y == 2) fill(255,127,0,64);
    else if (pos.y == 3) fill(255,255,0,64);
    else if (pos.y == 4) fill(0,255,0,64);
    else if (pos.y == 5) fill(0,0,255,64);
    else if (pos.y == 6) fill(75,0,130,64);
    else if (pos.y == 7) fill(255,0,255,64);
    
    else fill(255,255,255,32);
    vertex(scale*(v1.x),scale*(v1.y),scale*(v1.z));
    vertex(scale*(v2.x),scale*(v2.y),scale*(v2.z));
    vertex(scale*(v3.x),scale*(v3.y),scale*(v3.z));
    vertex(scale*(v4.x),scale*(v4.y),scale*(v4.z));
    endShape(CLOSE);
      //Triangle Sides
    beginShape(TRIANGLE_STRIP);
    if (state == 1) fill(255,255,255,32);
    else if (pos.y == -1)  {
      noStroke();
      fill(255,255,255,0);
    }
    else if (pos.y == 0) fill(255,0,255,64);
    else if (pos.y == 1) fill(255,0,0,64);
    else if (pos.y == 2) fill(255,127,0,64);
    else if (pos.y == 3) fill(255,255,0,64);
    else if (pos.y == 4) fill(0,255,0,64);
    else if (pos.y == 5) fill(0,0,255,64);
    else if (pos.y == 6) fill(75,0,130,64);
    else if (pos.y == 7) fill(255,0,255,64);
    else fill(255,255,255,32);
    vertex(scale*(v1.x),scale*(v1.y),scale*(v1.z));
    vertex(scale*(v0.x),scale*(v0.y),scale*(v0.z));
    vertex(scale*(v2.x),scale*(v2.y),scale*(v2.z));
    vertex(scale*(v0.x),scale*(v0.y),scale*(v0.z));
    vertex(scale*(v3.x),scale*(v3.y),scale*(v3.z));
    vertex(scale*(v0.x),scale*(v0.y),scale*(v0.z));
    vertex(scale*(v4.x),scale*(v4.y),scale*(v4.z));
    vertex(scale*(v0.x),scale*(v0.y),scale*(v0.z));
    vertex(scale*(v1.x),scale*(v1.y),scale*(v1.z));
    endShape(CLOSE);
  }

}
