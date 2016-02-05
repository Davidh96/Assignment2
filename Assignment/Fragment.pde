class Fragment
{
   PVector pos;
   PVector move;
   int frame=0;
   
   Fragment()
   {
      move=new PVector(random(-1,1),random(-1,1));
   }
   
   //displays fragments
   void render()
   {
      fill(255);
      stroke(255);
      rect(pos.x,pos.y,5,5);
      move();
   }
   
   //moves fragments
   void move()
   {
      pos.add(move);
      destroy();
   }
   
   //removes the fragments
   void destroy()
   {
      frame++;
      if(pos.x<0 || pos.x>width)
      {
         fragments.remove(this); 
      }
      if(frame>60*5)
      {
        fragments.remove(this);
      }
   }
}