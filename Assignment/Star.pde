class Star
{
   PVector pos;
   float speed;
   float starW=2;
   float starH=1;
   
   Star()
   {
     //give the star a random position on the battlefield
     pos=new PVector(random(0,width),random(0,height));
     //random speeds
     speed=random(3,5);
   }
   
   //controls movement of stars accross screen
   void move()
   {
     fill(255);
     stroke(255);
     
     //rect(pos.x,pos.y,starW,starH);
     ellipse(pos.x,pos.y,starW,starH);
     
     //change x position by -speed, looks like stars flying by
     pos.y+=speed;
      
     if(pos.y+starW>height)
     {
        //reset stars to side of screen
        pos.y=0;
        //give the stars a new y position
        pos.x=random(0,width);
     }

   }
  
}