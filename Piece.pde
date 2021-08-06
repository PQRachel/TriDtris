class Piece {
  int count;
  int id;
  int pState; //0=Dead, 1=Sshhh 1 isn't real, 2=Alive
  
  Piece (int pc, int ii)  {
    count = 3*pc;
    
    id = ii;
    pState = 2;
    println("pState: "+pState);
    
    if (gamestate == 1)  {
      println("C- Create ninj: "+count);
      println("C- Create ninj: "+(count+1));
      println("C- Create ninj: "+(count+2));
      ninjoids.add(new Ninjoid(2,count));
      ninjoids.add(new Ninjoid(2,count+1));
      ninjoids.add(new Ninjoid(2,count+2));
      println("C- Ninjoid Total: "+ninjoids.size());
      gamestate = 2;
      println("C- gs: "+gamestate);
      println("C- Create piece: 1");
      pieces.add(new Piece(1,0));
    }
    else if (gamestate == 2)  {
      println("D- Create ninj: "+count);
      println("D- Create ninj: "+(count+1));
      println("D- Create ninj: "+(count+2));
      ninjoids.add(new Ninjoid(1,count));
      ninjoids.add(new Ninjoid(1,count+1));
      ninjoids.add(new Ninjoid(1,count+2));
      println("D- Ninjoid Total: "+ninjoids.size());
      gamestate = 3;
      println("D- gs: "+gamestate);
    }
    else if (gamestate == 3)  {
      println("I- Create ninj: "+count);
      println("I- Create ninj: "+(count+1));
      println("I- Create ninj: "+(count+2));
      ninjoids.add(new Ninjoid(1,count));
      ninjoids.add(new Ninjoid(1,count+1));
      ninjoids.add(new Ninjoid(1,count+2));
    }
  }
  
  //-----------------------------------------------------------------------------------------------------------------
  //Manual Piece Movement
  void control(int ky)  {
    if (pState == 2) {
      for (int i=count; i<count+3; i++)  {
        ninjoids.get(i).control(keyCode);
      }
    }
  }
  
  //-----------------------------------------------------------------------------------------------------------------
  //Automatic Piece Movement
  void move()  {
    if (pState == 2) {
      for (int i=count; i<count+3; i++)  {
        ninjoids.get(i).move();
      }
    }
  }  
  
  //-----------------------------------------------------------------------------------------------------------------
  //Vertical Collision Stopping
  void stop()  {
    println("F- Trying to stop");
    if (pState == 2)  {
      pState = 0;
      println("F- pState: "+pState);
      for (int i=count; i<count+3; i++)  {
        println("F- Calling Ninjoid " +i+ "'s Next Function");
        ninjoids.get(i).next();
      }
      gamestate = 3;
      println("H- gs: "+gamestate);
      println("H- Create piece: "+pieces.size());
      pieces.add(new Piece(pieces.size(),0));
    }
  }
  
  //-----------------------------------------------------------------------------------------------------------------
  //Automatic Ninjoid Movement
  void display()  {
    for (int i=count; i<count+3; i++){
      ninjoids.get(i).display();
    }
  }
}
