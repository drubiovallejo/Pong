/*David Rubio Vallejo

04/15/2018

This class defines a top-paddle class from the super-class paddle
*/

class TopPaddle extends Paddle{
   
  //constructor calls super-constructor in paddle parent class
  TopPaddle(float x, float y, int col) {
   super(x,y, col);
  }
  
  //overrides update method in parent class to assign different control keys
  @Override
  void update() {
    if (keyPressed) {
      //if 'd' is pressed and the right edge of the paddle hasn't hit the right edge of the screen, increase x coordinate
      if ( (key == 'd') && ( (x+w) <= width) ) {
        x = x + 3;
      }
      //if 'a' is pressed and the left edge of the paddle hasn't hit the left edge of the screen, decrease x coordinate
      if ( (key == 'a') && (x >= 0) ) {
        x = x - 3;
      }  
    }
  }
  
}
