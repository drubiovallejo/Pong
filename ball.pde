/*David Rubio Vallejo

04/15/2018

This class defines a ball class
*/

class Ball {
  PVector position;
  PVector velocity;
  int radius;
  int col;
  
  Ball() {
    position = new PVector(width/2, 300);
    velocity = new PVector(1.5,3.5);
    radius = 8;
    col = #FFFFFF;
  }
  
  //updates location of the ball 
  void update() {
    // compute where ball is next
    position = position.add(velocity);
    //checks if the ball hit a rigth or left edge of the screen and modifies direction accordingly
    checkLateralBounce();
    //checks if the ball exited through the top (bottom) and increases points and decreases balls left accordingly
    checkTopExit();
    checkBottomExit();
    //checks if the ball hit one of the paddles and modifies direction accordingly
    checkTopPaddleBounce();
    checkBottomPaddleBounce();     
          
  }
  
   //helper method to check if the ball hit a right or left edge of the screen
   void checkLateralBounce(){
      if (( (position.x + this.radius) > width) || ((position.x - this.radius) < 0)) {
      velocity.x = velocity.x * -1;
      }
    }
    
    //helper method to check if ball left from top of the screen
    void checkTopExit(){
      //if the ball falls through the top, make it reappear in the middle going down
      if ( position.y < 0 ){
        position = new PVector(width/2, 300);
        velocity = new PVector(1.5,3.5);
        //reduce the number of balls available to player 1
        hup1.round--;
        //play missed ball tune
        miss.play();
      }
    }
    
    //helper method to check if ball left from the bottom of the screen
    void checkBottomExit(){
      //if the ball falls through the bottom, make it reappear in the middle going up
      if ( position.y > height ){
        position = new PVector(width/2, 300);
        velocity = new PVector(-1.5,-3.5);
        //reduce the number of balls available to player 2
        hup2.round--;
        //play missed ball tune
        miss.play();
      }
    }
  
   //helper method to check if the ball hit the top paddle
   void checkTopPaddleBounce(){
      //to bounce off the Top paddle
      if ((position.x >= BottomPaddle.x) && (position.x <= (BottomPaddle.x + BottomPaddle.w)) && ( (position.y + this.radius) >= BottomPaddle.y) && ( (position.y - this.radius) <= BottomPaddle.y)) {
        velocity.x = (velocity.x + random(-1,1));// * -1;
        velocity.y = velocity.y * -1 ;
        //changes color of the ball to the color of the top paddle
        col = #FF0000;
        bounce.play();
      }
    }
    
   //helper method to check if the ball hit the bottom paddle
   void checkBottomPaddleBounce(){
     //to bounce off the Top paddle
     if ((position.x >= TPaddle.x) && (position.x <= (TPaddle.x + TPaddle.w)) && ( (position.y - this.radius) <= (TPaddle.y+TPaddle.h)) && (position.y + this.radius) >= (TPaddle.y+TPaddle.h)) {
        velocity.x = (velocity.x + random(-1,1));// * -1;
        velocity.y = velocity.y * -1 ;
        //changes color of the ball to the color of the bottom paddle
        col = #00FF00;      
        bounce.play();
      }
   }
  
  //draws a ball of the desired color and size in the desired position
  void draw() {
    fill(col);
    ellipse(position.x, position.y, radius*2, radius*2);    
  }
}
