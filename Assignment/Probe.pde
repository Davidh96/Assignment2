class Probe
{
  PVector pos;
  //rand1 and rand2 are used to randomly spawn the probes
  int rand1=0;
  int rand2=0;
  float pWidth;
   
   Probe(float x,float y)
   {
     pos=new PVector(x+objectW/2,y);
     rand1=(int)random(0,10);
     pWidth=(random(objectW/2,objectW));
   }
   
   //renders the probe
   void render()
   {
      float move=2;

      if(pos.y<height)
       {
         pos.y+=move;
         //by varying the pwidth each frame it makes the probe look like its flashing
         pWidth=(random(objectW/2,objectW));
       }
       else
       {
          prArray.remove(this); 
       }

       println(pos.x,pos.y);
       fill(255,0,0);
       stroke(255,0,0);
       ellipse(pos.x,pos.y,pWidth,pWidth);
       
       destroy();
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
              prArray.remove(this);
           }
         }
       }
    }
   
}