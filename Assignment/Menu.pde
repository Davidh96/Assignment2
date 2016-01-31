class Menu
{
   Menu()
   {
       
   }
   
   void display()
   {
       fill(255);
       textAlign(CENTER,CENTER);
       textSize(50);
       text("STAR CONFRONTATION",width/2,150);
       textSize(25);
       text("BY DAVID HUNT",width/2,200);
       
       for(int i=0;i<3;i++)
       {
          rect(objectW,(height/2)+(objectW)*i,width-(objectW*2),objectW);
       }
       
       fill(0);
       text("PLAY",width/2,(height/2)+(objectW/2));
       text("TUTORIAL",width/2,(height/2)+(objectW/2)+objectW);
       text("CREDIT",width/2,(height/2)+(objectW/2)*5);
   }
   
   void interact()
   {
      if(mouseX>objectW && mouseX<width-objectW)
      {
        if(mouseY>height/2 && mouseY<height/2+(objectW)*3)
        {
           if(mouseY>height/2 && mouseY<height/2+objectW)
           {
              if(mousePressed)
              {
                 menuChoice=1;
              }
           }
           if(mouseY>height/2+objectW && mouseY<height/2+(objectW*2))
           {
              if(mousePressed)
              {
                 menuChoice=2;
              }
           }
            if(mouseY>height/2+(objectW*2) && mouseY<height/2+(objectW*3))
           {
              if(mousePressed)
              {
                 menuChoice=3;
              }
           }
        }
      }
   }
}