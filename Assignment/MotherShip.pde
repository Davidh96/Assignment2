//This is the basic tower type
class MotherShip extends Tower
{
   
   MotherShip(int i)
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
      stroke(0);
      rect(pos.x,pos.y+10,objectW,objectW);
       
       
       //healthbar
       fill(0,255,0);
       rect(pos.x,pos.y,map(health,0,maxhealth,0,objectW),10);
       
       detect();
       
   }
   
   
   //this creates bllets and shoots at tanks
   void shoot()
   {
      //create a bullet every 25 frames
      if(frame==25)
      {
        Bullet Bullet = new Bullet(pos.x,pos.y+objectW);
        blArray.add(Bullet);
        frame=0;
      }
      
      frame++;
        
       doDamage();
    }
} 