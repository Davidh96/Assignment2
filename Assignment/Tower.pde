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
       
       fill(255,100,100);
       stroke(255,100,100);
       rect(x+10,y+10,objectW-20,objectW-20);
       stroke(0);
       fill(255,0,0);
       ellipse(x+(objectW/2),y+(objectW/2),30,30);
       fill(255,100,100);
       rect(x+20,y+20,objectW-40,objectW-10);
       
   }
}