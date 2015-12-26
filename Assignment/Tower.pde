class Tower extends GameObject
{
   Tower()
   {
     
   }
   
   void render(float x, float y)
   {
       fill(0);
       rect(x,y,objectW,objectW);
   }
}