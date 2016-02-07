class Battlefield
{
   
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
           
           //remove obj in captured lane
           for(int j=0;j<objArray.size();j++)
           {
             if(objArray.get(j).lane==i)
             {
                 objArray.remove(j);
             }
           }
           
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
        if(objAllowed==false)
        {
           objArray.remove(objArray.size()-1);
           objAllowed=true;
 
        }
        obmenu.objChosen();
      }
   }
   
   int frame=0;
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
             if(createMedusa[i+1] && medusaCreated[i+1]==false)
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
           }
                
          }
         
       
       
       //checks if all other towers have been destroyed
       if(twArray.size()<1)
       {
         //checks that a mothership can be created, which is only after the creation of a Medusa
         for(int j=0;j<objNum;j++)
         {
            if(createMedusa[j] || laneCaptured[j])
            {
               check++; 
            }
         }
    
          for(int k=0;k<objNum;k++)
          {
             //check if a mthersip can be created
             if(check==10 && twCreated[k]==false)
             {
               twCreated[k]=true;
               MotherShip mShip = new MotherShip(k);
               twArray.add(mShip);
      
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
      
   }
   
   
}