abstract class AttackObj extends GameObject
{
  
  int readframe;
  int fire;
  ArrayList<Bullet> blArray = new ArrayList<Bullet>();
  
  //gets the attributes of objs and towers depending on the difficulty
   void getAttributes(String find)
  {
        for(String s:difficulty)
      {
         int j=s.indexOf(find);
         if(j!=-1)
         {
           //get the health of the obj
           maxhealth=(int)parseFloat(s.substring(j+find.length(),s.lastIndexOf(",")));
           //get the frame count, used to determine how often bullets are fired
           readframe=(int)parseFloat(s.substring(s.lastIndexOf(",")+1));
         }
      }
      health=maxhealth;
  } 
  
    //This method is used to detect whether a tower should be fired at
   void detect()
   {
      for(int i=0;i<twArray.size();i++)
      {
         if(twArray.get(i).lane==lane)
         {
            shoot(); 
         } 
      } 
   }
   
      
   //This method shoots bullets from the bj
   void shoot()
   {
      //create a bullet at readframe
      if(frame==readframe)
      {
        Bullet Bullet = new Bullet(pos.x,pos.y-objectW);
        blArray.add(Bullet);
        //will extend the turret of the ship
        fire=10;
        frame=0;
      }
      //will reduce the turret length
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
   
   //controls the damage done to a tower
   void doDamage()
   {
         for(int i=0;i<blArray.size();i++)
         {
             boolean friendly=true;
             blArray.get(i).render(friendly);
             blArray.get(i).pos.y-=2;
            
            //fires all bullets created
            for(int j=0;j<twArray.size();j++)
            {
              if(lane==twArray.get(j).lane)
              {
               if(blArray.get(i).pos.y<objectW)
               {
                  //object takes damage
                  twArray.get(j).takeDamage();
                  blArray.remove(i); 
               }
              }
            }
         } 
   }
  

}