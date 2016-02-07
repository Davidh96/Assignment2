abstract class AttackObj extends GameObject
{
  
  int readframe;
  int fire;
  ArrayList<Bullet> blArray = new ArrayList<Bullet>();
  
   void getAttributes(String find)
  {
        for(String s:difficulty)
      {
         int j=s.indexOf(find);
         if(j!=-1)
         {
           maxhealth=(int)parseFloat(s.substring(j+find.length(),s.lastIndexOf(",")));
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

      if(frame==readframe)
      {
        Bullet Bullet = new Bullet(pos.x,pos.y-objectW);
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
   
    void doDamage()
   {
         for(int i=0;i<blArray.size();i++)
         {
             boolean friendly=true;
             blArray.get(i).render(friendly);
             blArray.get(i).pos.y-=2;
          
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