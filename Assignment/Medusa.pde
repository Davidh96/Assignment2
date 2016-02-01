class Medusa extends Tower
{
   Medusa(int i)
   {
      pos=new PVector(i*objectW,0);
      lane=(int)map(pos.x,0,width,0,11);
      maxhealth=10;
      health=maxhealth;
   }
   
   //draws the tower object
   void render()
   {
       fill(255,0,0);
       stroke(255,0,0);
       rect(pos.x,pos.y+10,objectW,objectW);
       
       //healthbar
       fill(0,255,0);
       stroke(0);
       rect(pos.x,pos.y,map(health,0,maxhealth,0,objectW),10);
       
       detect();
       destroy();  
   }
   
   //this creates bllets and shoots at tanks
   void shoot()
   {
      //create a bullet every 25 frames
      if(frame==200)
      {
        Bullet Bullet = new Bullet(pos.x,pos.y+objectW);
        blArray.add(Bullet);
        frame=0;
      }
      
      frame++;
        
        doDamage();
    }
    
    //this method controls the destruction of medusa
    void destroy()
    {
       
       if(health<1)
       {
         //set the healh to 0 so that the health doesnt go into minus values
         health=0;
          for(int i=0;i<twArray.size();i++)
          {
            //find the index of the medusa half in the next lane
             if(lane==twArray.get(i).lane+1)
             {
                  if(twArray.get(i).health<1)
                  {   
                      twCreated[lane]=false;
                      twCreated[lane-1]=false;
                      //the two halfs are destroyed
                      twArray.remove(this);
                      twArray.remove(i);
                  }
             }

          }
       }
    }
}