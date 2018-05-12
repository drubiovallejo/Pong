/*David Rubio Vallejo

04/15/2018

This class defines a header class
*/

class Headsup {
  //number of balls left
  int round = 3;
  //name of player
  String name;
  int x;
  int y;
  //color of the text
  int col = #FFFFFF;
  
  //constructor takes the name to display and the x and y coords where to display it
  Headsup(String name, int x, int y){
    this.name = name;
    this.x = x;
    this.y = y;      
  }
  
  // draw the game status as a "headsup" display on the gameboard
  void draw() {
    //fills the text with the chosen color
    fill(col);
    //displays name, balls left, and points information
    text(name, this.x, this.y);
    text("Balls left: " + this.round, this.x, this.y + 20);
  }
  
}
