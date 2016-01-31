class Lineman extends GameObject
{  
  Lineman()
  {
     cost=250; 
  }
   //draws the tank object
   void render()
   {
     stroke(0);

     fill(0,0,255);
     ellipse(pos.x+objectW/2,pos.y-objectW/4,objectW/1.5,objectW/2);
     fill(150,150,255);
     rect(pos.x,pos.y,objectW/4,-(objectW));
     rect(pos.x+objectW-(objectW/4),pos.y,objectW/4,-(objectW));
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
           
           //displays a counter so the user can see how long the linesman has left
           text((int)map(frame,0,600,10,0),pos.x+objectW/2,pos.y-objectW/4);
           
           //if 10 seconds have passed then the bLineY will be reset
           if(frame==600)
           {
             destroy();
             bLineY+=objectW;
             frame=0;
           }
           frame++;
         }
    }
     
   }
   
}