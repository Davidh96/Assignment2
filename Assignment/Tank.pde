class Tank extends GameObject
{
   Tank()
   {
     
   }
   
   void render(float x, float y)
   {
     fill(0,255,0);
     stroke(0);
     rect(x,y-objectW,objectW,objectW);
     ellipse(x+(objectW/2),height-(objectW/2),objectW,objectW);
     rect(x+(objectW/4),height-(objectW/2),objectW/2,-objectW);
     
   }
}