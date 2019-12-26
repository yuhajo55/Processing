House house; //HW3 class of house 
Pig[] pig = new Pig[10]; ////HW3 class of pig with array of 10
void setup()
{
  size(1200,800); //size for the page
  house = new House(100,250); //HW3 class of house
  for(int i = 0; i < 10;i++) //HW3 ten pigs
  {
    speedX =random(1,3); //HW3 random of speedX for 10 pig
    speedY =random(1,3); //HW3 random of speedY for 10 pig
    pigx = random(width/2 + 200, width-200); //HW3 10 pig's x cemter
    pigy = random(200,height-200); //HW3 10 pig's y center
    s = random(0.4,1);  //HW3 scale of pig
    c = color(random(255),random(255),random(255)); //HW3 random color of pig body
    pig[i] = new Pig(pigx, pigy, speedX, speedY ,c,s); //HW3 different pig in different area
  }
}
color c; //HW3 color of pig
float s; //HW3 scale for pig
float speedX; //speedX of pig
float speedY; //speedy of pig
float pigx; //x center of pig  == 900
float pigy;  //y center of pig == 400e 
void bg(int red1, int green1, int blue1, int red2, int green2, int blue2) //HW3 background gradiation in function
{
    for(int x=0; x<width; x+=10)//HW3 background
    {
      // pollution color - skyblue (20, 196, 255) 
      // clean color - green (29,219, 22)
      fill(red1 +(red2-red1)*float(x)/width, green1+(green2-green1)*float(x)/width, blue1+(blue2-blue1)*float(x)/width); //HW3 set color
      rect(x, 0, x+10, height);  // a divided background section:  10X10 rectangle
    }
}
void pollutant() //HW3 pollution into function
{
  float csize = 20; //size of cigarette
  //cigarette
  boolean a = true; //HW3 to avoid drawing 10 cigarrete
  for(int x = 0; x < width/2; x += 150) //width for cigarette 
  {
    for(int y = 0; y < height; y += 100)  //height for cigarette
    {
      for(int i = 0; i < 10; i++) //HW3 check 10 pigs
      {
        if(pig[i].px <= width/2 * 6/5 ) //if the pigx is in the 20% of the right side set to random
        {
          a = true; //HW3 set into true
          if(pig[i].px - 100 <= width/2 + 30 *pig[i].sa) //HW3 instead of 20% if its in 5% break
          {
            a = false; //HW3 set into false if it is in 5%
          }
        }
     }
      if(!(x >= 60 && x <= 250 && y >= 100 && y <= 450)) //if its not in this area do it!
      {
        if(a==false) //HW3 if it is false randomize
        {  
             csize = random(10,30); //set the size into random     
             stroke(153); //set stroke to 153
             fill(255); //fill color of white part of cigarette
             rect(x,y + 30, 70-x*0.02, csize-x*0.02); //white part of cigarrete
             fill(255,0,0); //fill color of red part of cigarette
             rect(x + 50,y + 30, csize-x *0.02, csize-x*0.02); //red part of cigarrete
        }
        else //HW3 else just draw not randomize 
        {
           stroke(153); //set stroke to 153
           fill(255); //fill color of white part of cigarette
           rect(x,y + 30, 70-x*0.02, csize-x*0.02); //white part of cigarrete
           fill(255,0,0); //fill color of red part of cigarette
           rect(x + 50,y + 30, csize-x *0.02, csize-x*0.02); //red part of cigarrete
        } 
      }
  }
  }
}

void tree(int tsize) //HW3 tree into function
{
  boolean a = true; //HW3 to check all ten pigs 
  for(int x = width/2 + 30; x < width; x += 150) // width for tree
  {
    for(int y = 40; y < height; y += 100) // heigth for tree
    { 
      a = true; //HW3 set into true
      for(int i = 0; i < pig.length;i+=1) //HW3 check all 10 pigs
      {
        if(x>= pig[i].px - 200 * pig[i].sa && x <= pig[i].px + 220 * pig[i].sa && y >= pig[i].py - 150 * pig[i].sa && y <= pig[i].py + 160 * pig[i].sa)//if its not in this area do it!
        {
         a =false; //HW3 set a into false
         break; //HW3 if it is in this not need to do more 
        }
      }
      if(a==false) //HW3 if false do not draw
      {
        continue; //HW3 do next
      }
      else //HW3 else draw the tree
      {
          fill(150,75,0); //fill tree branch(branch) color
          rect(x - 10, y + 10, 20, 30); //tree branch
          fill(0,200,0); //fill leaves(green) color
          ellipse(x, y, tsize, tsize); //leaves
          ellipse(x, y - 20, tsize, tsize); //leaves 
          ellipse(x - 20, y, tsize, tsize); //leaves
          ellipse(x + 20, y, tsize, tsize); //leaves
      }
    }   
  }
}

