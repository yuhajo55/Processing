class Ball
{
  float x, y;
  float r;
  float s; 
  float d = 1; 
  Ball(float px,float py, float pr,float ps) 
  {
    x = px;
    y = py;
    r = pr;
    s = ps;
  }
  void move()
  {
   y += s * d;
   if((y + r/2> height) || (y-r/2<0))
   {
     d = -d;
   }
  }
  void display()
  {
    fill(255,11,0);
    ellipse(x,y,r,r);
  }
}
Ball ball;
Ball ball2;
void setup()
{
  size(300,100);
  ball = new Ball(50,50,30,1.5);
  ball2 = new Ball(100,50,30,2);
}
void draw()
{
  background(200);
  ball.move();
  ball.display();
  
  ball2.move();
  ball2.display();
}
  
