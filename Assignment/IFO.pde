class IFO extends GameObject
{
  IFO()
  {
    
  }
  
   //draws the tank object
   void render()
   {
     stroke(0);
       
     //this will place the tank in a slot rather than the actual position chosen by the user
     lane=(int)pos.x/(int)objectW;
     pos.x=lane*objectW;
     
     //this is to ensure that the check lane is for objs placed and not for the object in the objMenu
     if(lane<objNum)
     {
       laneCheck[lane]=true; 
     }
     
     ellipse(pos.x,pos.y,objectW,objectW);
     
   } 
   
   void move()
   {
     int move=2;
       //if the tank has been placed, it will move to the battleline
       if(placedinSlot==true)
       {
         render(); 
         if(pos.y>(height/2))
         {
           pos.y-=move;
         }
         if(pos.y<=(height/2))
         {
            twArray.get(lane).shoot(pos.y); 
            shoot();
         }
         else
         {
            if(twArray.get(lane).blArray.size()>0)
            {
               for(int i=0;i<twArray.get(lane).blArray.size();i++)
               {
                 twArray.get(lane).blArray.remove(i);
               }
            }
         }
       }
     
   }
   
   //This method shoots bullets from the tank
   void shoot()
   {
    //if the tower infront has not been destroyed  
   if(twArray.get(lane).destroyed==false)
     {
       if(pos.y<(float)(width/2)+objectW)
       {
           //after 1 secnd create a bullet
           if(frame>50)
           {
             Bullet bullet = new Bullet(pos.x,pos.y-objectW);
             blArray.add(bullet);
             //reset timer
             frame=0;
           }
          
          //render all bullets in the blArray
          for(int i=0;i<blArray.size();i++)
          {
            boolean friendly=true;
            blArray.get(i).render(friendly);
          } 
          //a frame has passed
          frame++;

          
       }
     for(int i=0;i<blArray.size();i++)
     {
       blArray.get(i).pos.y-=2;
     
       if(blArray.get(i).pos.y<objectW)
       {
         //this method will reve the bullet from the blArray
          blArray.remove(i);
          //this will tell the tower that it took damage and to decrease its health
          twArray.get(lane).takeDamage();
       }
     }
      
    }
   }
  
  
}