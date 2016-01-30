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

     if(placedinSlot)
     {
      fill(255);
      stroke(255,0,0);
      laneUsed[lane]=true;
      ellipse(pos.x+objectW/2-10,pos.y-objectW+10,random(5,10),random(5,10)); 
     }
     
     fill(0,0,255);
     stroke(0,0,255);
     ellipse(pos.x+objectW/2,pos.y-objectW/3,objectW/1.5,objectW/1.5);
     fill(0);
     textAlign(CENTER,CENTER);
     text("Bomb",pos.x+objectW/2,pos.y-objectW/3);
     stroke(0,0,255);
     line(pos.x+objectW/2,pos.y-objectW/2,pos.x+objectW/2-10,pos.y-objectW+10);
     fill(255, 165, 0);
     stroke(255, 165, 0);
     ellipse(pos.x+objectW/2-10,pos.y-objectW+10,5,5);

   }
   
   void move()
   {
    int move=2;
    
       //if the bomber has been placed, it will move to the battleline
       if(placedinSlot==true)
       {
        render(); 
        //move until it has reached the other end of the battlefield
        if(pos.y>objectW)
         {
           pos.y-=move;
         }
         
         //once the bomb reaches the battle line
         if(pos.y<=(bLineY))
         {
            //if 1 then the bomb will exploe prematurely
            if(preExplode==1)
            {
              destroy(); 
            }
         }
         
         //will check for collision with tower 
         for(int i=0;i<twArray.size();i++)
         {
             //check if in same lane
             if(lane==twArray.get(i).lane)
             {
                if(pos.y<=twArray.get(i).pos.y+objectW)
                {
                   //will only half the health of a tower from its current health
                   twArray.get(i).health=twArray.get(i).health/2;
                   destroy();
                }
             }
         }
         
       }
   }
   
}