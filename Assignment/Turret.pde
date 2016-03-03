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
      stroke(0);
      fill(255,100,100);
      rect(pos.x+(objectW/2)+20,pos.y+objectW,-10,objectW/4+fire);
      rect(pos.x+(objectW/2)-20,pos.y+objectW,10,objectW/4+fire);
      
      fill(255,0,0);
      rect(pos.x,pos.y+10,objectW,objectW);
      
      fill(255,100,100);
      rect(pos.x+(objectW/2)+10,pos.y+objectW+20,-20,-objectW/2-fire);
      
       displayHealth();
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
        bulletFired();
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