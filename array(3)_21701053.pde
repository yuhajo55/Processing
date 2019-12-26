float gray[];
void setup()
{
  size(240,120);
  gray = new float[width];
  for(int i = 0; i < gray.length;i++)
  {
    gray[i] = random(255);
  }
}
void draw()
{
  for(int i = 0; i < width; i++)
  {
    stroke(gray[i]);
    line(i,0,i,height);
  }
}
