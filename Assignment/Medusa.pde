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
       //will make medusa look like its 
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

       //healthbar
       fill(0,255,0);
       stroke(0);
       rect(pos.x,pos.y,map(health,0,maxhealth,0,objectW),objectW*.2);
       
       detect();
       destroy();  
   }
   
   //this creates bllets and shoots at tanks
   void shoot()
   {
      //create a bullet
      if(frame==readframe)
      {
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
          for(int i=0;i<twArray.size();i++)
          {
            if(num==2)
            {
              //find the index of the medusa half in the next lane
               if(lane==twArray.get(i).lane+1)
               {
                    if(twArray.get(i).health<1)
                    {   
                        twCreated[lane]=false;
                        twCreated[lane-1]=false;
                        //the two halfs are destroyed
                        twArray.remove(this);
                        twArray.remove(i);
                    }
               }
            }

          }
       }
    }
}