abstract class GameObject
{
  PVector pos;
  int lane;
  boolean placedinSlot=false;
  int frame=0;
  int health;
  int maxhealth;
  ArrayList<Bullet> blArray = new ArrayList<Bullet>();
  int cost;
  
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
           }

          }
        }
     }
    
    //call the move method so that the tank gets into position
    move();

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
     } 
     
   }
   
   void destroy()
   {
     laneUsed[lane]=false;
     objArray.remove(this);
   }
  
}