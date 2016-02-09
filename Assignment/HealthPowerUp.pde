class HealthPowerUp extends GameObject implements PowerUp
{
  float theta = 0.0f;
  PVector move;
  
  HealthPowerUp()
  {
    //will give the health power up a random position away from obj menu
    pos=new PVector(width-objectW, random(objectW, height-objectW)); 
    move = new PVector(-5, 0);
  }
  
  //renders what the health power looks like
  void render()
  {
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(theta);
      stroke(0,255,0);
      fill(0,255,0);
      rect(-objectW,-objectW,objectW,objectW);
    popMatrix();
    
    move();
    detect();

  }
  
  //will detect whether or not a user has clicked on the health power up
  void detect()
  {
    if(mousePressed)
    {
       PVector mouse = new PVector(mouseX,mouseY);
       
       if(pos.dist(mouse)<objectW)
       {
         applyTo();
         credit.applyTo();
         hlArray.remove(this);
       }
    } 
  }
  
  //applies the powerup to all objs
  void applyTo()
  {
     for(int i=0;i<objArray.size();i++)
     {
       //sets obj health to its maxealth
       objArray.get(i).health=objArray.get(i).maxhealth;
     }
  }
  
  //moves the powerup accross the screen
  void move()
  {
    theta += 0.01f;
    
    pos.add(move);
    
    if (pos.x < 0)
    {
      hlArray.remove(this);
    }
  }
}