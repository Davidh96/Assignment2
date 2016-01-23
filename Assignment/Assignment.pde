//Tower Attack Game
//David Hunt

void setup()
{
  size(600,650);
  objectW=width/lanes;
  
  for(int i=0;i<stars;i++)
  {
     Star star = new Star();
     stArray.add(star);
  }
}

boolean objectChosen=false;
boolean objAllowed=true;
float objectW;
int objNum=10;
int lanes=11;
int stars=100;

boolean laneCheck[] = new boolean[objNum];

ObjectMenu obmenu=new ObjectMenu();
Battlefield bkground=new Battlefield();

//An array list for the stars in the background
ArrayList<Star> stArray = new ArrayList<Star>();
//An array list for my tanks
ArrayList<GameObject> objArray = new ArrayList<GameObject>();
//An array list for my towers
ArrayList<Tower> twArray = new ArrayList<Tower>();

void draw()
{
   strokeWeight(2);
   
   //create the star background first. This will ensure that it does not overlap any other objects
   bkground.generate();
  
   //reate the object menu which will be used by the player t choose items
   obmenu.render();
   
   for(int i=0;i<stArray.size();i++)
   {
       stArray.get(i).move();
   }
   
   //create the towers on screen
   bkground.createTower();
  
  //displays the potential places where an object can be placed
  bkground.showSlots();
  
  //places object on screen
  for(int i=0;i<objArray.size();i++)
  {
    objArray.get(i).placeObj();
  }
  
  //displays the battleline
  bkground.battleLine();
  
  //display objects to select from
  obmenu.objMenu();

}

void mouseReleased()
{
       if(mouseX>width-objectW)
      {
       //This will ensure that only +1 object is created
       bkground.createObj(); 
      }
}