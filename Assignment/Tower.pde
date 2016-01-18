class Tower extends GameObject
{
   PVector pos;
   int health=1;
   boolean init=true;
   
   Tower()
   {
   
   }
   
   //draws the tower object
   void render(int i)
   {
       fill(255,0,0);
       stroke(0);
       
       if(init==true)
       {
       TWxPos.add(i*objectW);
       init=false;
       }
       pos=new PVector(TWxPos.get(i),0);
       
       
       rect(pos.x,pos.y,objectW,objectW);
       
       fill(255,100,100);
       stroke(255,100,100);
       rect(pos.x+10,pos.y+10,objectW-20,objectW-20);
       stroke(0);
       fill(255,0,0);
       ellipse(pos.x+(objectW/2),pos.y+(objectW/2),30,30);
       fill(255,100,100);
       rect(pos.x+20,pos.y+20,objectW-40,objectW-10);
       
   }
   
   void takeDamage(int i)
   {
     
      health--;
      
      twNum--;
      
      TWxPos.remove(i);
      twArray.remove(i); 
        
      
   }
}