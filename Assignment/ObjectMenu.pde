class ObjectMenu extends GameObject
{
   ObjectMenu()
   {
     
   }
   
   void render()
   {
      fill(50);
      stroke(50);
      rect(width-objectW,0,objectW,height); 
   }
}