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
  
  
