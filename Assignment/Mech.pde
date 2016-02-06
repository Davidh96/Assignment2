class Mech extends Tower
{
  //will be used to fire bullets from both arms of the mech
  boolean armSwitch=true;
  float armW=10;
  int readframe;
  
   Mech(int i)
   {
     int readhealth=0;
      pos=new PVector(i*objectW,0);
      lane=(int)map(pos.x,0,width,0,11);
      
      for(String s:difficulty)
      {
         int j=s.indexOf("Mech,");
         if(j!=-1)
         {
           readhealth=(int)parseFloat(s.substring(j+"Mech,".length(),s.lastIndexOf(",")));
           readframe=(int)parseFloat(s.substring(s.lastIndexOf(",")+1));
         }
      }
      maxhealth=readhealth;
      health=maxhealth;
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
       rect(pos.x,pos.y+10,armW,objectW);
       rect(pos.x+objectW,pos.y,-armW,objectW+armW);
       
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
        }
        else
        {
          arm=pos.x+((objectW/2)-(armW/2));
          armSwitch=true;
        }
        Bullet Bullet = new Bullet(arm,pos.y+objectW);
        blArray.add(Bullet);
        frame=0;
      }
      
      frame++;
      
      doDamage();
    }
   
}