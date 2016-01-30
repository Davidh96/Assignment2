class ObjectMenu
{
   ArrayList<GameObject> menuObjs=new ArrayList<GameObject>();
   float padding=10;
   ObjectMenu()
   {
      
   }
   
   //draws a menu to the side that will allow users to pick items
   void render()
   {
      fill(50,50,50,200);
      stroke(255);
      rect(width-objectW,0,objectW,height); 
   }
   
  void objMenu()
  {
    float menuLane=(float)width-(float)objectW;
    
    Ship mShip=new Ship();
    mShip.pos=new PVector(menuLane,objectW+padding);
    menuObjs.add(mShip);
    mShip.render();
    
    IFO mIFO = new IFO();
    mIFO.pos=new PVector(menuLane,(objectW*2)+padding);
    menuObjs.add(mIFO);
    mIFO.render();
    
    Lineman lineman = new Lineman();
    lineman.pos=new PVector(menuLane,(objectW*3)+padding);
    menuObjs.add(lineman);
    lineman.render();
    
    Bomber bomber = new Bomber();
    bomber.pos=new PVector(menuLane,(objectW*4)+padding);
    menuObjs.add(bomber);
    bomber.render();
    
    for(int i=1;i<5;i++)
    {
       stroke(255);
       line(menuLane,objectW*i+padding,menuLane+objectW,objectW*i+padding);
    }
    if(mouseX>width-objectW)
    {
      if(mouseY<objectW*4)
      {   fill(255,255,255,100);
          rect(width-objectW,(int)map(mouseY,0,objectW*4,0,4)*objectW+padding,objectW,objectW);
      }
    }
  }
  
  void objChosen()
  {

    if(mouseY<=objectW)
    {
         Ship ship =new Ship();
         objArray.add(ship);
         objectChosen=true;
         objAllowed=false;
    }
    if(mouseY<=objectW*2 && mouseY>objectW)
    {
       IFO ifo=new IFO();
       objArray.add(ifo);
       objectChosen=true;
       objAllowed=false; 
    }
    if(mouseY<=objectW*3 && mouseY>objectW*2)
    {
       Lineman lineman = new Lineman();
       objArray.add(lineman);
       objectChosen=true;
       objAllowed=false; 
    }
     if(mouseY<=objectW*4 && mouseY>objectW*3)
    {
       Bomber bomber = new Bomber();
       objArray.add(bomber);
       objectChosen=true;
       objAllowed=false; 
    }
    
    
  }
}