class Medusa extends Tower
{
  int num;
  float theta = 0.0f;
  float speed = 0.02f;
  
   Medusa(int i,int num)
   {
      pos=new PVector(i*objectW,0);
      lane=round((map(pos.x,0,width,0,11)));
      
      getAttributes("Medusa,");
      //num will be used to differentiate between the two towers of a medusa
      this.num=num;
      
   }
   
   //draws the tower object
   void render()
   {
      theta += speed;
      
      if (theta > TWO_PI)
      {
        theta = 0;
      }

       fill(255,0,0);
       stroke(0);
       ellipse(pos.x+objectW/2,pos.y+objectW/2+10,objectW,objectW);
       //will make medusa look like it has mving parts
       pushMatrix();
         stroke(0);
         translate(pos.x+objectW/2,pos.y+objectW/2+10);
         rotate(theta);
         line(0,-objectW/2,0,0);
         line(0,objectW/2,0,0);
         line(objectW/2,0,0,0);
         line(-objectW/2,0,0,0);
       popMatrix();
       fill(255,100,100);
       stroke(255,100,100);
       ellipse(pos.x+objectW/2,pos.y+objectW/2+10,objectW/2,objectW/2);
       if(num==2)
       {
          rect(pos.x+objectW/2,pos.y+objectW/2,-objectW,objectW/4);
       }

       displayHealth();
       
       twCreated[lane]=true;
       
       detect();
       destroy();  
   }
   
   //this creates bllets and shoots at tanks
   void shoot()
   {
      //create a bullet
      if(frame==readframe)
      {
        bulletFired();
        Bullet Bullet = new Bullet(pos.x,pos.y+objectW);
        blArray.add(Bullet);
        frame=0;
      }
      
      frame++;
        
      doDamage();
    }
    
    //this method controls the destruction of medusa
    void destroy()
    {
       
       if(health<1)
       {

         //set the healh to 0 so that the health doesnt go into minus values
         health=0;
         int check1=0;
         int check2=0;
         
          for(int i=0;i<twArray.size();i++)
          {
            if(num==2)
            {
              //find the index of the medusa half in the next lane
               if(lane==twArray.get(i).lane+1)
               {
                 check1++;
               
                   if(twArray.get(i).health<1 )
                    {   
                        twCreated[lane]=false;
                        twCreated[lane-1]=false;
                        laneCleared[lane]=true; 
                        laneCleared[lane-1]=true; 
                        explode();
                        credit.applyTo();
                        //the two halfs are destroyed
                        twArray.remove(this);
                        twArray.remove(i);
                    }
               }
               //for when one half is destroyed by that lane being captured
               if(i==twArray.size()-1 && check1==0)
               {
                  twArray.remove(this);
                  laneCleared[lane]=true;
                  explode();
                  credit.applyTo();
               }
            }
            if(num==1)
            {
                 //find the index of the medusa half in the next lane
               if(lane==twArray.get(i).lane-1)
               {
                 check2++;
               }
               //for when one half is destroyed by that lane being captured
               if(i==twArray.size()-1 && check2==0)
               {
                  laneCleared[lane]=true;
                  explode();
                  credit.applyTo();
                  twArray.remove(this);
               }
            }
          }
        }
     }
}
  