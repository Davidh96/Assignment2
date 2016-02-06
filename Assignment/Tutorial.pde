class Tutorial
{
   ArrayList<String> descr=new ArrayList<String>();
   int index;
   String find;
   
   //loads in the strings
   Tutorial()
   {
     String[] desc = loadStrings("descriptions.txt");
     for(String l:desc)
     {
        descr.add(l);
     }

   }
   
   void display()
   {
     int i=0;
      for(String s:descr)
      {
         fill(255);
         textSize(10);
         if(s.length()>110)
         {
            String sub=s.substring(0,110)+"\n";
            s=sub+s.substring(110);
         }
         text(s,width/2,(height/(descr.size()))*i+objectW/2);
         i++;
      }
   }
}