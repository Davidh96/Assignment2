//allows the user to destroy objs
class Bin
{
  
   //will check if a user has clicked on an obj
   void detect()
   {
      if(mousePressed)
      {
        for(int i=0;i<objArray.size();i++)
        {
           PVector mouse = new PVector(mouseX,mouseY);
           
           if(objArray.get(i).placedinSlot)
           {
             if(objArray.get(i).pos.dist(mouse)<objectW)
             {
               if(objArray.get(i).pos.y<=height/2)
               {
                  objArray.remove(i);
                  credit.amount+=25;
               }
             }
           }
        }
      } 
    }
   
}