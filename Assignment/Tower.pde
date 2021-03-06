abstract class Tower 
{
  int frame=0;
  PVector pos;
  int health;
  ArrayList<Bullet> blArray = new ArrayList<Bullet>();
  int lane;
  int maxhealth;
  int time=0;
  int readframe=0;
  int fire=15;
  
  abstract void render();
  abstract void shoot();
  
  //will take in a text file and break it down to give towers appropriate attributes
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
  
  void bulletFired()
  {
      //set this to play every time a bullet fires
      bulletSound2.play();
      bulletSound2.rewind(); 
  }

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
             if(time==60)
             {
             //before removing the probe from the array list and trying to get the same random numbers again
             prArray.remove(i);
             time=0;
             }
             time++;
          }
        }

  }
  
    void displayHealth()
    {
        //healthbar
       fill(0,255,0);
       stroke(4,75,11);
       rect(pos.x,pos.y,map(health,0,maxhealth,0,objectW),objectW*.2); 
    }
  
     void takeDamage()
   {
     //decrease health by 1
     health--;

     
     //if health is below 1 then the tower has been destroyed
     if(health<1)
     {

       if(this instanceof Turret)
       {
         createMech[lane]=true;
         twCreated[lane]=false;
         twArray.remove(this);
         explode();
         credit.applyTo();
       }
       if(this instanceof Mech)
       {
         createMedusa[lane]=true;
         twCreated[lane]=false;
         twArray.remove(this);
         explode();
         credit.applyTo();
       }
       
       
       upgradeObj();
       
       
    
     } 
   }
   
   void upgradeObj()
   {
      for(int i=0;i<objArray.size();i++)
      {
        //if the object has been placed, prevents program from crashing
        if(objArray.get(i).placedinSlot==true)
        {
          //if an object is in the same lane
         if(objArray.get(i).lane==lane)
         {

             //this is to ensure that the towers will only shoot at tanks and ifos
             if(objArray.get(i) instanceof Ship || objArray.get(i) instanceof IFO)
             {
                objArray.get(i).maxhealth+=10;
                objArray.get(i).readframe-=5;
                objArray.get(i).upgraded=true;
             }
           
         }
        }
      }
       
   }
   

   //controls explosion effect for towers
   void explode()
   {
      for(int i=0;i<50;i++)
      {
         Fragment frag=new Fragment();
         frag.pos=new PVector(pos.x+objectW/2,pos.y+objectW/2);
         fragments.add(frag);
         TWfragments.add(frag);
         
      }
      explosionSound.play();
      explosionSound.rewind();
      
   }
   
   //This method is used to detect wheth an object should be fired at
   void detect()
   {
      for(int i=0;i<objArray.size();i++)
      {
        //if the object has been placed, prevents program from crashing
        if(objArray.get(i).placedinSlot==true)
        {
          //if an object is in the same lane
         if(objArray.get(i).lane==lane)
         {
           //if the object is past the bLineY
           if(objArray.get(i).pos.y<=bLineY)
           {
             //this is to ensure that the towers will only shoot at tanks and ifos
             if(objArray.get(i) instanceof Ship || objArray.get(i) instanceof IFO)
             {
                shoot(); 
             }
           }
           else
           {
              for(int j=0;j<blArray.size();j++)
              {
                 blArray.remove(j);
              }
              fire=10;
           }
         }
        }
      }
   }
   
   //controls the damage done to objs
   void doDamage()
   {
       //go through every bullet in the array
       for(int i=0;i<blArray.size();i++)
       {
           //will set the bullet to be red when friendly is false
           boolean friendly=false;
           blArray.get(i).render(friendly);
           
           //move pos.y +2
           blArray.get(i).pos.y+=2;
           
           for(int j=0;j<objArray.size();j++)
           {
             if(objArray.get(j) instanceof Ship || objArray.get(j) instanceof IFO)
             {
               if(lane==objArray.get(j).lane && objArray.get(j).placedinSlot)
               {
                 if(blArray.get(i).pos.y>objArray.get(j).pos.y-objectW)
                 {
                   
                    if(this instanceof Medusa)
                    {
                       objArray.get(j).health=0;
                    }
                    //object takes damage
                    objArray.get(j).takeDamage();
                    blArray.remove(i); 
                    

                 }
               }
             }
           }
       
       } 
   }
  
}