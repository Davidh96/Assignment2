class IFO extends AttackObj
{

  float theta = 0.0f;
  float speed = 0.02f;
    
    IFO()
    {       
      getAttributes("IFO,");
      cost=200;
    }
  
   //draws the tank object
   void render()
   {
    theta += speed;
    if (theta > TWO_PI)
    {
      theta = 0;
    }

     stroke(0);
     fill(0,0,255);
     //inner circle
     ellipse(pos.x+(objectW/2),pos.y-(objectW/2),objectW,objectW);
     //will give the illusion of the IFO spinning
     pushMatrix();
     strokeWeight(1);
       translate(pos.x+objectW/2,pos.y-objectW/2);
       rotate(theta);
       line(0,-objectW/2,0,0);
       line(0,objectW/2,0,0);
       line(objectW/2,0,0,0);
       line(-objectW/2,0,0,0);
     popMatrix();
     strokeWeight(2);
     fill(150,150,255);
     //outer circle
     ellipse(pos.x+(objectW/2),pos.y-(objectW/2),objectW/2,objectW/2);
     
     
     //this is to ensure that the check lane is for objs placed and not for the object in the objMenu
     if(placedinSlot)
     {
       //healthbar
       fill(0,255,0);
       rect(pos.x,pos.y,map(health,0,maxhealth,0,objectW),objectW*.2);
     } 
     
   } 
   
   
   //this method controls the IFO movements
   void move()
   {
     int move=3;
     
     //if the tank has been placed, it will move to the battleline
     if(placedinSlot==true)
     {
       render(); 
       if(pos.y>(height/2))
       {
         pos.y-=move;
       }
       if(pos.y<=height/2)
       {
        detect(); 
       }    
     }
   }
  
}