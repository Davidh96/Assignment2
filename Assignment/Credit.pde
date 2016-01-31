class Credit implements PowerUp
{
  int amount;
  
  Credit()
  {
    amount=100;
  }
  
  void display()
  {
     fill(255);
     text("Credits",width-objectW/2,height-objectW);
     text(amount,width-objectW/2,height-objectW/2);
  }
  
  void applyTo()
  {
    amount+=50;
  }
  
  void reduce(int reduce)
  {
    amount-=reduce;
  }
}