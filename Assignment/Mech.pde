class Mech extends Tower
{
  //will be used to fire bullets from both arms of the mech
  boolean armSwitch=true;
  float armW=10;
  int fire1;
  int fire2;
  
   Mech(int i)
   {
      pos=new PVector(i*objectW,0);
      lane=(int)map(pos.x,0,width,0,11);
      
      getAttributes("Mech,");

   }
   //draws the tower object
   void render()
   {
       stroke(0);
       
       fill(255,100,100);
       rect(pos.x,pos.y+10,objectW,objectW/2);
       
       fill(255,0,0);
       //arms
       rect(pos.x,pos.y+10,armW,objectW+fire1);
       rect(pos.x+objectW,pos.y,-armW,objectW+armW+fire2);
       
       ellipse(pos.x+objectW/2,pos.y+objectW/2,objectW/3,objectW/3);
       
       //healthbar
       fill(0,255,0);
       rect(pos.x,pos.y,map(health,0,maxhealth,0,objectW),armW);
       
       detect();
   }
   
   //this creates bllets and shoots at tanks
   void shoot()
   {
      //create a bullet every 25 frames
      if(frame==readframe)
      {
        float arm;
        
        if(armSwitch)
        {
          arm=pos.x-((objectW/2)-(armW/2));
          armSwitch=false;
          fire1=20;
        }
        else
        {
          arm=pos.x+((objectW/2)-(armW/2));
          armSwitch=true;
          fire2=20;
        }
        Bullet Bullet = new Bullet(arm,pos.y+objectW);
        blArray.add(Bullet);
        
        
        frame=0;
      }
      else
      {
        if(fire1!=0)
        {
         fire1--; 
        }
        if(fire2!=0)
        {
         fire2--; 
        }
      }
      
      frame++;
      
      doDamage();
    }
   
}