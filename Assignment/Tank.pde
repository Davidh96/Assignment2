class Tank extends GameObject
{
   Tank()
   {
     render(width-objectW,0+objectW);
   }
   
   //draws the tank object
   void render(float x, float y)
   {
     fill(0,255,0);
     stroke(0);
     
     rect(x,y-objectW*.8,objectW,objectW);
     ellipse(x+(objectW/2),y-(objectW/2),objectW,objectW);
     rect(x+(objectW/4),y-(objectW/2),objectW/2,-objectW*.75);
     
   }
}