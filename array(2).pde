void setup()
{
  size(300,200);
  noStroke();
  x = new float[100];
  
  for(int i = 0; i < x.length;i++)
  {
    x[i] = random(-100,100);
  }
}

float x[];
void draw()
{
  background(10,200,200);
  for(int i = 0; i <x.length;i++)
  {
    x[i] += 0.5;
    fill(255,200);
    ellipse(x[i],i*height/100,30,30);
  }
}
