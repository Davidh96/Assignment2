class IFO extends GameObject
{
    
    IFO()
    { 
      maxhealth=10;
      health=maxhealth;
      cost=200;
    }
  
   //draws the tank object
   void render()
   {
     stroke(0);
    
     fill(0,0,255);
     ellipse(pos.x+(objectW/2),pos.y-(objectW/2),objectW,objectW);
     fill(150,150,255);
     ellipse(pos.x+(objectW/2),pos.y-(objectW/2),objectW/2,objectW/2);
     
     //this is to ensure that the check lane is for objs placed and not for the object in the objMenu
     if(placedinSlot)
     {
       //healthbar
       fill(0,255,0);
       rect(pos.x,pos.y,map(health,0,maxhealth,0,objectW),10);
     }     
   } 
   
   //this method controls the IFO movements
   void move()
   {
     int move=3;
     
     //if the tank has been placed, it will move to the battleline
     if(placedinSlot==true)
     {
       render(); 
       if(pos.y>(height/2))
       {
         pos.y-=move;
       }
       if(pos.y<=height/2)
       {
        detect(); 
       }    
     }
   }
   
   //This method is used to detect wheth an object should be fired at
   void detect()
   {
      for(int i=0;i<twArray.size();i++)
      {
         if(twArray.get(i).lane==lane)
         {
            shoot(i); 
         } 
      } 
   }
   
   //This method shoots bullets from the tank
   void shoot(int k)
   {

      if(frame==25)
      {
        Bullet Bullet = new Bullet(pos.x,pos.y-objectW);
        blArray.add(Bullet);
        frame=0;
      }
      
      frame++;
          
          for(int i=0;i<blArray.size();i++)
         {
             boolean friendly=true;
             blArray.get(i).render(friendly);
             blArray.get(i).pos.y-=2;
         
             if(blArray.get(i).pos.y<objectW)
             {
                //object takes damage
                twArray.get(k).takeDamage();
                blArray.remove(i); 
             }
         }
      }
  
}