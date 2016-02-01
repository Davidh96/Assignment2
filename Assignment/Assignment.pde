//Tower Attack Game
//David Hunt

void setup()
{
  size(600,650);
  objectW=width/(float)lanes;
  bLineY=height/2;
  
  for(int i=0;i<stars;i++)
  {
     Star star = new Star();
     stArray.add(star);
  }
  
   //create 10  initial towers -turrets
   for(int i=0;i<objNum;i++)
   {
      Turret turret = new Turret(i);
      twArray.add(turret);
      //all towers are created
      twCreated[i]=true;
   }
}

boolean objectChosen=false;
boolean objAllowed=true;
float objectW;
int objNum=10;
int lanes=11;
int stars=100;
float bLineY;
int menuChoice=0;
                                                                                                                                                                                                                                                                                  
boolean laneUsed[] = new boolean[objNum];
boolean twCreated[]=new boolean [objNum];
boolean createMech[]=new boolean [objNum];
boolean createMedusa[]=new boolean [objNum];
boolean medusaCreated[]=new boolean [objNum];

boolean laneCaptured[] = new boolean[objNum];
boolean laneCleared[]=new boolean[objNum];

ObjectMenu obmenu=new ObjectMenu();
Battlefield bkground=new Battlefield();
Credit credit = new Credit();
Menu menu = new Menu();

//An array list for the stars in the background
ArrayList<Star> stArray = new ArrayList<Star>();
//An array list for my tanks
ArrayList<GameObject> objArray = new ArrayList<GameObject>();
//An array list for my towers
ArrayList<Tower> twArray = new ArrayList<Tower>();
//An array list for my capture probes
ArrayList<Probe> prArray=new ArrayList<Probe>();
//An array list for my health powerups
ArrayList<HealthPowerUp> hlArray=new ArrayList<HealthPowerUp>();

void draw()
{
    strokeWeight(2);
    background(0);
    
    if(menuChoice==0)
    {
       menuControl();
    }
   
   if(menuChoice==1)
   {
       textSize(12);
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
     
     if(twArray.size()>0)
     {
      //call the capture function from a random tower
      twArray.get((int)random(0,twArray.size())).capture();
     }
      
      //displays the battleline
      bkground.battleLine();
      
      //display objects to select from
      obmenu.objMenu();
      
      //cals the method that will control the creation of powerups
      bkground.createPowerUp();
      
      //renders all health powerups
      for(int i=0;i<hlArray.size();i++)
      {
         hlArray.get(i).render(); 
      }
      
      //displays the amount of credits a user has
      credit.display();
   }

}
void menuControl()
{
   menu.display();
   menu.interact();
}


void mouseReleased()
{
  if(menuChoice==1)
  {
      if(mouseX>width-objectW)
      {
       //This will ensure that only +1 object is created
       bkground.createObj(); 
      }
  }
}