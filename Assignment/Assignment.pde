//Tower Attack Game
//David Hunt

void setup()
{
  size(600,650);
  
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

//An array list for my tanks
ArrayList<Tank> tkArray = new ArrayList<Tank>();

void draw()
{
   //create the star background first. This will ensure that it does not overlap any other objects
   bkground.generate();
   bkground.battleLine();

  
   //reate the object menu which will be used by the player t choose items
   obmenu.render();
   
   //create the initial tank. This initial tank is part of the object menu.
   tank =new Tank();
   
   //create the initial towers.
   tower =new Tower();
   
  tower=new Tower(); 
  
  //displays the potential places where an object can be placed
  bkground.showSlots();
  
  bkground.placeObj();
  
}

void mouseReleased()
{
       //This will ensure that only +1 object is created
       bkground.createObj();   
}