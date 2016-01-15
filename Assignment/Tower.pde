class Tower extends GameObject
{
   Tower()
   {
      //creates line of towers
      for(int i=0;i<10;i++)
      {
         render(i*objectW,0); 
      }
   }
   
   //draws the tower object
   void render(float x, float y)
   {
       fill(255,0,0);
       stroke(0);
       
       rect(x,y,objectW,objectW);
   }
}