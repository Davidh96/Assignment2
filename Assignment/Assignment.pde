//Tower Attack Game
//David Hunt

void setup()
{
  size(600,650);
  objectW=width/lanes;
  
}

boolean objectChosen=false;
boolean tankAllowed=true;
float objectW;
int objNum=10;
int lanes=11;

boolean laneCheck[] = new boolean[objNum];

ObjectMenu obmenu=new ObjectMenu();
Battlefield bkground=new Battlefield();


//An array list for my tanks
ArrayList<Tank> tkArray = new ArrayList<Tank>();
//An array list for my towers
ArrayList<Tower> twArray = new ArrayList<Tower>();

void draw()
{
   strokeWeight(2);
   
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
  
  //display objects to select from
  obmenu.objMenu();

}

void mouseReleased()
{
       //This will ensure that only +1 object is created
       bkground.createObj(); 
}