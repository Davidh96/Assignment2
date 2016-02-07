class Credit implements PowerUp
{
  int amount;
  
  Credit()
  {
    amount=500000;
  }
  
  void display()
  {
     fill(255);
     text("Credits",width-objectW/2,height-objectW-boxW/2);
     text(amount,width-objectW/2,height-objectW/2-boxW);
  }
  
  void applyTo()
  {
    amount+=50;
  }
}