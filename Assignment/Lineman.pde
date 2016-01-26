class Lineman extends GameObject
{

   Lineman()
   {

   }
   
   //draws the tank object
   void render()
   {
     stroke(0);
       
    //this will place the tank in a slot rather than the actual position chosen by the user
     lane=(int)pos.x/(int)objectW;
     pos.x=lane*objectW;
     fill(0,0,255);
     ellipse(pos.x+objectW/2,pos.y-objectW/2,objectW,objectW);
     fill(150,150,255);
     rect(pos.x,pos.y,objectW/4,-(objectW+10));
     rect(pos.x+objectW-(objectW/4),pos.y,objectW/4,-(objectW+10));
   } 
   
   //this method moves the linesman
   void move()
   {
     int move=1;
     
       //if the lineman has been placed, it will move just before the battleline
       if(placedinSlot==true)
       {
         render(); 
         if(pos.y>(height/2)+objectW)
         {
           pos.y-=move;
         }
         if(pos.y<=(height/2)+objectW)
         {
           //only move the bLineY once
           if(frame==0)
           {
           bLineY-=objectW;
           }
           
           //if 10 seconds have passed then the bLineY will be reset
           if(frame==600)
           {
           objArray.remove(this);
           bLineY+=objectW;
           frame=0;
           }
           frame++;
         }
    }
     
   }
   
}