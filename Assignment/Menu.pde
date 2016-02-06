class Menu
{
  int frame=0;
   Menu()
   {
       
   }
   
   void display()
   {
       
       fill(255);
       stroke(0);
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
       text("EXIT",width/2,(height/2)+(objectW/2)*5);
      
   }
   
   void level()
   {
       fill(255);
       stroke(0);
       textAlign(CENTER,CENTER);
       textSize(50);
       text("STAR CONFRONTATION",width/2,150);
       textSize(25);
       text("CHOOSE DIFFICULTY",width/2,200);
       
       for(int i=0;i<3;i++)
       {
          rect(objectW,(height/2)+(objectW)*i,width-(objectW*2),objectW);
       }
       
       fill(0);
       text("EASY",width/2,(height/2)+(objectW/2));
       text("NORMAL",width/2,(height/2)+(objectW/2)+objectW);
       text("HARD",width/2,(height/2)+(objectW/2)*5);
     
       
   }
   
   void mouseReleased()
   {
     if(frame>30){
      if(mouseX>objectW && mouseX<width-objectW)
      {
        if(mouseY>height/2 && mouseY<height/2+(objectW)*3)
        {
           if(mouseY>height/2 && mouseY<height/2+objectW)
           {
              if(mousePressed)
              {
                 level=new Difficulty(1);
              }
              
           }
           if(mouseY>height/2+objectW && mouseY<height/2+(objectW*2))
           {
              if(mousePressed)
              {
                 level=new Difficulty(2);
              }
           }
            if(mouseY>height/2+(objectW*2) && mouseY<height/2+(objectW*3))
           {
              if(mousePressed)
              {
                 level=new Difficulty(3);
              }
           }
        }
      }
     }
     frame++;
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