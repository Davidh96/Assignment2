class ObjectMenu
{
   ArrayList<GameObject> menuObjs=new ArrayList<GameObject>();
   float objSelect=0;
   
   //draws a menu to the side that will allow users to pick items
   void render()
   {
      fill(50,50,50,255);
      stroke(255);
      rect(width-objectW,0,objectW,height); 
   }
   
   //display the obj in themenu
  void objMenu()
  {
      float menuLane=(float)width-(float)objectW;
      
      Ship mShip=new Ship();
      mShip.pos=new PVector(menuLane,objectW);
      menuObjs.add(mShip);
      mShip.render();
      
      IFO mIFO = new IFO();
      mIFO.pos=new PVector(menuLane,(objectW*2));
      menuObjs.add(mIFO);
      mIFO.render();
      
      Lineman lineman = new Lineman();
      lineman.pos=new PVector(menuLane,(objectW*3));
      menuObjs.add(lineman);
      lineman.render();
      
      Bomber bomber = new Bomber();
      bomber.pos=new PVector(menuLane,(objectW*4));
      menuObjs.add(bomber);
      bomber.render();
      
      //will allow a user to delete an obj once they have been played
      Bin bin=new Bin();
      bin.pos=new PVector(menuLane,objectW*5);
      bin.render();
      
      
      for(int i=1;i<5;i++)
      {
         stroke(255);
         line(menuLane,objectW*i,menuLane+objectW,objectW*i);
      }
      //checks if mouseX is over objmenu
      if(mouseX>width-objectW)
      {
        //will highlight the obj that the user is currently looking at
        if(mouseY<objectW*4)
        {   fill(255,255,255,100);
            rect(width-objectW,(int)map(mouseY,0,objectW*4,0,4)*objectW,objectW,objectW);
        }
      }
      
      fill(255,255,255,200);
      rect(width,height,-objectW,-boxW);
      fill(0);
      text("MENU",width-objectW/2,height-boxW/2);
      
      if(mouseX>width-objectW && mouseY>height-boxW)
      {
         if(mousePressed)
         {
            menuChoice=0; 
         }
      } 
    
    description();
  }
  
  //controls what descriptions to display
  void description()
  {
    if(mouseX>width-objectW)
    {
      fill(255,255,255,200);
      if(mouseY<=objectW)
      {
          rect(width-objectW,0,-objectW*4,objectW);
          //show description for ship
          desc.giveDescription(width-objectW*3,objectW/2,"Ship-");
      }
      if(mouseY<=objectW*2 && mouseY>objectW)
      {
          rect(width-objectW,objectW,-objectW*4,objectW);
          //show description IFO
          desc.giveDescription(width-objectW*3,objectW*1.5,"IFO-");
      }
      if(mouseY<=objectW*3 && mouseY>objectW*2)
      {
          rect(width-objectW,objectW*2,-objectW*4,objectW);
          //show description for Lineman
          desc.giveDescription(width-objectW*3,objectW*2.5,"Lineman-");
      }
       if(mouseY<=objectW*4 && mouseY>objectW*3)
      {
         rect(width-objectW,objectW*3,-objectW*4,objectW);
         //show description Bomber
         desc.giveDescription(width-objectW*3,objectW*3.5,"Bomber-");
      }
    }
  }
  
  //controls what objs have been selected form the objMenu
  void objChosen()
  {
    //Ship
    if(mouseY<=objectW)
    {
      if(credit.amount>=100)
      {
         Ship ship =new Ship();
         objArray.add(ship);
         objectChosen=true;
         objAllowed=false;
      }
    }
    //IFO
    if(mouseY<=objectW*2 && mouseY>objectW)
    {
      if(credit.amount>=200)
      {
       IFO ifo=new IFO();
       objArray.add(ifo);
       objectChosen=true;
       objAllowed=false; 
      }
    }
    //Lineman
    if(mouseY<=objectW*3 && mouseY>objectW*2)
    {
      if(credit.amount>=250)
      {
       Lineman lineman = new Lineman();
       objArray.add(lineman);
       objectChosen=true;
       objAllowed=false; 
      }
    }
    //Bomber
    if(mouseY<=objectW*4 && mouseY>objectW*3)
    {
      if(credit.amount>=50)
      {
       Bomber bomber = new Bomber();
       objArray.add(bomber);
       objectChosen=true;
       objAllowed=false;
      }
    }
    //Bin
    if(mouseY<=objectW*5 && mouseY>objectW*4)
    {
      deleteObj=true;
    }
    
    selected=true;
    objSelect=(int)(map(mouseY,0,objectW*4,0,4))*objectW;
  }
  
  //will display what object has been selected from the object menu
  void showSelected()
  {
    if(objSelect<objectW*5)
    {
      if(selected)
      {
        fill(255,255,255,100);
        rect(width-objectW,objSelect,objectW,objectW);
      }
    }
  }
}