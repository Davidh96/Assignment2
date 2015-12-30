//Tower Attack Game
//David Hunt

void setup()
{
  size(600,650);
  xPos=0;
}

Tank tank;
Tower tower;
ObjectMenu obmenu=new ObjectMenu();
Battlefield bkground=new Battlefield();

float xPos;

ArrayList<Tank> tkArray = new ArrayList<Tank>();

void draw()
{
   //create the star background first. This will ensure that it does not overlap any other objects
   bkground.generate();
   bkground.battleLine();
   bkground.placeObj();
  
   //reate the object menu which will be used by the player t choose items
   obmenu.render();
   
   //create the initial tank. This initial tank is part of the object menu.
   tank =new Tank();
   
   //create the initial towers.
   tower =new Tower();
   
  tower=new Tower(); 
  
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
             tkArray.get(i).placed=true;
           }
        }
      }
      
      if(tkArray.get(i).placed==true)
      {
        
        if(mousePressed)
        {
           xPos=mouseX;
        }
        (tkArray.get(i)).render(xPos,height);
      }
    }
  }
  
  
}