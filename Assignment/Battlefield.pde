class Battlefield
{
   float starSize;
   
   Battlefield()
   {
      starSize=2;
   }
   
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
   
   void battleLine()
   {
      stroke(255,0,0);
      line(0,height/2,width,height/2);
   }
}