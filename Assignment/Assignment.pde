//Tower Attack Game
//David Hunt

void setup()
{
  size(600,650);
  objectW=width/(float)lanes;
  bLineY=height/2;
  level=new Difficulty();
  
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
boolean endGame=false;
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
ObjDescriptions desc;
Difficulty level;

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
//An array list for my fragments
ArrayList<Fragment> fragments=new ArrayList<Fragment>();
//Is used to decide the attributes of objs and towers depending on the difficulty level chosen
ArrayList<String> difficulty=new ArrayList<String>();

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
       //menu.level();
       textSize(12);
       //create the star background first. This will ensure that it does not overlap any other objects
       bkground.generate();
      
       //reate the object menu which will be used by the player t choose items
       obmenu.render();
       
       //renders fragments created from the destruction of objs and towers
       for(int i=0;i<fragments.size();i++)
       {
          fragments.get(i).render(); 
       }
       
       //moves stars across the screen
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
      
      //will allow a user to delete an obj once they have been played
      Bin bin=new Bin();
      bin.detect();
      
      //checks if the user has reached the end of the game
      endGame();  
      
      //obj Descriptions
      desc= new ObjDescriptions();
  
    }
    
    if(menuChoice==2)
    {
       Tutorial tut=new Tutorial();
       tut.display();
    }
    
    if(menuChoice==3)
    {
       exit(); 
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

void endGame()
{
  int win=0;
  int lose=0;
  
   if(endGame)
   {
     if(twArray.size()<objNum)
     {
        stroke(random(0,255),random(0,255),random(0,255));
        rect((width-objectW)/2-objectW,height/2+(height/4),objectW*2,objectW);
        textSize(15);
        fill(0);
        text("END GAME?",(width-objectW)/2,height/2+(height/4)+objectW/2);
        if(mouseX>(width-objectW)/2-objectW && mouseX<(width-objectW)/2+objectW)
        {
          if(mouseY>height/2+(height/4) && mouseY<height/2+(height/4)+objectW)
          {
             if(mousePressed)
             {
                menuChoice=0; 
             }
          }
        }
        
       for(int i=0;i<objNum;i++)
       {
          if(laneCleared[i])
          {
             win++;
          }
          if(laneCaptured[i])
          {
             lose++; 
          }
       }
       
       textAlign(CENTER,CENTER);
       textSize(50);
       fill(255);
       
       if(win>lose)
       {
          text("YOU WIN!",(width-objectW)/2,150);
       }
       if(win<lose)
       {
          text("YOU LOSE!",(width-objectW)/2,150);
       }
     }
     
     
   }
}