void draw()
{
  noStroke(); //no stroke
  bg(20,196,255,29,219,22); //HW3 background function of hw3
  
  house.display();//HW3 display of house in function
  pollutant(); //HW3 cigarette in function
  for(int i = 0; i < 10; i++) //HW3 draw ten pigs
  {  
    pig[i].move(); //HW3 move all 10 pigs
    pushMatrix(); //HW3 push the Matrix (start)
    translate(pig[i].px*(1-pig[i].sa),pig[i].py*(1-pig[i].sa)); //HW3 translate the pigs size
    scale(pig[i].sa); //HW3 scale the pigs size
    pig[i].display(); //HW3 display of house in class and in function
    popMatrix(); //HW3 pop the Matrix (stop)
  }
  tree(30); //HW3 tree in function
}
class House //HW3 class of House
{
  //house
  int housex; //x center of house 
  int housey; //y center of house
  House(int x, int y) //HW3 constructer of House
  {
    housex = x; //HW3 set the x to housex 
    housey = y; //HW3 set the y to housey
  }
  void display() //HW3 house function of display
  {
  fill(153,0,76); //fill house roof(purple) color
  triangle(housex,housey,housex + 95,housey - 150,housex + 190,housey); //set roof with triangle

  fill(255,246,18); //fill house body(yellow) color
  rect(housex + 20, housey, 150, 200); //set house body with rect

  fill(0,255,255); //fill house door(sky blue) color
  rect(housex + 100, housey+100, 70, 100); //set door for house with rect

  fill(0); //fill house doorknob(black) color  
  ellipse(housex + 120, housey + 160, 15, 15); //set doorknob with ellipse
  }
}
class Pig //HW3 class of Pig
{
  float px; //HW3 x center of pig
  float py; //HW3 y center of pig
  float speedX; //HW3 speedX of pig
  float speedY; //HW3 speedy of pig
  float directionX = random(-1,1); //HW3 directionX of pig
  float directionY = random(-1,1); //HW3 directionY of pig
  color f; //HW3 color of pig
  float sa; //HW3 scale of pig
  Pig(float x, float y, float sx, float sy, color c, float s) //HW3 constructer of pig
  {
    px = x; //HW3 px to x
    py = y; //HW3 py to y
    speedX = sx; //HW3 speedX to sx
    speedY = sy; //HW3 speedY to sy
    f = c; //HW3 f to c
    sa = s; //HW3 sa to s
  }
  void display() //HW3 display of pig in function
  {
  //pig
  fill(f);  //  body color(pink) of pig 
  ellipse(px,py,220,80);  // body of pig

  fill(255,178,217);  // the head's color(pink) of pig
  ellipse(px - 75,py,100,100);  //the head of pig

  stroke(255,178,217);//pig's leg color is pink
  strokeWeight(15);  // pig's leg thickness
  strokeCap(ROUND);  // pig's leg curving effect
  line(px +70,py + 20,px + 70,py + 70);  // pig's leg
  line(px -10,py + 20,px - 10,py + 70);  // pig's leg

  strokeWeight(0);// deleting before setting
  fill(0); //pig's eyes(black) color
  ellipse(px - 85,py - 10,10,10); //pig's left eye
  ellipse(px - 65,py - 10,10,10); //pig's right eye

  fill(255); //fill pig's pupil(white) color
  ellipse(px - 86,py - 10,3,3);  //pig's left pupil 
  ellipse(px - 66,py - 10,3,3); //pig's right pupil 

  fill(232,217,255); //pig nose's(purple) color
  ellipse(px - 75,py + 10,45,25); //pig nose

  fill(255); //pig nostril(white) color
  ellipse(px - 80,py + 10,5,5); //pig nostril
  ellipse(px - 70,py + 10,5,5); //pig nostril

  stroke(0); //pig's eyebrow(black) color
  strokeWeight(5); //pig's eyebrow thickness 
  line(px - 100,py - 20,px - 80,py - 20); //pig's right eyebrow
  line(px - 70,py - 20,px - 50,py - 20); //pig's left eyebrow

  noFill();//no to fill the color in arc
  strokeWeight(3);//pig's mouse thickness
  stroke(255);// pig's mouse(white) color
  arc(px - 75,py + 35,35,15,PI,TWO_PI);//pig's mouse
  arc(px + 130,py + 10,50,40,PI,TWO_PI); //pig's tail
  }
  void move() //HW3 function of move
  {
    if (directionX <0) //HW3 for the directionX if the value is below 0 
    {
       directionX = -1; //HW3 set it to -1
    }
    else //HW3 else if the value is above 0 
    {
      directionX = 1; //HW3 set it to 1
    }
    if (directionY <0) //HW3 for the directionY if the value is below 0
    {
      directionY = -1; //HW3 set it to -1
    }
    else //HW3 else if the value is above 0
    {
      directionY = 1; //HW3 set it to 1
    }
  //direction of pig
   px += speedX * directionX; //speed * direction for pigx's direction
    if((px<width-width/2+100 *sa)||(px>width-170*sa)) //if the pigx is in the area change direction
      directionX = -directionX; //change the direction to  going left
      py += speedY *directionY; //speed * direction for pigy's direction
    if((py>height-87*sa)||(py<0+65*sa)) //if the pigy is in the area change direction 
      directionY = -directionY; //change the direction to going right
    pigx = px; //HW3 pigx to px
    pigy = py; //HW3 pigy to py
  }
}
