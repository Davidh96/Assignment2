class Tank extends GameObject
{
    
   PVector pos;
   boolean placed=false;
   
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
     fill(0,255,0);
     stroke(0);
     
     pos=new PVector(x,y);
     
     rect(pos.x,pos.y-objectW*.8,objectW,objectW);
     ellipse(pos.x+(objectW/2),pos.y-(objectW/2),objectW,objectW);
     rect(pos.x+(objectW/4),pos.y-(objectW/2),objectW/2,-objectW*.75);
          
   }
}