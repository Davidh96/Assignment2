abstract class GameObject
{
  float objectW;
  PVector pos;
  int health;
  int maxhealth;
  ArrayList<Bullet> blArray = new ArrayList<Bullet>();
  int lane;
  boolean placedinSlot=false;
  int frame=0;
  
  GameObject()
  {
     objectW=((float)600)/lanes;
  }
  
  //This method deals with the placement of a tank
   void placeObj()
   {
 
     if(mouseY>height-objectW && mouseX<width-objectW)
     {
        if(mousePressed)
        {
          //This is an if statement to stop the player from moving the tank once it has been plaed
          if(placedinSlot==false)
          {
           //give the tank its position
           pos=new PVector(mouseX,height);
           
           //checks if the lane already has an object in it
           if(laneCheck[(int)pos.x/(int)objectW]==false)
           {
              //the user has chosen to place the object in  a slot
             placedinSlot=true;
             objAllowed=true;
             objectChosen=false;
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
       laneCheck[lane]=false;
       objArray.remove(this);
     } 
     
   }
   
  
  abstract void render();
  abstract void shoot();
  abstract void move();
}