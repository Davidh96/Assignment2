class Tower extends GameObject
{

   boolean destroyed=false; 
   int frame=0;
   
   
   Tower(int i)
   {
      pos=new PVector(i*objectW,0);
      lane=(int)map(pos.x,0,width,0,11);
      health=15;
   }
   
   //draws the tower object
   void render()
   {
     if(destroyed==false)
     {
       fill(255,0,0);
       stroke(0);
       rect(pos.x,pos.y,objectW,objectW);
       
       fill(255,100,100);
       stroke(255,100,100);
       rect(pos.x+10,pos.y+10,objectW-20,objectW-20);
       
       stroke(0);
       fill(255,0,0);
       ellipse(pos.x+(objectW/2),pos.y+(objectW/2),30,30);
       
       fill(255,100,100);
       rect(pos.x+20,pos.y+20,objectW-40,objectW-10);
       
       
     }
       
   }
   
   //this creates bllets and shoots at tanks
   void shoot(float tkY)
   {
    
     if(destroyed==false)
     {
        if(frame==25)
        {
          Bullet Bullet = new Bullet(pos.x,pos.y+objectW);
          blArray.add(Bullet);
          frame=0;
        }
        
         frame++;
          
          for(int i=0;i<blArray.size();i++)
         {
             boolean friendly=false;
             blArray.get(i).render(friendly);
             blArray.get(i).pos.y+=2;
             
             if(blArray.get(i).pos.y>=tkY-objectW)
             {
               //go through the array of tanks
               for(int j=0;j<tkArray.size();j++)
               {
                 //will check if the object has actually been given a position on the screen
                 if(tkArray.get(j).placedinSlot==true)
                 {
                   //if the bullet and object are in the same lane
                  if(lane==(int)map(tkArray.get(j).pos.x,0,width,0,11))
                  {
                    //object takes damage
                    tkArray.get(j).takeDamage();
                  }
                 }
               }
                blArray.remove(i); 
             }
         }
      }
   }
   void takeDamage()
   {
     //decrease health by 1
     health--;
     
     //if health is below 1 then the tower has been destroyed
     if(health<1)
     {
       destroyed=true; 
     }  
      
   }
}