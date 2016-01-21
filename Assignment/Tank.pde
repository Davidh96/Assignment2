class Tank extends GameObject
{
    
   PVector pos;
   boolean picked=false;
   boolean placedinSlot=false;
   int health=10;
   boolean destroyed=false;
   int init=1;
   int frame=0;
   ArrayList<Bullet> blArray = new ArrayList<Bullet>();

   Tank()
   {
    
   }
   
   Tank(float x, float y)
   {
      render(x,y);
   }
   
   //draws the tank object
   void render(float x, float y)
   {
     if(destroyed==false)
     {
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

     //if the tower infront has not been destroyed  
     if(twArray.get((int)map(pos.x,0,width,0,11)).destroyed==false)
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
  
            shoot();
         }
         
       }
     }
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
   
   void takeDamage()
   {
     //decrease health by 1
     health--;
     
     //if health is below 1 then the tower has been destroyed
     if(health<1)
     {
       destroyed=true; 
     } 
     
   }
   
   
}