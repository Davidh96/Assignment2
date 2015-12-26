//Tower Attack Game
//David Hunt
void setup()
{
  size(600,650);
  
}

Tank tank =new Tank();
Tower tower=new Tower();
ObjectMenu obmenu=new ObjectMenu();

void draw()
{
   
   tank.render(width/2,height); 
   tower.render(width/2,0);
   obmenu.render();
   
   line(0,height/2,width,height/2);
   
}