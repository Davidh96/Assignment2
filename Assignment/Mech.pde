class Mech extends Tower
{
  boolean armSwitch=true;
   Mech(int i)
   {
      pos=new PVector(i*objectW,0);
      lane=(int)map(pos.x,0,width,0,11);
      maxhealth=30;
      health=maxhealth;
   }
   //draws the tower object
   void render()
   {

       fill(255,0,0);
       rect(pos.x,pos.y+10,objectW,objectW/2);
       //arms
       rect(pos.x,pos.y+10,10,objectW);
       rect(pos.x+objectW,pos.y,-10,objectW+10);
       
       //healthbar
       fill(0,255,0);
       rect(pos.x,pos.y,map(health,0,maxhealth,0,objectW),10);
       
       detect();

       
   }
   
   //This method is used to detect wheth an object should be fired at
   void detect()
   {
      for(int i=0;i<objArray.size();i++)
      {
        //if the object has been placed, prevents program from crashing
        if(objArray.get(i).placedinSlot==true)
        {
          //if an object is in the same lane
         if(objArray.get(i).lane==lane)
         {
           //if the object is past the bLineY
           if(objArray.get(i).pos.y<=bLineY)
           {
             //this is to ensure that the towers will nly shoot at tanks and ifos
             if(objArray.get(i) instanceof Tank || objArray.get(i) instanceof IFO)
             {
                shoot(i); 
             }
           }
         }
        }
      }
   }
   
   //this creates bllets and shoots at tanks
   void shoot(int k)
   {
      //create a bullet every 25 frames
      if(frame==20)
      {
        float arm;
        
        if(armSwitch)
        {
          arm=pos.x-(objectW/2);
          armSwitch=false;
        }
        else
        {
          arm=pos.x+(objectW/2);
          armSwitch=true;
        }
        Bullet Bullet = new Bullet(arm,pos.y+objectW);
        blArray.add(Bullet);
        frame=0;
      }
      
      frame++;
        
        //go through every bullet in the array
       for(int i=0;i<blArray.size();i++)
       {
           //will set the bullet to be red when friendly is false
           boolean friendly=false;
           blArray.get(i).render(friendly);
           
           //move pos.y +2
           blArray.get(i).pos.y+=2;
  
           if(blArray.get(i).pos.y>height/2-objectW)
           {
              //object takes damage
              objArray.get(k).takeDamage();
              blArray.remove(i); 
           }
       
       }
    }
   
}