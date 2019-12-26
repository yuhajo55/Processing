
void setup()
{
  size(1200,800); //size for the page
  pigx = width * 3/4; //pig's x cemter
  pigy = height/2; //pig's y center
  speedX =random(1,3); //random of speedX for pig
  speedY =random(1,3); //random of speedY for pig
}
float speedX; //speedX of pig
float speedY; //speedy of pig
int directionX = 1; //direction for x
int directionY = -1; //direction for y
int pigx; //x center of pig  == 900
int pigy;  //y center of pig == 400 
void draw()
{
  noStroke(); //no stroke

  //background
  for(int x = 0; x<width;x+=10) // for loop for width background            
  {  
    for(int y = 0; y<height;y+=50) // for loop for height background
    {  
      fill(0, x * 0.3, (120- x/5)); //fill color from blue to green for rect gradiation
      rect(x,y,120,120); //rect for background 
    }
  }

//pig
fill(255,178,217);  //  body color(pink) of pig 
ellipse(pigx,pigy,220,80);  // body of pig

fill(255,178,217);  // the head's color(pink) of pig
ellipse(pigx - 75,pigy,100,100);  //the head of pig

stroke(255,178,217);//pig's leg color is pink
strokeWeight(15);  // pig's leg thickness
strokeCap(ROUND);  // pig's leg curving effect
line(pigx +70,pigy + 20,pigx + 70,pigy + 70);  // pig's leg
line(pigx -10,pigy + 20,pigx - 10,pigy + 70);  // pig's leg

strokeWeight(0);// deleting before setting
fill(0); //pig's eyes(black) color
ellipse(pigx - 85,pigy - 10,10,10); //pig's left eye
ellipse(pigx - 65,pigy - 10,10,10); //pig's right eye

fill(255); //fill pig's pupil(white) color
ellipse(pigx - 86,pigy - 10,3,3);  //pig's left pupil 
ellipse(pigx - 66,pigy - 10,3,3); //pig's right pupil 

fill(232,217,255); //pig nose's(purple) color
ellipse(pigx - 75,pigy + 10,45,25); //pig nose

fill(255); //pig nostril(white) color
ellipse(pigx - 80,pigy + 10,5,5); //pig nostril
ellipse(pigx - 70,pigy + 10,5,5); //pig nostril

stroke(0); //pig's eyebrow(black) color
strokeWeight(5); //pig's eyebrow thickness 
line(pigx - 100,pigy - 20,pigx - 80,pigy - 20); //pig's right eyebrow
line(pigx - 70,pigy - 20,pigx - 50,pigy - 20); //pig's left eyebrow

noFill();//no to fill the color in arc
strokeWeight(3);//pig's mouse thickness
stroke(255);// pig's mouse(white) color
arc(pigx - 75,pigy + 35,35,15,PI,TWO_PI);//pig's mouse
arc(pigx + 130,pigy + 10,50,40,PI,TWO_PI); //pig's tail

//house
int housex = 100; //x center of house 
int housey = 250; //y center of house

fill(153,0,76); //fill house roof(purple) color
triangle(housex,housey,housex + 95,housey - 150,housex + 190,housey); //set roof with triangle

fill(255,246,18); //fill house body(yellow) color
rect(housex + 20, housey, 150, 200); //set house body with rect

fill(0,255,255); //fill house door(sky blue) color
rect(housex + 100, housey+100, 70, 100); //set door for house with rect

fill(0); //fill house doorknob(black) color
ellipse(housex + 120, housey + 160, 15, 15); //set doorknob with ellipse

//direction of pig
pigx += speedX * directionX; //speed * direction for pigx's direction
if((pigx<width-width/2+100)||(pigx>width-170)) //if the pigx is in the area change direction
  directionX = -directionX; //change the direction to going left
  pigy += speedY *directionY; //speed * direction for pigy's direction
if((pigy>height-87)||(pigy<0+65)) //if the pigy is in the area change direction 
  directionY = -directionY; //change the direction to going right

//cigarette
float csize = 20; //size of cigarette
for(int x = 0; x < width/2; x += 150) //width for cigarette 
{
  for(int y = 0; y < height; y += 100)  //height for cigarette
  {
    if(!(x >= 60 && x <= 250 && y >= 100 && y <= 450)) //if its ont in this area do it!
    {
       if(pigx <= width/2 * 5/4) //if the pigx is in the 20% of the right side set to random
       {
           csize = random(10,30); //set the size into random
           stroke(153); //set stroke to 153
           fill(255); //fill color of white part of cigarette
           rect(x,y + 30, 70-x*0.02, csize-x*0.02); //white part of cigarrete
           fill(255,0,0); //fill color of red part of cigarette
           rect(x + 50,y + 30, csize-x *0.02, csize-x*0.02); //red part of cigarrete
       }
       else
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

//tree
int tsize = 30; //set size for size of tree
for(int x = width/2 + 30; x < width; x += 150) // width for tree
{
  for(int y = 40; y < height; y += 100) // heigth for tree
  {
    
    if(!(x>= pigx - 180 && x <= pigx + 200 && y >= pigy - 100 && y <= pigy + 120)) //if its not in this area do it!
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
