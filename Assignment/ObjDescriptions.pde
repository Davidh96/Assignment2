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
   
   //will find the description for Ship
   void Ship()
   {
     find="Ship-";
     for(String s:descr)
     {
      index=s.indexOf(find);
      //when  find is found
      if(index!=-1)
      {
         //displays the text after find string
         String disp=s.substring(find.length());
         textSize(10);
         text(disp,250,250); 
      }
     }
   }
   
   //will find the description for IFO
   void IFO()
   {
     find="IFO-";
     for(String s:descr)
     {
      index=s.indexOf(find);
      //when  find is found
      if(index!=-1)
      {
         //displays the text after find string
         String disp=s.substring(find.length());
         textSize(10);
         text(disp,250,250); 
      }
     }
   }
   
   //will find the description for Lineman
   void Lineman()
   {
     find="Lineman-";
     for(String s:descr)
     {
      index=s.indexOf(find);
      //when  find is found
      if(index!=-1)
      {
         //displays the text after find string
         String disp=s.substring(find.length());
         textSize(10);
         text(disp,250,250); 
      }
     } 
   }
   
   //will find the description for Bomber
   void Bomber()
   {
     find="Bomber-";
     for(String s:descr)
     {
      index=s.indexOf(find);
      //when  find is found
      if(index!=-1)
      {
         //displays the text after find string
         String disp=s.substring(find.length());
         textSize(10);
         text(disp,250,250); 
      }
     }
   }
}