//Tower Attack Game
//David Hunt

void setup()
{
  size(600,650);
}

Tank tank;
Tower tower;
ObjectMenu obmenu=new ObjectMenu();
Battlefield bkground=new Battlefield();

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
      if(tkArray.get(0).placed==true)
      {
        (tkArray.get(0)).render(250,250);
      }
  }
}