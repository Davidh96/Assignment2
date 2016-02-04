//allows the user to destroy objs
class Bin
{
   PVector pos;
  
   Bin()
   {
     
   }
   
   void render()
   {
      rect(pos.x,pos.y,objectW,-(objectW/1.5)); 
   }
   
   //will check if a user has clicked on an obj
   void detect()
   {
      if(mousePressed)
      {
        for(int i=0;i<objArray.size();i++)
        {
           PVector mouse = new PVector(mouseX,mouseY);
           
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