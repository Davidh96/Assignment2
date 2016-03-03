class Menu
{
  int frame=0;
  int move;
  int boxes=3;
  color hover[] ={255,255,255};
  String title="STAR\nCOMMANDER";
   
   //displays the welcoming menu
   void display()
   {
       
       fill(255);
       stroke(0);
       textAlign(CENTER,CENTER);
       textSize(width*.15);
       text(title,width/2,150);
       
       
       for(int i=0;i<boxes;i++)
       {
          fill(hover[i]);
          rect(objectW,(height/2)+(objectW)*i,width-(objectW*2),objectW);
       }
       
       fill(0);
       textSize(25);
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
              highlight(0);
             //if play pressed
              if(mousePressed)
              {
                 menuChoice=1;
              }
           }
           if(mouseY>height/2+objectW && mouseY<height/2+(objectW*2))
           {
              highlight(1);
             //if tutorial pressed
              if(mousePressed)
              {
                 menuChoice=2;
              }
           }
           if(mouseY>height/2+(objectW*2) && mouseY<height/2+(objectW*3))
           {
             highlight(2);
             //if exit is pressed
              if(mousePressed)
              {
                 menuChoice=3;
              }
           }
        }
      }
   }
   
   //highlights the menuitem currently being hovered over
   void highlight(int box)
   {
      for(int i=0;i<boxes;i++)
      {
         hover[i]=color(255); 
      }
      hover[box]=color(180,180,180);
   }
   
   //will display the menu to allow a user to choose a difficulty
   void level()
   {
       fill(255);
       stroke(0);
       textAlign(CENTER,CENTER);
       textSize(width*.15);
       text(title,width/2,150+move);
       textSize(50);
       fill(0);
       text("CHOOSE DIFFICULTY",width/2,(height/2)-objectW);
       menuSelect=true;
       
       if(menuSelect)
       {
          move+=3; 
       }
       
       fill(255);
       for(int i=0;i<3;i++)
       {
          fill(hover[i]);
          rect(objectW,(height/2)+(objectW)*i,width-(objectW*2),objectW);
       }
       
       fill(0);
       textSize(25);
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
                highlight(0);
               //if easy pressed
                if(mousePressed)
                {
                   
                   level=new Difficulty(1);
                   menuSelect=false;
                }
                
             }
             if(mouseY>height/2+objectW && mouseY<height/2+(objectW*2))
             {
                highlight(1);
               //if normal pressed
                if(mousePressed)
                {
                   
                   level=new Difficulty(2);
                   menuSelect=false;
                }
             }
              if(mouseY>height/2+(objectW*2) && mouseY<height/2+(objectW*3))
             {
                highlight(2);
                if(mousePressed)
                {
                   
                  //if hard pressed
                   level=new Difficulty(3);
                   menuSelect=false;
                }
             }
          }
        }
     }
     frame++;
   }
   
}