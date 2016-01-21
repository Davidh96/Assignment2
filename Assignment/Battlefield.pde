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
      
      for(int i=0;i<100;i++)
      {
        //ellipse(random(0,width-objectW),random(0,height),starSize,starSize);
      }
   }
   
   //draws the battleLine/enemies line of sight
   void battleLine()
   {
      stroke(255);
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
           ind++;
           Tank plTank =new Tank();
           tkArray.add(plTank);
           
           objectChosen=true;
      }
        
   }
   
   //This method will create the towers
   void createTower()
   {
      //if the towers have not been created yet
     if(twCreated==false)
     {
       if(twArray.size()<10)
       {
         for(int i=0;i<10;i++)
         {
            Tower tower = new Tower();
            twArray.add(tower);
          }
          twCreated=true;
       }
     }
     
     //renders all the towers that need to be rendered
     for(int i=0;i<twArray.size();i++)
     {
        twArray.get(i).render(i); 
     }
   }
   
}