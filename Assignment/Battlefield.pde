class Battlefield
{
   float brightness[] = new float[720];
   float starX[]=new float[brightness.length];
   float starY[]=new float[brightness.length];
   
   //this method creates the moving background
   void generate()
   {
      fill(255);
      stroke(255);
      
      for(int i=0;i<objNum;i++)
      {
        //if a lane has been captured
        if(laneCaptured[i])
        {
           fill(255,0,0,100);
           stroke(255,0,0);
           rect(i*objectW,height,objectW,-height);
           laneUsed[i]=true;
           bLineY=height/2;
           
           //remove tower in captured lane
           for(int j=0;j<twArray.size();j++)
           {
             if(twArray.get(j).lane==i)
             {
                 twArray.remove(j);
             }
           }
        }
        
        //if the player has cleared the lane
        if(laneCleared[i])
        {
           fill(0,0,255,100);
           stroke(0,0,255);
           rect(i*objectW,height,objectW,-height);
           laneUsed[i]=true;
        }
        
        if(laneCleared[i] || laneCaptured[i])
        {
           //remove obj in captured/cleared lane
           for(int j=0;j<objArray.size();j++)
           {
             if(objArray.get(j).lane==i && objArray.get(j).placedinSlot)
             {
                 objArray.remove(j);
             }
           } 
        }
      
      }
   }
   
   //draws the battleLine/enemies line of sight
   void battleLine()
   {
      stroke(255);
      objectW=(float)width/lanes;
      line(0,bLineY,width-objectW,bLineY);
   }
   
   //this method displays where an object can be placed
   void showSlots()
   {
       if(objectChosen==true)
       {
         //this displays what lanes the user can place objects in
          for(int i=0;i<laneUsed.length;i++)
          {
            stroke(255,255,255);
            //if the lane is in use
            if(laneUsed[i])
            {
              fill(255,0,0,100);
            }
            //if the lane is not in use
            else
            {
             fill(0,0,255,100);
            }
            
           //the slot boxes
           float x=i*objectW;
           float y=height-objectW;
           rect(x,y,objectW,objectW); 
           
          }
          
          //displays a box around the lane the user is looking at, makes its easier to see where the obj is headed
          if(mouseY>height-objectW && mouseX<width-objectW)
          {
             int lane=(int)map(mouseX,0,width,0,11);
             lane=(int)(lane*objectW);
             fill(255,255,255,100);
             rect(lane,height,objectW,-height);
             
          }
       }
     
   }
   
   //this method created an object
   void createObj()
   {
      if(objArray.size()<objNum)
      {
        //if the user chooses another obj
        if(objAllowed==false && objArray.size()>0)
        {
           objArray.remove(objArray.size()-1);
           objAllowed=true;
 
        }
        obmenu.objChosen();
      }
   }
   
   int frame=0;
   //creates a health power up every 10 seconds
   void createPowerUp()
   {
      if(frame==60*10)
      {
         HealthPowerUp health =new HealthPowerUp();
         hlArray.add(health);
         frame=0;
      }
       frame++;
   }
   
   int check=0;
   int init=0;
   //This method will create the towers
   void createTower()
   {
    check=0;
    
    if(init==0)
    {
      //create 10  initial towers -turrets
     for(int i=0;i<objNum;i++)
     {
        Turret turret = new Turret(i);
        twArray.add(turret);
        //all towers are created
        twCreated[i]=true;
     }
     init++;
    }
    else
    {
    
     //create 10 towers
     for(int i=0;i<objNum;i++)
     {
         //if a slot wants a mech
         if(createMech[i])
         {
           if(twCreated[i]==false && createMech[i])
           {
              Mech mech = new Mech(i);
              twArray.add(mech);
              //all towers are created
              twCreated[i]=true;
              createMech[i]=false;
           }
         }
  
            //if this lane allows for a medusa to be created and has not been created before
           if(createMedusa[i] && medusaCreated[i]==false)
           {
            if(i<9)
            {
             //if the tower up one also allows for a medusa and if the tower up one has not been created already
             if(createMedusa[i+1] && medusaCreated[i+1]==false && laneCaptured[i+1]==false && laneCleared[i+1]==false)
             {
                //medusa has been created and cannot be created again in this lane
                medusaCreated[i]=true;
                Medusa medusa1 = new Medusa(i,1);
                twArray.add(medusa1);
                //all towers are created
                twCreated[i]=true;
                
                //medusa has been created and cannot be created again in this lane
                medusaCreated[i+1]=true;
                Medusa medusa2 = new Medusa(i+1,2);
                twArray.add(medusa2);
                //all towers are created
                twCreated[i+1]=true;
             }
             if((medusaCreated[i+1]  || laneCaptured[i+1]) && twCreated[i]==false)
             {
                laneCleared[i]=true;
             }
           }
           else
           {
             if((medusaCreated[i-1]  || laneCaptured[i-1]) && twCreated[i]==false)
             {
                laneCleared[i]=true;
             } 
           }
                
          }
         
        }
       
     }
        
        //renders all the towers that need to be rendered
        for(int i=0;i<twArray.size();i++)
        {
           twArray.get(i).render(); 
        }
    }
    
   void initialFStars()
   {
       for(int i=0;i<brightness.length;i++)
       {
          brightness[i]=random(5,255);
          stroke(brightness[i]);
          float x=random(0,width);
          float y=random(height);
          point(x,y);
          starX[i]=x;
          starY[i]=y;
       }
   }
   
   
   void flicker()
   {
      for(int i=0;i<brightness.length;i++)
      {
         stroke(brightness[i]+random(-50,50));
         float x=starX[i];
         float y=starY[i]++;
         
         if(starY[i]>height)
         {
           starY[i]=0;
         }
         point(x,y);
      }
   }
      
   
   
   
}