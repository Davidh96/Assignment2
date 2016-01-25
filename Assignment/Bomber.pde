class Bomber extends GameObject
{
  //preExplode is used to deterine whether or not a bomber explodes before reaching the end of the lane
   int preExplode;
   
   Bomber()
   {
      preExplode=(int)random(0,2);
   }
   
   void render()
   {
     //this will place the bomber in a slot rather than the actual position chosen by the user
     lane=(int)pos.x/(int)objectW;
     pos.x=lane*objectW;
     fill(0,0,255);
     ellipse(pos.x+objectW/2,pos.y-objectW/2,objectW,objectW);
   }
   
   void move()
   {
    int move=2;
     
       //if the tank has been placed, it will move to the battleline
       if(placedinSlot==true)
       {
         render(); 
        if(pos.y>objectW)
         {
           pos.y-=move;
         }
         if(pos.y<=objectW)
         {
           objArray.remove(this);
           //will only take half of the current health of the tower
           twArray.get(lane).health-=twArray.get(lane).health/2;
           twArray.get(lane).takeDamage();
         }
         if(pos.y<=(bLineY))
         {
            println(preExplode);
            if(preExplode==1)
            {
              objArray.remove(this); 
            }
         }
       }
   }
   
}