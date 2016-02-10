    //Abdullah Shah, Processing Assignment 2
    //BREAKOUT GAME
    
    //Data declaration of paddle
  float positionX;
  float positionY;
  float thickness;
  float longness;
  color colour;
  
  //To keep count of points
  int point;
  
  //Used to hide and destroy the blocks
  boolean [] blockVis;
  float [] blockX;
  float [] blockY;
  
  //Block attributes
  float blockThickness;
  float blockLongness;
  color blockColour;
  
  //Ball attributes
  float b_positionX;
  float b_positionY;
  float b_thickness;
  float b_longness;
  color b_colour;
  float b_speedX;
  float b_speedY;
  
  //Controls for the paddle, to turn left or right, by pressing 'a' for left or 'd' for right
  boolean leftturn;
  boolean rightturn;
  boolean gameover;
  
  
  void setup()
  {
    size(800, 800);
    background(127);
    smooth(5);
    
    //keeps count of score
    point = 0;
    
    gameover = false;
    
    //Assigning values to positions, attributes to the paddle
    positionX = width/2 - 50;
    positionY = 570;
    longness = 100;
    thickness = 20;
    colour = color(120, 0, 255);
    
    //Assigning values to the ball
    b_positionX = width/2;
    b_positionY = height/2;
    b_longness = 10;
    b_thickness = 10;
    b_colour = color(255, 0, 255);
    b_speedX= 3;
    b_speedY = 3;
    
    //Assignment attributes to the blocks
    blockLongness = 80;
    blockThickness = 30;
    blockColour = color(255, 50, 50);
    blockVis = new boolean[10]; 
    blockX = new float[10];
    blockY = new float[10];
    
    //For loop to add a 10 row of blocks
    for(int i = 0; i < 10; i++)
    {
      blockVis[i] = true;
      blockX[i] = i * blockLongness;
      blockY[i] = 50;
    }
    
    //Ends game if ball is past the paddle
    if(gameover == true) fill(0);
    
    //Ends game if reached maximum score in level
    if(point == 100)
    {
      fill(0);
    }
    
  }
  
  
void draw()
  {
  //Runs at 60fps
  
    //Controls used to move the paddle
    if (leftturn == true) 
      positionX -= 10;
    else if (rightturn == true)
      positionX += 10;
      
      //Adjusts the position and speed of the ball
      b_positionX += b_speedX;
      b_positionY += b_speedY;
      
      
      //Checks for collision against the ball and paddle, if there is collision, the ball would bounce away
      if(testCollision(positionX, positionY, longness, thickness, b_positionX, b_positionY, b_longness, b_thickness))
      {
        b_speedY *= -1;
      }
      
      //For loop to destroy the blocks if the ball touches the blocks
      for(int i = 0; i < blockX.length; i++) 
      {
        if(blockVis[i] && testCollision(blockX[i], blockY[i], blockLongness, blockThickness,
                        b_positionX, b_positionY, b_longness, b_thickness))
        {
          b_speedY *= -1;
          
          blockVis[i] = false;
          
          //Increments score by 10 after each block is destroyed
          point += 10;
        }
      }
      
      
      
      
      //Collision testing the ball against the window of the game
      if(b_positionX < 0 || b_positionX > 790) b_speedX *= -1;
      if(b_positionY < 0 || b_positionY > 590) b_speedY *= -1;
      if(b_positionX < 10 || b_positionY < 10) gameover = true;
      
      //Collision tests the paddle with the window to ensure it doesn't go outside window
      if(positionX < 0) positionX = 0;
      else if(positionX > 700) positionX = 700;
      
    //Drawing the ball and giving it a dynamic positioning
    background(0);
    noStroke();
    fill(b_colour);
    rect(b_positionX, b_positionY, b_longness, b_thickness, 15);
    
    //Drawing the paddle and giving it a dynamic positioning
    fill(colour);
    rect(positionX, positionY, longness, thickness, 15);
    
    //blocks
    stroke(0);
    
    //Completely removes the blocks and not just hides it, so that the ball doesn't collide with empty space
    for(int i = 0; i < blockX.length; i++)
    {
      if(blockVis[i])
      {
        fill(blockColour);
        rect(blockX[i], blockY[i], blockLongness, blockThickness);
      }
    }
    
    //Controls
    if (keyPressed)
    {
      if (key == 'a')
        leftturn = true;
      else if (key == 'd')
        rightturn = true;
    }
    else
    {
      leftturn = false;
      rightturn = false;
    }
    
    
    
    
  }
  
  
  //Tests collision
  boolean testCollision (float x1, float y1, float longness1, float thickness1,
                         float x2, float y2, float longness2, float thickness2)
                         {
                           boolean horizontal = false;
                           boolean vertical = false;
                           
                           if(x1 < x2) horizontal = abs(x2 - x1) < longness1;
                           else horizontal = abs(x1 - x2) < longness2;
                           
                           if(y1 < y2) vertical = abs(y2 - y1) < thickness1;
                           else vertical = abs(y1 - y2) < thickness2;
                           
                           
                           return horizontal && vertical;
                         }
                         
                  
