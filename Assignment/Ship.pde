class Ship extends AttackObj
{
   Ship()
   {
      getAttributes("Ship,");
      cost=100;
   }
   
   
   //draws the tank object
   void render()
   {
     stroke(0);
     
     //this is to ensure that the check lane is for objs placed and not for the object in the objMenu
     if(placedinSlot)
     {
       displayHealth();
     }
     
     fill(0,0,255);
     //left wing
     rect(pos.x,pos.y,(objectW*.25),-objectW/2);
     //right wing
     rect(pos.x+objectW*.75,pos.y,(objectW*.25),-objectW/2);
     
     //gun turret
     fill(0,0,255);
     rect(pos.x+(objectW/4),pos.y,objectW/2,-objectW+fire);
     fill(150,150,255);
     ellipse(pos.x+(objectW/2),pos.y-(objectW/4),objectW/2,objectW/2);
     
     

   } 
   
   void move()
   {
     int move=1;
     
       //if the ship has been placed, it will move to the battleline
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
     
   
}