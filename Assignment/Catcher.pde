class Catcher extends GameObject
{
  void render()
  {
     fill(0,0,255,200);
     stroke(0,0,255);
     rect(pos.x,pos.y,objectW,-objectW);
  }
  
  //controls the capture of probes
  void catchProbe()
  {
      for(int i=0;i<prArray.size();i++)
      {
         if(prArray.get(i).lane==lane)
         {
            if(pos.y-objectW<prArray.get(i).pos.y)
            {
               prArray.remove(i);
               credit.applyTo();
            }
         }
      }
  }
  
  //this method moves the linesman
   void move()
   {
     int move=1;
     
       //if the lineman has been placed, it will move just before the battleline
       if(placedinSlot==true)
       {
         render(); 
         catchProbe();
         
         if(pos.y>(height/2)+objectW)
         {
           pos.y-=move;
         }
         if(pos.y<=(height/2)+objectW)
         {   
             fill(255);
             textSize(12);
             //displays a counter so the user can see how long the linesman has left
             text((int)map(frame,0,60*20,20,1),pos.x+objectW/2,pos.y-objectW/4);
             
             //destroy after 20 seconds
             if(frame==60*20)
             {
               explode();
               destroy();
               frame=0;
             }
             frame++;
         }
    }
     
   }
}