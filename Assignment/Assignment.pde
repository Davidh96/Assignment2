//Tower Attack Game
//David Hunt
void setup()
{
  size(600,650);
  objectW=width/10;
}

Tank tank =new Tank();
Tower tower=new Tower();

float objectW;

void draw()
{
   tank.render(width/2,height,objectW); 
   tower.render(width/2,0,objectW);
   line(0,height/2,width,height/2);
   
}