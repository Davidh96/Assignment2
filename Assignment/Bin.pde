//allows the user to destroy objs
class Bin
{
   PVector pos;
   int check;
   
   //will check if a user has clicked on an obj
   void detect()
   {
      check=0;
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
                 for(int j=0;j<twArray.size();j++)
                 {
                   //will only allow deletion of objects where there is no towers in its lane;
                    if(twArray.get(j).lane==objArray.get(i).lane)
                    {
                       check=1; 
                    }
                 }
                 if(check==0)
                 {
                  deleteObj=false;
                  objArray.remove(i);
                  credit.applyTo();
                 }
               }
             }
           }
        }
      } 
    }
    
    //renders a bin on screen
    void render()
    {
       stroke(0);
       fill(255,255,255,200);
       rect(pos.x,pos.y,objectW,-(objectW/1.5));
       fill(0);
       text("Bin",pos.x+objectW/2,pos.y-boxW/2);
    }
   
}