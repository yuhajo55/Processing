class JitterBug
{
  float x;
  float y;
  int diameter;
  float speed = 2.5;
  
  JitterBug(float tempX, float tempY, int tempDiameter)
  {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
  }
  void move()
  {
    x += random(-speed,speed);
    y += random(-speed,speed);
  }
  void display()
  {
    ellipse(x,y,diameter,diameter);
  }
}
JitterBug bugs[] = new JitterBug[30];

void setup()
{
  size(480,120);
  for(int i = 0; i < bugs.length;i++)
  {
    float x = random(width);
    float y = random(height);
    int r = i + 2;
    bugs[i] = new JitterBug(x,y,r);
  }
}

void draw()
{
  for(int i = 0; i <bugs.length;i++)
  {
    bugs[i].move();
    bugs[i].display();
  }
}