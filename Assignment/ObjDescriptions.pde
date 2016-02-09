class ObjDescriptions
{
   ArrayList<String> descr=new ArrayList<String>();
   int index;
   String find;
   
   //loads in the strings
   ObjDescriptions()
   {
     String[] desc = loadStrings("descriptions.txt");
     for(String l:desc)
     {
        descr.add(l);
     }

   }
   
   //will find the description for objs
   void giveDescription(float x,float y,String find)
   {
     for(String s:descr)
     {
      index=s.indexOf(find);
      
      //when  find is found
      if(index!=-1)
      {
         String disp="";
         int start=find.length();
         for(int i=0;i<3;i++)
         {
            //displays the text after find string
           disp+=s.substring(start,(s.length()/3)*(i+1));
           
           //if not last line
           if(i!=2)
           {
              disp+="\n";
           }
           
           start=(s.length()/3)*(i+1);
           
          }
         textSize(11);
         textAlign(CENTER,CENTER);
         fill(0);
         text(disp,x,y); 
      }
     } 
   }
}