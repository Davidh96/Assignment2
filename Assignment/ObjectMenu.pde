class ObjectMenu extends GameObject
{
   ObjectMenu()
   {
      
   }
   
   //draws a menu to the side that will allow users to pick items
   void render()
   {
      fill(50,50,50,200);
      stroke(255);
      rect(width-objectW,0,objectW,height); 
   }
}