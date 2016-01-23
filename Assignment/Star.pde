class Star
{
   PVector pos;
   float speed;
   
   Star()
   {
     //give the star a random position on the battlefield
     pos=new PVector(random(0,width-objectW-10),random(objectW,height));
     //random speeds
     speed=random(2,4);
   }
   
   void move()
   {
     fill(255);
     stroke(255);
     
     rect(pos.x,pos.y,10,5);
     
     //change x position by -speed, looks like stars flying by
     pos.x-=speed;
      
     if(pos.x<0)
     {
        //reset stars to side of screen
        pos.x=width-objectW-10;
        //give the stars a new y position
        pos.y=random(0,height);
     }

   }
}