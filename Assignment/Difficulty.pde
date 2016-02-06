class Difficulty
{
  
   Difficulty()
   {
     String[] diffLevel = loadStrings("Normal.csv");
     for(String l:diffLevel)
     {
        difficulty.add(l);
     }
 
   }
}