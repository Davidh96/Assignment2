class Mech extends Tower
{
  //will be used to fire bullets from both arms of the mech
  boolean armSwitch=true;
  
   Mech(int i)
   {
      pos=new PVector(i*objectW,0);
      lane=(int)map(pos.x,0,width,0,11);
      maxhealth=10;
      health=maxhealth;
   }
   //draws the tower object
   void render()
   {
       stroke(0);
       
       fill(255,100,100);
       rect(pos.x,pos.y+10,objectW,objectW/2);
       
       fill(255,0,0);
       //arms
       rect(pos.x,pos.y+10,10,objectW);
       rect(pos.x+objectW,pos.y,-10,objectW+10);
       
       ellipse(pos.x+objectW/2,pos.y+objectW/2,objectW/3,objectW/3);
       
       //healthbar
       fill(0,255,0);
       rect(pos.x,pos.y,map(health,0,maxhealth,0,objectW),10);
       
       detect();
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