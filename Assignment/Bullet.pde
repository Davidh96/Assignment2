class Bullet extends GameObject
{
   PVector pos;
   float move=2;
  
   Bullet(float x,float y)
   {
     pos = new PVector(x+(objectW/2),y-(objectW*2));
   }
   
   //this method creates my bullet
   void render()
   {     
      fill(0,0,255);
      stroke(0,0,255);
      rect(pos.x,pos.y,5,10);
   }
}