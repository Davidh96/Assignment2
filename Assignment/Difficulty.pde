class Difficulty
{
  
   Difficulty(int level)
   {
     
     if(level==1)
     {
       String[] diffLevel = loadStrings("Easy.csv");
       for(String l:diffLevel)
       {
          difficulty.add(l);
       }
     }
     if(level==2)
     {
       String[] diffLevel = loadStrings("Normal.csv");
       for(String l:diffLevel)
       {
          difficulty.add(l);
       }
     }
     if(level==3)
     {
       String[] diffLevel = loadStrings("Hard.csv");
       for(String l:diffLevel)
       {
          difficulty.add(l);
       }
     }
     difficultySet=true;
   }
}