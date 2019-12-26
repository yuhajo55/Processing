void setup()
{
 size(1000,1000);
}
void draw()
{
  background(255);
  float x = 50, y = 60;
  for(int i = 0; i < 100;i++)
  {
    x = random(width);
    y = random(height);
    
    color c = color(random(255),random(255),random(255));
    frog(c,x,y);
  }
}

void frog(color c,float x, float y)
{
  fill(c);
  ellipse(x,y,80,60);
  arc(x,y,50,50,0,PI);
  ellipse(x-20,y-30,32,32);
  ellipse(x+20,y-30,32,32);
  ellipse(x-20,y-30,5,5);
  ellipse(x+20,y-30,5,5);
}
