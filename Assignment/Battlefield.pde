class Battlefield
{
   float starSize;
   float objectW;
   boolean twCreated=false;

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
   }
   
   //draws the battleLine/enemies line of sight
   void battleLine()
   {
      stroke(255);
      objectW=width/lanes;
      line(0,height/2,width-objectW,height/2);
   }
   
   //this method displays where an object can be placed
   void showSlots()
   {
       if(objectChosen==true)
       {
          for(int i=0;i<laneCheck.length;i++)
          {
            if(laneCheck[i])
            {
              fill(255,0,0,100);
              stroke(255,0,0);
            }
            else
            {
             fill(0,0,255,100);
             stroke(0,0,255);
            }
           
           float x=(float)i*objectW;
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
        if(tkArray.size()<objNum)
        {
          if(tankAllowed)
          {
           Tank tank =new Tank();
           tkArray.add(tank);
           objectChosen=true;
           tankAllowed=false;
          }
        }
      }
        
   }
   
   //This method will create the towers
   void createTower()
   {
      //if the towers have not been created yet
     if(twCreated==false)
     {
         //create 10 towers
         for(int i=0;i<objNum;i++)
         {
            Tower tower = new Tower(i);
            twArray.add(tower);
          }
          
          //all towers are created
          twCreated=true;
     }
     
     //renders all the towers that need to be rendered
     for(int i=0;i<twArray.size();i++)
     {
        twArray.get(i).render(); 
     }
   }
   
}