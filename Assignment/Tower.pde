abstract class Tower 
{
  boolean destroyed=false; 
  int frame=0;
  float objectW=width/(float)lanes;
  PVector pos;
  int health;
  ArrayList<Bullet> blArray = new ArrayList<Bullet>();
  int lane;
  int maxhealth;
  
  abstract void render();
  abstract void shoot(float tkY);
  abstract void takeDamage();
}