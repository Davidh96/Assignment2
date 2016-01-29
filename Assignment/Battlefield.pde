class Battlefield
{

   Battlefield()
   {
   }
   
   //this method creates the moving background
   void generate()
   {
      background(0);
      fill(255);
      stroke(255);
      
      for(int i=0;i<objNum;i++)
      {
        //if a lane has been captured
        if(laneCaptured[i]==true)
        {
           fill(255,0,0,100);
           stroke(255,0,0);
           rect(i*objectW,height,objectW,-height);
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
          for(int i=0;i<laneCheck.length;i++)
          {
            stroke(255,255,255);
            if(laneCheck[i])
            {
              fill(255,0,0,100);
            }
            else
            {
             fill(0,0,255,100);
            }
           
           float x=i*objectW;
           float y=height-objectW;
           
           rect(x,y,objectW,objectW); 
          }
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
        if(objAllowed)
        {
           obmenu.objChosen();
        }
      }
        
   }
   int check=0;
   //This method will create the towers
   void createTower()
   {
    check=0;
    //create 10 towers
         for(int i=0;i<objNum;i++)
         {
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
             //to prevent out of bounds issues
             if(i<9)
             {
               //if the tower up one also allows for a medusa andif the tower upone has not ben created already
               if(createMedusa[i+1] && medusaCreated[i+1]==false)
               {
                  //medusa has been created and cannot be created again in this lane
                  medusaCreated[i]=true;
                  Medusa medusa1 = new Medusa(i);
                  twArray.add(medusa1);
                  //all towers are created
                  twCreated[i]=true;
                  
                  //medusa has been created and cannot be created again in this lane
                  medusaCreated[i+1]=true;
                  Medusa medusa2 = new Medusa(i+1);
                  twArray.add(medusa2);
                  //all towers are created
                  twCreated[i]=true;
               }
             }
              
           
           }
                
         }
         
             for(int j=0;j<objNum;j++)
           {
              if(createMedusa[j])
              {
                 check++; 
              }
           }

for(int k=0;k<objNum;k++)
{
   if(check==10 && twCreated[k]==false)
   {
     
     twCreated[k]=true;

     MotherShip mShip = new MotherShip(k);
     twArray.add(mShip);
     
     
   }
}

     //renders all the towers that need to be rendered
     for(int i=0;i<twArray.size();i++)
     {
        twArray.get(i).render(); 
     }
   }
   
}