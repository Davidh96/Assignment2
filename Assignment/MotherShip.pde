//This is the basic tower type
class MotherShip extends Tower
{
  int fire=0;
   MotherShip(int i)
   {
      pos=new PVector(i*objectW,0);
      lane=(int)map(pos.x,0,width,0,11);
      
      getAttributes("Mothership,");

   }
   
   //draws the tower object
   void render()
   {
      stroke(0);
      fill(255,100,100);
      rect(pos.x+(objectW/2)+20,pos.y+objectW+10,-10,objectW/6+fire);
      rect(pos.x+(objectW/2)-20,pos.y+objectW+10,10,objectW/6+fire);
      
      fill(255,0,0);
      rect(pos.x,pos.y+10,objectW,objectW);
      
      fill(255,100,100);
      rect(pos.x+(objectW/2)+10,pos.y+objectW/2+10,-20,-objectW/2-fire);
      rect(pos.x+(objectW/2)+10,pos.y+objectW,-20,objectW/2-fire);
      
     //healthbar
     fill(0,255,0);
     rect(pos.x,pos.y,map(health,0,maxhealth,0,objectW),10);
       
      detect();
      endGame=true;
       
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