class Tower extends GameObject
{
   Tower()
   {

   }
   
   //draws the tower object
   void render(float x, float y)
   {
       fill(0);
       stroke(255,0,0);
       rect(x,y,objectW,objectW);
   }
}