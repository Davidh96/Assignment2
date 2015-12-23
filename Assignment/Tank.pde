class Tank extends GameObject
{
   Tank()
   {
     
   }
   
   void render(float x, float y,float w)
   {
     rect(x,y-w,w,w);
     ellipse(x+(w/2),height-(w/2),w,w);
     rect(x+(w/4),height-(w/2),w/2,-w);
     
   }
}