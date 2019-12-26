class Snowman{
  float x,y;
  float sp;
  
  Snowman(float px, float py, float psp)
  {
    x = px;
    y = py;
    sp = psp;
  }
  
  void move()
  {
    x+=sp;
    if(x>width) x = 0;
  }
  
  void display()
  {
    ellipse(x,y,30,30);
    ellipse(x,y+40,50,50);
  }
}
Snowman sm[] = new Snowman[100];
void setup()
{
  size(800,600);
  for(int i = 0; i <sm.length;i++)
  {
    float x = random(width);
    float y = random(height);
    float speed = random(2);
    sm[i] = new Snowman(x,y,speed);
  }
}
void draw()
{
  background(10,200,200);
  for(int i = 0; i <sm.length;i++)
  {
    sm[i].move();
    sm[i].display();
  }
}
