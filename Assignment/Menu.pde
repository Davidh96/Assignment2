class Menu
{
  int frame=0;
   
   //displays the welcoming menu
   void display()
   {
       
       fill(255);
       stroke(0);
       textAlign(CENTER,CENTER);
       textSize(50);
       text("STAR CONFRONTATION",width/2,150);
       textSize(25);
       text("DAVID HUNT'S",width/2,100);
       
       for(int i=0;i<3;i++)
       {
          rect(objectW,(height/2)+(objectW)*i,width-(objectW*2),objectW);
       }
       
       fill(0);
       text("PLAY",width/2,(height/2)+(objectW/2));
       text("TUTORIAL",width/2,(height/2)+(objectW/2)+objectW);
       text("EXIT",width/2,(height/2)+(objectW/2)*5);
      
   }
   
      //controls how to respond to users on the welcoming menu
   void interact()
   {
      if(mouseX>objectW && mouseX<width-objectW)
      {
        if(mouseY>height/2 && mouseY<height/2+(objectW)*3)
        {
           if(mouseY>height/2 && mouseY<height/2+objectW)
           {
             //if play pressed
              if(mousePressed)
              {
                 menuChoice=1;
              }
           }
           if(mouseY>height/2+objectW && mouseY<height/2+(objectW*2))
           {
             //if tutorial pressed
              if(mousePressed)
              {
                 menuChoice=2;
              }
           }
            if(mouseY>height/2+(objectW*2) && mouseY<height/2+(objectW*3))
           {
             //if exit is pressed
              if(mousePressed)
              {
                 menuChoice=3;
              }
           }
        }
      }
   }
   
   //will display the menu to allow a user to choose a difficulty
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
   
   //controls how to respond to users on the difficulty level menu
   void levelinteract()
   {
     //this is to prevent the user accidently clicking easy
     if(frame>30)
     {
        if(mouseX>objectW && mouseX<width-objectW)
        {
          if(mouseY>height/2 && mouseY<height/2+(objectW)*3)
          {
             if(mouseY>height/2 && mouseY<height/2+objectW)
             {
               //if easy pressed
                if(mousePressed)
                {
                   level=new Difficulty(1);
                }
                
             }
             if(mouseY>height/2+objectW && mouseY<height/2+(objectW*2))
             {
               //if normal pressed
                if(mousePressed)
                {
                   level=new Difficulty(2);
                }
             }
              if(mouseY>height/2+(objectW*2) && mouseY<height/2+(objectW*3))
             {
                if(mousePressed)
                {
                  //if hard pressed
                   level=new Difficulty(3);
                }
             }
          }
        }
     }
     frame++;
   }
   
}