class Bullet 
{
   PVector pos;
   float move=2;
   float bulletW=5;
   float bulletH=10;
  
   Bullet(float x,float y)
   {
     //pos of bullet is the in the middle of the pos of the obj creating it
     pos = new PVector(x+(objectW/2)-(bulletW/2),y);
   }
   
   //this method creates my bullet
   void render(boolean friendly)
   { 
     //if a friendly bullet, the bullet is blue
     if(friendly)
     {
      fill(0,0,255);
      stroke(0,0,255);
     }
     //if not a friendly bullet, the bullet is red
     if(!friendly)
     {
       fill(255,0,0);
      stroke(255,0,0);
     }
     
     //the bullet
     rect(pos.x,pos.y,bulletW,bulletH);

   }
  
}