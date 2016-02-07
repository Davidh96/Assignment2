class Probe
{
  PVector pos;
  //rand1 and rand2 are used to randomly spawn the probes
  int rand1=0;
  int rand2=0;
  float pWidth;
  int lane;
  float move;
   
   Probe(float x,float y)
   {
     pos=new PVector(x+objectW/2,y);
     rand1=(int)random(0,10);
     pWidth=(random(objectW/2,objectW));
     lane=(int)map(pos.x,0,width,0,11);
     move=random(2,3);
   }
   
   //renders the probe
   void render()
   {
      //if lane not yet captured
      if(laneCaptured[lane]==false && laneCleared[lane]==false)
      {
        
  
        if(pos.y<height)
         {
           pos.y+=move;
           //by varying the pwidth each frame it makes the probe look like its flashing
           pWidth=(random(objectW/2,objectW));
         }
         //if the probe has reached the end of the lane
         else
         {
            prArray.remove(this);
            capture();
         }
  
         fill(255,0,0);
         stroke(255,0,0);
         ellipse(pos.x,pos.y,pWidth,pWidth);
         
         destroy();
      }
      //if the lane has been already captured then destroy itself and try to get a different lane
      else
      {
         prArray.remove(this);
      }
    }
    
    //this method controls whether a player has destroyed a probe
    void destroy()
    {
        //if the mouse is within the same x values as the probe
       if(mouseX>pos.x-objectW/2 && mouseX<pos.x+objectW/2)
       {
         //if the mouse is within the same y values as the probe
         if(mouseY>pos.y-objectW/2 && mouseY<pos.y+objectW/2)
         {
           if(mousePressed)
           {
              credit.applyTo();
              prArray.remove(this);
           }
         }
       }
    }
    
    //this method deals with the probe capturing lanes
    void capture()
    {
        laneUsed[lane]=true;
        laneCaptured[lane]=true;
    }
   
}