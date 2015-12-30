class Battlefield
{
   float starSize;
   
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
      stroke(255,0,0);
      line(0,height/2,width,height/2);
   }
   
   void placeObj()
   {
      float objectW=width/11;
      
      if(mouseX>width-objectW)
      {
        Tank plTank =new Tank();
         tkArray.add(plTank);
         tkArray.get(0).placed=true; 
      }
         
      
   }
}