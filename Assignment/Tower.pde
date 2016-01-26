abstract class Tower 
{
  int frame=0;
  PVector pos;
  int health;
  ArrayList<Bullet> blArray = new ArrayList<Bullet>();
  int lane;
  int maxhealth;
  int time=0;
  
  abstract void render();
  abstract void shoot(int k);

  
  //this method will try and capture a lane
  void capture()
  {
      if(prArray.size()<5)
      {
        Probe probe=new Probe(pos.x,pos.y);
        probe.rand2=(int)random(0,10);
        prArray.add(probe);
      }

      for(int i=0;i<prArray.size();i++)
      {
          //if the random numbers held in rand1 and rand2 are the same the a probe will be rendered
          if(prArray.get(i).rand1==prArray.get(i).rand2)
          {
              prArray.get(i).render();
          }
          //if rand1 and rand2 are not the same 
          else
          {
             //wait 120 frames
             if(time==120)
             {
             //before removing the probe from the array list and trying to get the same random numbers again
             prArray.remove(i);
             time=0;
             }
             time++;
          }
        }

  }
  
     void takeDamage()
   {
     //decrease health by 1
     health--;

     
     //if health is below 1 then the tower has been destroyed
     if(health<1)
     {
       laneCleared[lane]=true;
       twArray.remove(this);
       
     } 
   }
  
}