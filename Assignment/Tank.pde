class Tank extends GameObject
{
    
   PVector pos;
   boolean picked=false;
   boolean placedinSlot=false;
   
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
     
     stroke(0);
     
     pos=new PVector(x,y);
     
    int roundPos=(int)pos.x/(int)objectW;
    pos.x=roundPos*objectW;
      
     fill(0,255,0);
     rect(pos.x,pos.y-objectW,objectW,objectW);

     fill(150,255,150);
     
     ellipse(pos.x+(objectW/2),pos.y-(objectW/2)+5,objectW,objectW);
     
    
    fill(0,255,0);
     rect(pos.x+(objectW/4),pos.y-(objectW/2),objectW/2,-objectW);
     
          
   } 
   
   
   
}