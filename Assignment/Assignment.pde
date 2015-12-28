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

void draw()
{
   //create the star background first. This will ensure that it does not overlap any other objects
   bkground.generate();
   bkground.battleLine();
   
   //create the object menu which will be used by the player t choose items
   obmenu.render();
   
   //create the initial tank. This initial tank is part of the object menu.
   tank =new Tank();
   
   //create the initial towers.
   tower =new Tower();
   
  tower=new Tower(); 
}