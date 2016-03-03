class Mech extends Tower
{
  //will be used to fire bullets from both arms of the mech
  boolean armSwitch=true;
  float armW=objectW*.20;
  int fire1;
  int fire2;
  
   Mech(int i)
   {
      pos=new PVector(i*objectW,0);
      lane=round((map(pos.x,0,width,0,11)));
      
      getAttributes("Mech,");

   }
   //draws the tower object
   void render()
   {
       
       fill(255,0,0);
       stroke(0);
       ellipse(pos.x+objectW/2,pos.y+objectW/2+10,objectW,objectW);
       
       //gun turret
       fill(255,100,100);
       rect(pos.x+objectW*.15,pos.y+objectW*.35,objectW*.15,objectW-fire1);
       rect(pos.x+objectW*.85,pos.y+objectW*.35,-objectW*.15,objectW-fire2);
       
       
       displayHealth();
        
      //will give impression of arm moving back
      if(fire1!=0)
      {
       fire1--; 
      }
      if(fire2!=0)
      {
       fire2--; 
      }
       
      detect();
   }
   
   //this creates bullets and shoots at tanks
   void shoot()
   {
      //create a bullet every 25 frames
      if(frame==readframe)
      {
        float arm;
        bulletFired();
        
        //this will switch between arms to fire bullets
        if(armSwitch)
        {
          arm=pos.x-(objectW*.15)-objectW*.15;
          armSwitch=false; 
          fire1=fire;
        }
        else
        {
          arm=pos.x+(objectW*.15)+objectW*.15;
          armSwitch=true;
          fire2=fire;
        }
        
        
        Bullet Bullet = new Bullet(arm,pos.y+objectW);
        blArray.add(Bullet);
        
        
        frame=0;
      }
      
      frame++;
      
      doDamage();
    }
   
}