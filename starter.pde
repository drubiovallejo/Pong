/*David Rubio Vallejo

04/15/2018

Pong game driver class

*/

import java.util.*;
import processing.sound.*;

//declares objects to be used
Ball ball;
Paddle BottomPaddle;
Headsup hup1;
TopPaddle TPaddle;
Headsup hup2;
SoundFile bounce;
SoundFile miss;

//sets up the screen
void setup() {
  size(300, 600);
  //creates the sound objects
  bounce = new SoundFile(this, "pong.mp3");
  miss = new SoundFile(this, "lostball.mp3");
  //creates top header and paddle 
  hup1 = new Headsup("David Rubio Vallejo", 20, 20);
  TPaddle = new TopPaddle(width/4, 80, #00FF00);
  //creates bottom header and paddle
  hup2 = new Headsup("Player 2", 220, 540 );
  BottomPaddle = new Paddle(width/4, height*.85, #FF0000);
  //creates a new ball object  
  ball = new Ball();
}


void draw() {
  //background color set to black
  background(0);
  //if both players still have balls left, proceed
  if ( hup1.round > 0 && hup2.round > 0){
    //update ball and both paddles
    ball.update();
    TPaddle.update();
    BottomPaddle.update();
    //draw the ball, both headers, and both paddles
    ball.draw();
    hup1.draw();
    hup2.draw();
    TPaddle.draw();
    BottomPaddle.draw();
  }
  //if one of the players doesn't have balls left, it's game over for them
  else{
    TPaddle.draw();
    hup1.draw();
    BottomPaddle.draw();
    hup2.draw();
    //print game over message
    text("GAME OVER", 120, 300);
    //If player 1 lost all balls, player 2 won
    if( hup1.round == 0){
      text(hup2.name + " wins", 120, 320);
    }
    //Otherwise player 1 won
    else {
      text(hup1.name + " wins", 120, 320);
    }
  }
  
}
