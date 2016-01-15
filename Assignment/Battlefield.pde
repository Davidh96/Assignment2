class Battlefield
{
   float starSize;
   boolean showPotPlacement=false;
   
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
      line(0,height/2,width,height/2);
   }
   
   void pickObj()
   {
      float objectW=width/11;
      
      if(mouseX>width-objectW)
      {
        Tank plTank =new Tank();
         tkArray.add(plTank);
         tkArray.get(ind).pick=true; 
         ind++;
         
         showPotPlacement=true;
      }
      
      if(showPotPlacement==true)
      {
         objChosen(); 

      }
   }
   
   void objChosen()
   {
      for(int i=0;i<10;i++)
      {
       fill(0);
       stroke(0,0,255);
       
       float objectW= width/11;
       
       float x=i*objectW;
       float y=height-objectW;
       
       rect(x,y,objectW,objectW); 
      }
   }
   
   void placeObj()
   {
       if(tkArray.size()>0)
  {
    for(int i=0;i<tkArray.size();i++)
    {
      if(tkArray.get(i).pick==true)
      {
        if(mouseY>height-(width/11))
        {
           if(mousePressed)
           {
             tkArray.get(i).place=true;
           }
        }
      }
      
      if(tkArray.get(i).place==true)
      {
        if(tkArray.get(i).placed==false)
        {
          if(mousePressed)
          {
             xPos=mouseX;
             tkArray.get(i).placed=true;
             showPotPlacement=false;
          }
        }
          (tkArray.get(i)).render(xPos,height);
      }
    }
  }
   }
}