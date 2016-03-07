class Lineman extends GameObject
{  
  float extend;
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
     //arms
     rect(pos.x,pos.y,objectW/4,-(objectW)+extend);
     rect(pos.x+objectW-(objectW/4),pos.y,objectW/4,-(objectW)+extend);
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
             //extend the bLineY if lineman at half way point
             if(bLineY>(height/2)-objectW)
             {
               bLineY-=objectW;
             }
           
             extend=bLineY-(pos.y-objectW);
             fill(255);
             textSize(12);
             //displays a counter so the user can see how long the linesman has left
             text((int)map(frame,0,600,10,1),pos.x+objectW/2,pos.y-objectW/4);
             
             //if 10 seconds have passed then the bLineY will be reset
             if(frame==600)
             {
               explode();
               destroy();
               bLineY+=objectW;
               frame=0;
             }
             frame++;
         }
    }
     
   }
   
}