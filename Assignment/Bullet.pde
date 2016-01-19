class Bullet extends GameObject
{
   PVector pos;
   float move=2;
  
   Bullet(float x,float y)
   {
     pos = new PVector(x+(objectW/2),y);
   }
   
   //this method creates my bullet
   void render(boolean friendly)
   {     
     if(friendly)
     {
      fill(0,0,255);
      stroke(0,0,255);
     }
     if(!friendly)
     {
       fill(255,0,0);
      stroke(255,0,0);
     }
      rect(pos.x,pos.y,5,10);
      
   }
   
   //This method removes bullets from an array  
   void destroy()
   {
      //blArray.remove(this); 
   }
}