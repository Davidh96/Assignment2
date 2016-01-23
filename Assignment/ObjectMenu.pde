class ObjectMenu
{
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
    float menuLane=width-objectW;
    
    Tank mTank=new Tank();
    mTank.pos=new PVector(menuLane,objectW);
    mTank.render();
    
    IFO mIFO = new IFO();
    mIFO.pos=new PVector(menuLane,objectW*2);
    mIFO.render();
    
  }
  
  void objChosen()
  {
    if(mouseY<=objectW)
    {
         Tank tank =new Tank();
         objArray.add(tank);
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
    
    
  }
}