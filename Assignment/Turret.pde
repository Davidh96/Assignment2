//This is the basic tower type
class Turret extends Tower
{
 
   Turret(int i)
   {
      pos=new PVector(i*objectW,0);
      lane=round((map(pos.x,0,width,0,11)));
      getAttributes("Turret,");
   }
   
   //draws the tower object
   void render()
   {
     
       fill(255,0,0);
       stroke(0);
       ellipse(pos.x+objectW/2,pos.y+objectW/2+10,objectW,objectW);
       
       //gun turret
       fill(255,100,100);
       rect(pos.x+objectW*.15,pos.y+objectW*.35,objectW*.15,objectW-fire);
       rect(pos.x+objectW*.85,pos.y+objectW*.35,-objectW*.15,objectW-fire);
       
       
       //healthbar
       fill(0,255,0);
       rect(pos.x,pos.y,map(health,0,maxhealth,0,objectW),objectW*.2);
       
       detect();
   }
   
   
   //this creates bllets and shoots at tanks
   void shoot()
   {
      if(frame==readframe)
      {
        Bullet Bullet = new Bullet(pos.x,pos.y+objectW);
        blArray.add(Bullet);
        fire=10;
        frame=0;
      }
      else
      {
        if(fire!=0)
        {
         fire--; 
        }
      }
      
      frame++;
        
      doDamage();
    }

}