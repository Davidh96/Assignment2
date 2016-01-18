//Tower Attack Game
//David Hunt

void setup()
{
  size(600,650);
  objectW=width/11;
  
  for(int i=0;i<OyPos.length;i++)
  {
     OyPos[i]=height;
  }
}

Tank tank;
Tower tower;
ObjectMenu obmenu=new ObjectMenu();
Battlefield bkground=new Battlefield();

//this array keeps track of object positions
float OxPos[]=new float[10];
float OyPos[]=new float[10];
int ind=0;
boolean objectChosen=false;
float objectW;
int twNum=10;

//An array list for my tanks
ArrayList<Tank> tkArray = new ArrayList<Tank>();
ArrayList<Bullet> blArray = new ArrayList<Bullet>();
ArrayList<Tower> twArray = new ArrayList<Tower>();
ArrayList<Float> TWxPos = new ArrayList<Float>();


void draw()
{
   //create the star background first. This will ensure that it does not overlap any other objects
   bkground.generate();
  
   //reate the object menu which will be used by the player t choose items
   obmenu.render();
   
   bkground.createTower();
   
   //create the initial tank. This initial tank is part of the object menu.
   tank =new Tank();
  
  //displays the potential places where an object can be placed
  bkground.showSlots();
  
  bkground.placeObj();
  
  bkground.battleLine();
  
  //This will move the bullets once they are fired
  for(int i=0;i<blArray.size();i++)
  {
     blArray.get(i).pos.y-=2;
     //if the bullet has reached an enemy target
     if(blArray.get(i).pos.y<objectW)
     {
       //this method will reve the bullet from the blArray
        blArray.get(i).destroy();
        //this will tell the tower that it took damage and to decrease its health
        twArray.get((int)(map(blArray.get(i).pos.x,0,width,0,11))).takeDamage();
     }
  }

}
void mouseReleased()
{
       //This will ensure that only +1 object is created
       bkground.createObj();   
}