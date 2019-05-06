int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  
  // constructor
  Visualizer(float x, float y, int bars) {
    this.x = x;
    this.y = y;
    values = new float[bars];
    speeds = new float[bars];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, 400, 200);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+100, x+400, y+100);

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    for (int i = 0; i < values.length; i++) {
     //SOMETHING FUNNN
     //fill(abs(values[i])/MAX_VALUE*255,255-(abs(values[i])/MAX_VALUE*255),0);
      if (values[i] > 50) {
        fill(0,255,0);
      } else if (values[i] > 0) {
        fill(255,255,0);
      } else if (values[i] > -50) {
        fill(255,200,0); // experiment with orange
      } else {
        fill(255,0,0);
      }
      rect(x+(400 / values.length)*i,y+MAX_VALUE,400/values.length,-values[i]);
    }


    //Width of the visualizer is 400!

  
  }
  void update() {
    //???WRITE THIS METHOD!!!
    for (int i = 0; i < values.length; i++) {
      //fill(values[i],255-values[i],0);
      values[i] += speeds[i];
      //??? keep them values between max/min value
      if (values[i] > MAX_VALUE || values[i] < MIN_VALUE) {
        speeds[i] *= -1;
      }
      //??? reverse the speeds so they oscillate up/down when they reach max/min

      
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20, 40);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
