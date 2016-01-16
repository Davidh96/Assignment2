class Battlefield
{
   float starSize;
   float objectW;

   Battlefield()
   {
      starSize=2;
   }
   
   //this method creates the moving background
   void generate()
   {
      background(0);
      fill(255);
      stroke(255);
      
      for(int i=0;i<10;i++)
      {
        ellipse(random(0,width),random(0,height),starSize,starSize);
      }
   }
   
   //draws the battleLine/enemies line of sight
   void battleLine()
   {
      stroke(0,255,0);
      objectW=width/11;
      line(0,height/2,width-objectW,height/2);
   }
   
   //this method displays where an object can be placed
   void showSlots()
   {
 
       if(objectChosen==true)
       {
          for(int i=0;i<10;i++)
          {
           fill(0,0,255,100);
           stroke(0,0,255);
           
           float x=i*objectW;
           float y=height-objectW;
           
           rect(x,y,objectW,objectW); 
           
          }
       }
     
   }
   
   //this method created an object
   void createObj()
   {
     if(mouseX>width-objectW)
      {
           ind++;
           Tank plTank =new Tank();
           tkArray.add(plTank);
           
           objectChosen=true;
      }
        
   }
   
   //this method places the object on the battlefield
   void placeObj()
   {
 
     if(mouseY>height-objectW)
     {
        if(mousePressed)
        {
          //This is an if statement to stop the player from moving the tank once it has been plaed
          if(tkArray.get(ind-1).placedinSlot==false)
          {
           xPos[ind-1]=mouseX; 
           //the user has chosen to place the object in  a slot
           tkArray.get(ind-1).placedinSlot=true;
           objectChosen=false;
           
          }
        }
        
     }
        
     for(int i=0;i<ind;i++)
     {       
           //If the array has any objects
           if(tkArray.size()>0)
           {
             if(tkArray.get(i).placedinSlot==true)
             {
               tkArray.get(i).render(xPos[i],height); 
             }
               
           }
     }
   }
}