class Credit implements PowerUp
{
  int amount;
  
  Credit()
  {
    amount=400;
  }
  
  //displays how many credits a player has
  void display()
  {
     fill(255);
     textSize(12);
     text("Credits",width-objectW/2,height-objectW-boxW/2);
     text(amount,width-objectW/2,height-objectW/2-boxW);
  }
  
  //adds credits to amount
  void applyTo()
  {
    amount+=50;
  }
  
   
}