//Tower Attack Game
//David Hunt

void setup()
{
  size(600,650);
  objectW=width/11;
  strokeWeight(3);
}

Tank tank;
Tower tower;
ObjectMenu obmenu=new ObjectMenu();
Battlefield bkground=new Battlefield();

int ind=0;
boolean objectChosen=false;
float objectW;
int twNum=10;

//An array list for my tanks
ArrayList<Tank> tkArray = new ArrayList<Tank>();
//An array list for my towers
ArrayList<Tower> twArray = new ArrayList<Tower>();
ArrayList<Float> TWxPos = new ArrayList<Float>();


void draw()
{
   //create the star background first. This will ensure that it does not overlap any other objects
   bkground.generate();
  
   //reate the object menu which will be used by the player t choose items
   obmenu.render();
   
   //create the towers on screen
   bkground.createTower();
  
  //displays the potential places where an object can be placed
  bkground.showSlots();
  
  //places object on screen
  for(int i=0;i<tkArray.size();i++)
  {
    tkArray.get(i).placeObj();
  }
  
  //displays the battleline
  bkground.battleLine();

}

void mouseReleased()
{
       //This will ensure that only +1 object is created
       bkground.createObj();   
}