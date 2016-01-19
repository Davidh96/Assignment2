class Tank extends GameObject
{
    
   PVector pos;
   boolean picked=false;
   boolean placedinSlot=false;
   int init=0;
   int frame=0;
   ArrayList<Bullet> blArray = new ArrayList<Bullet>();

   Tank()
   {
     render(width-objectW,0+objectW);
   }
   
   Tank(float x, float y)
   {
      render(x,y);
   }
   
   //draws the tank object
   void render(float x, float y)
   {
     init=1;
     stroke(0);
     
     pos=new PVector(x,y);
     
    int roundPos=(int)pos.x/(int)objectW;
    pos.x=roundPos*objectW;
      
     fill(0,255,0);
     rect(pos.x,pos.y-objectW,objectW,objectW);

     fill(150,255,150);
     ellipse(pos.x+(objectW/2),pos.y-(objectW/2),objectW,objectW);
     
    
    fill(0,255,0);
    rect(pos.x+(objectW/4),pos.y-(objectW/2),objectW/2,-objectW);
     
     //if this tank is NOT the objectMenu one
     if(init>0)
     {
       
         if(pos.y<(float)(width/2)+objectW)
         {
           //after 1 secnd create a bullet
           if(frame>60)
           {
             Bullet bullet = new Bullet(pos.x,pos.y-objectW);
             blArray.add(bullet);
             //reset timer
             frame=0;
           }
          
          //render all bullets in the blArray
          for(int i=0;i<blArray.size();i++)
          {
            boolean friendly=true;
            blArray.get(i).render(friendly);
          } 
          //a frame has passed
          frame++;
           
         }

     }
     shoot();
          
   } 
   
   void shoot()
   {
     for(int i=0;i<blArray.size();i++)
     {
       blArray.get(i).pos.y-=2;
     
       if(blArray.get(i).pos.y<objectW)
       {
         //this method will reve the bullet from the blArray
          blArray.remove(i);
          //this will tell the tower that it took damage and to decrease its health
          twArray.get((int)(map(blArray.get(i).pos.x,0,width,0,11))).takeDamage();
       }
     }
      
   }
   
   
}