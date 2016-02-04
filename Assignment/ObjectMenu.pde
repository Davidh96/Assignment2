class ObjectMenu
{
   ArrayList<GameObject> menuObjs=new ArrayList<GameObject>();
   ObjectMenu()
   {
      
   }
   
   //draws a menu to the side that will allow users to pick items
   void render()
   {
      fill(50,50,50,255);
      stroke(255);
      rect(width-objectW,0,objectW,height); 
   }
   
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
    
    
    for(int i=1;i<5;i++)
    {
       stroke(255);
       line(menuLane,objectW*i,menuLane+objectW,objectW*i);
    }
    if(mouseX>width-objectW)
    {
      if(mouseY<objectW*4)
      {   fill(255,255,255,100);
          rect(width-objectW,(int)map(mouseY,0,objectW*4,0,4)*objectW,objectW,objectW);
      }
    }
    
    description();
  }
  
  void description()
  {
    if(mouseX>width-objectW)
    {
      fill(255,255,255,200);
      if(mouseY<=objectW)
      {
          rect(width-objectW,0,-objectW*2,objectW);
      }
      if(mouseY<=objectW*2 && mouseY>objectW)
      {
          rect(width-objectW,objectW,-objectW*2,objectW);
      }
      if(mouseY<=objectW*3 && mouseY>objectW*2)
      {
          rect(width-objectW,objectW*2,-objectW*2,objectW);
      }
       if(mouseY<=objectW*4 && mouseY>objectW*3)
      {
         rect(width-objectW,objectW*3,-objectW*2,objectW);
      }
    }
  }
  
  void objChosen()
  {

    if(mouseY<=objectW)
    {
      if(credit.amount>=100)
      {
         Ship ship =new Ship();
         objArray.add(ship);
         objectChosen=true;
         objAllowed=false;
         credit.reduce(ship.cost);
      }
    }
    if(mouseY<=objectW*2 && mouseY>objectW)
    {
      if(credit.amount>=200)
      {
       IFO ifo=new IFO();
       objArray.add(ifo);
       objectChosen=true;
       objAllowed=false; 
       credit.reduce(ifo.cost);
      }
    }
    if(mouseY<=objectW*3 && mouseY>objectW*2)
    {
      if(credit.amount>=250)
      {
       Lineman lineman = new Lineman();
       objArray.add(lineman);
       objectChosen=true;
       objAllowed=false; 
       credit.reduce(lineman.cost);
      }
    }
     if(mouseY<=objectW*4 && mouseY>objectW*3)
    {
      if(credit.amount>=50)
      {
       Bomber bomber = new Bomber();
       objArray.add(bomber);
       objectChosen=true;
       objAllowed=false;
       credit.reduce(bomber.cost);
      }
    }

    
    
  }
}