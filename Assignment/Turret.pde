//This is the basic tower type
class Turret extends Tower
{
  
  Turret()
  {
    
  }
   
   Turret(int i)
   {
      pos=new PVector(i*objectW,0);
      lane=(int)map(pos.x,0,width,0,11);
      maxhealth=15;
      health=maxhealth;
   }
   
   //draws the tower object
   void render()
   {
     if(destroyed==false)
     {
       fill(255,0,0);
       stroke(0);
       ellipse(pos.x+objectW/2,pos.y+objectW/2+10,objectW,objectW);
       
       //gun turret
       fill(255,100,100);
       rect(pos.x+objectW*.15,pos.y+objectW*.35,objectW*.15,objectW);
       rect(pos.x+objectW*.85,pos.y+objectW*.35,-objectW*.15,objectW);
       
       
       //healthbar
       fill(0,255,0);
       rect(pos.x,pos.y,map(health,0,maxhealth,0,objectW),10);

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
               for(int j=0;j<objArray.size();j++)
               {
                 //will check if the object has actually been given a position on the screen
                 if(objArray.get(j).placedinSlot==true)
                 {
                   //if the bullet and object are in the same lane
                  if(lane==objArray.get(j).lane)
                  {
                    //object takes damage
                    objArray.get(j).takeDamage();
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
       laneCleared=true;
     }  
      
   }
}