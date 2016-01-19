class Tower extends GameObject
{
   PVector pos;
   int health=10;
   ArrayList<Bullet> blArray = new ArrayList<Bullet>();
   boolean init=true;
   boolean destroyed=false; 
   int frame=0;
   
   Tower()
   {
   
   }
   
   //draws the tower object
   void render(int i)
   {
     if(destroyed==false)
     {
       fill(255,0,0);
       stroke(0);
       
       //this code stops the creation of more towers than needed
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
       
   }
   
   void shoot()
   {
    if(frame==20)
    {
      Bullet Bullet = new Bullet(pos.x,pos.y+objectW);
      blArray.add(Bullet);
      println(blArray.size());
      frame=0;
    }
      frame++;
      for(int i=0;i<blArray.size();i++)
     {
         boolean friendly=false;
         blArray.get(i).render(friendly);
         blArray.get(i).pos.y+=2;
     }
   }
   void takeDamage()
   {
     //decrease health by 1
     health--;
     
     //if health is below 1 then the tower has been destroyed
     if(health<1)
     {
       destroyed=true; 
     }  
      
   }
}