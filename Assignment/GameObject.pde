abstract class GameObject
{
  PVector pos;
  int lane;
  boolean placedinSlot=false;
  int frame=0;
  int cost;
  int health;
  int maxhealth;
  int readframe;
  boolean upgraded=false;
  
  
  abstract void render();
  abstract void move();
  
  //This method deals with the placement of an obj
   void placeObj()
   {
     if(mouseY>height-objectW && mouseX<width-objectW)
     {
        if(mousePressed)
        {
          //This is an if statement to stop the player from moving the tank once it has been plaed
          if(placedinSlot==false)
          {   

           //checks if the lane already has an object in it
           if(laneUsed[(int)(mouseX/objectW)]==false)
           {
              //this will place the tank in a slot rather than the actual position chosen by the user
             lane=(int)(mouseX/objectW);
             //give the tank its position
             pos=new PVector(lane*objectW,height);
             //the user has chosen to place the object in  a slot
             placedinSlot=true;
             objAllowed=true;
             objectChosen=false;
             laneUsed[(int)(mouseX/objectW)]=true;
             credit.amount-=cost;
             selected=false;
           }

          }
        }
     }
    
    //call the move method so that the tank gets into position
    move();

   }
   
   //deals with what happens after an obj has been destroyed
   void destroy()
   {
     laneUsed[lane]=false;
     objArray.remove(this);
   }
   
   //will display fragments on the screen to give an explosion effect
   void explode()
   {
      int fragCount=50;
      
      for(int i=0;i<fragCount;i++)
      {
         Fragment frag=new Fragment();
         frag.pos=new PVector(pos.x+objectW/2,pos.y);
         fragments.add(frag);
      }
      explosionSound.play();
      explosionSound.rewind();
   }
  
   
    //This method deals with damage taken
   void takeDamage()
   {
     //decrease health by 1
     health--;
     
     //if health is below 1 then the tower has been destroyed
     if(health<1)
     { 
       destroy();
       explode();
     } 
     
   }
   
   int time=0;
   float shrink=0;
   void displayUpgrade()
   {  
      if(upgraded)
      {
         textSize(8+shrink);
         fill(0,255,0);
         text("Health Upgraded!",pos.x+(objectW/2),pos.y-(objectW));
         text("Rate Of Fire Upgraded!",pos.x+(objectW/2),pos.y-(objectW/2));
         if(time==(60*2))
         {
            time=0;
            shrink=0;
            upgraded=false; 
         }
         time++;
         shrink+=.1;
      }
   }
}