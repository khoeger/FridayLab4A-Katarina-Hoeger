/*   
 Lab 4 - NMD 211 
 FirstName LastName
 October 2, 2020
 
 Trigger Lab
 Make 3 Triggered event
 - Key Press
 - Mouse Activated
 - If over certain color and mouse clicked
 
 Spyro Image: https://vignette.wikia.nocookie.net/deathbattlefanon/images/3/33/Spyro_in_Spyro_Reignited_Trilogy.png/revision/latest?cb=20180405154517
 */
float ellipseX = 100;                                       // starting x of floating ellipse x
float ellipseY = 100;                                       // starting y of floating ellipse y

int stepSize = 1;                                           // how many spaces ellipse moves at a time

color mouseOverColor ;                                      // color mouse is hovering over
color targetColor = -51456;                                 // trigger color, -51456 , color of red circle over yellow 

PImage spyro;                                               // identifier for input image

void setup() {
  size( 500, 500);                                          // canvas size

  // Modes
  ellipseMode( CENTER );
  imageMode(CENTER);

  // Stroke
  noStroke();

  // Imaage
  spyro = loadImage("Spyro_in_Spyro_Reignited_Trilogy.png");   // image file to load
  spyro.resize(width/2, 0);                                    // spiro is a third of the page
  
} // -- END Setup

void draw() {
  background( 0, 0, 0);

  /* Mouse Pressed Example
   if press mouse, red circle appears on top of yellow circle
   */
  if (mousePressed == true ) {
    fill(255, 255, 0);                                       // yellow
    ellipse( width/2, height/2, 7*width/10, 7*height/10);   // ellipse dependent on canvas size

    fill(255, 0, 0, 200);                                    // red
    ellipse( width/2, height/2, 4*width/5, 4*height/5);      // ellipse dependent on canvas size
  } else { 
    fill(255, 255, 0);                                      // yellow
    ellipse( width/2, height/2, 7*width/10, 7*height/10);   // ellipse dependent on canvas size
  }

  /* Key Input Example 
   move something up, down, left right
     w - up
     s - down
     a - left
     d - right
   */
  fill( 0, 255, 255, 200);                                   // cyan
  ellipse( ellipseX, ellipseY, 100, 20);                     // ellipse to move

  if (keyPressed) {
    if (key == 'w' ) {
      ellipseY -= stepSize;
      println("key:", key, "| y:", ellipseY );
    }
    if (key == 's' ) {
      ellipseY += stepSize;
      println("key:", key, "| y:", ellipseY );
    }
    if (key == 'a' ) {
      ellipseX -= stepSize;
      println("key:", key, "| x:", ellipseX );
    }
    if (key == 'd' ) {
      ellipseX += stepSize;
      println("key:", key, "| x:", ellipseX );
    }
  } else {
    println("");
  }
  /* Pixel Color Trigger 
   - if mouse over color & mouse pressed 
   background turns magenta
   */
  mouseOverColor = get(mouseX, mouseY);  // color under mouse
  println( mouseOverColor );
  if (mouseOverColor == targetColor ) {
    //background(255, 0, 255);
    image( spyro, width/2, height/2);
  }
} // - END Draw
