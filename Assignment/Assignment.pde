//Tower Attack Game
//David Hunt
void setup()
{
  size(600,650);
}

Tank tank =new Tank();
Tower tower=new Tower();
ObjectMenu obmenu=new ObjectMenu();
Battlefield bkground=new Battlefield();

void draw()
{
   
   bkground.generate();
   bkground.battleLine();
   tank.render(width/2,height); 
   tower.render(width/2,0);
   obmenu.render();
   

   
}