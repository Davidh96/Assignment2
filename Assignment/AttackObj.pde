abstract class AttackObj extends GameObject
{
  
  int readframe;
  
   void getAttributes(String find)
  {
        for(String s:difficulty)
      {
         int j=s.indexOf(find);
         if(j!=-1)
         {
           maxhealth=(int)parseFloat(s.substring(j+find.length(),s.lastIndexOf(",")));
           readframe=(int)parseFloat(s.substring(s.lastIndexOf(",")+1));
         }
      }
      health=maxhealth;
  } 
  

}