//Tower Attack Game
//David Hunt

void setup()
{
  size(600,650);
  objectW=width/11;
  
  for(int i=0;i<yPos.length;i++)
  {
     yPos[i]=height;
  }
}

Tank tank;
Tower tower;
ObjectMenu obmenu=new ObjectMenu();
Battlefield bkground=new Battlefield();

//this array keeps track of object positions
float xPos[]=new float[10];
float yPos[]=new float[10];
int ind=0;
boolean objectChosen=false;
float objectW;

//An array list for my tanks
ArrayList<Tank> tkArray = new ArrayList<Tank>();
ArrayList<Bullet> blArray = new ArrayList<Bullet>();
ArrayList<Tower> twArray = new ArrayList<Tower>();

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
     }
  }

}

void mouseReleased()
{
       //This will ensure that only +1 object is created
       bkground.createObj();   
}