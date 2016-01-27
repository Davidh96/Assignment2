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
       
       detect();

       
   }
   
   
   //this creates bllets and shoots at tanks
   void shoot(int k)
   {
      //create a bullet every 25 frames
      if(frame==25)
      {
        Bullet Bullet = new Bullet(pos.x,pos.y+objectW);
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