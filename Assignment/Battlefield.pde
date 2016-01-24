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
      
      for(int i=0;i<laneCaptured.length;i++)
      {
        //if a lane has been captured
        if(laneCaptured[i]==true)
            {
               fill(255,0,0,100);
               stroke(255,0,0);
               rect(i*objectW,height,objectW,-height);
            }
      }
   }
   
   //draws the battleLine/enemies line of sight
   void battleLine()
   {
      stroke(255);
      objectW=(float)width/lanes;
      line(0,height/2,width-objectW,height/2);
   }
   
   //this method displays where an object can be placed
   void showSlots()
   {
       if(objectChosen==true)
       {
          for(int i=0;i<laneCheck.length;i++)
          {
            stroke(255,255,255);
            if(laneCheck[i])
            {
              fill(255,0,0,100);
            }
            else
            {
             fill(0,0,255,100);
            }
           
           float x=i*objectW;
           float y=height-objectW;
           
           rect(x,y,objectW,objectW); 
          }
          if(mouseY>height-objectW && mouseX<width-objectW)
          {
             int lane=(int)map(mouseX,0,width,0,11);
             lane=(int)(lane*objectW);
             fill(255,255,255,100);
             rect(lane,height,objectW,-height);
             
          }
       }
     
   }
   
   //this method created an object
   void createObj()
   {

      if(objArray.size()<objNum)
      {
        if(objAllowed)
        {
           obmenu.objChosen();
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
            Turret tower = new Turret(i);
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