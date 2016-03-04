class Fragment
{
   PVector pos;
   PVector move;
   int frame=0;
   
   Fragment()
   {
     //gives fragments a random direction
      move=new PVector(random(-5,5),random(-5,5));
   }
   
   //displays fragments
   void render()
   {
      fill(255);
      stroke(255);
      rect(pos.x,pos.y,2,2);
      move();
   }
   
   void displayCredit()
   {
      fill(255);
      stroke(255);
      text("+1",pos.x+objectW/2,pos.y+objectW/2);
      moveCredits();
   }
   
   //moves fragments
   void move()
   {
      pos.add(move);
      destroy();
   }
   
    //moves fragments
   void moveCredits()
   {
      pos.add(move);
      destroyCredits();
   }
   
   //removes the fragments
   void destroy()
   {
      frame++;
      if(pos.x<0 || pos.x>width)
      {
         fragments.remove(this); 
      }
      if(frame>60)
      {
        fragments.remove(this);
      }
   }
   
   void destroyCredits()
   {
      frame++;
      if(pos.x<0 || pos.x>width)
      {
         TWfragments.remove(this); 
      }
      if(frame>60)
      {
        TWfragments.remove(this);
      }
   }
}