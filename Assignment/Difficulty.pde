class Difficulty
{
  
   //will load the difficulty level attributes from csv files.
   Difficulty(int level)
   {
     
     //if the user chooses easy
     if(level==1)
     {
       //load easy attributes
       String[] diffLevel = loadStrings("Easy.csv");
       for(String l:diffLevel)
       {
          difficulty.add(l);
       }
     }
     //if the user chooses normal
     if(level==2)
     {
       //load normal attributes
       String[] diffLevel = loadStrings("Normal.csv");
       for(String l:diffLevel)
       {
          difficulty.add(l);
       }
     }
     //if the user chooses hard
     if(level==3)
     {
       //load hard attributes
       String[] diffLevel = loadStrings("Hard.csv");
       for(String l:diffLevel)
       {
          difficulty.add(l);
       }
     }
     difficultySet=true;
   }
}