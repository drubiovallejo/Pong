/*David Rubio Vallejo

04/15/2018

This class defines a paddel class
*/

class Paddle {
  float x;
  float y;
  float w = 75;
  float h = 15;
  int col;
  
  //constructor that takes x and y coords where to put the paddle and its color  
  Paddle(float x, float y, int col) {
    this.x = x;
    this.y = y;
    this.col = col;
  }
  
  //draws the paddle
  void draw() {
    fill(this.col);
    rect(x, y, w, h, 0.1, 0.1, 0.1, 0.1);    
  }
  
  //updates the location of the paddle
  void update() {
    if (keyPressed) {
      //if right arrow is pressed and the right edge of the paddle hasn't hit the right edge of the screen, increase x coordinate
      if ( (keyCode == RIGHT) && ( (x+w) <= width) ) {
        x = x + 3;
      }
      //if left arrow is pressed and the left edge of the paddle hasn't hit the left edge of the screen, increase x coordinate
      if ( (keyCode == LEFT) && (x >= 0) ) {
        x = x - 3;
      } 
    }
  }
  
}
