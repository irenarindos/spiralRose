float r = 10;
float a = 1.95;

void setup(){
  size(800,800);
  background(1,1,1);
  smooth();
  noStroke();
  
  //Set color, factor of spiral(s)
  fill(255, 255, 255,50);
  dodraw(16);
  dodraw(17);
  dodraw(20);
  dodraw(25);
  dodraw(30);
  dodraw(35);
  fill(255, 0, 0,30);
  dodraw(18);
  fill(255, 255, 0,30);
  dodraw(26);
  fill(0, 0, 255,30);
  dodraw(32);
  fill(255, 0, 0,30);
  dodraw(31); 
}

//Generates points along a spiral
void dodraw(float factor){ 
  pushMatrix();
  translate(width/2, height/2);

  for (int i = 0; i < 2000; i+=2) {
    if(i< 140 & i%8 !=0) continue;
    float t = radians(i);
    float x = t * cos(t)* factor;
    float y = t * sin(t) *factor;

    drawTear(x, y, radians(i));
  }
    popMatrix();
}

//Draws a distored tear shape, given a point
void drawTear(float w, float h, float rad){
  pushMatrix();
  rotate(rad/4);
  beginShape();
  for(int i=0; i<360; i++)
  {
    float x = w + cos( radians(i) ) *r;
    //The exponent a controls the shape of the curve
    float y = h+ sin( radians(i) ) * pow(sin(radians(i)/2), a) *r;
    float noiseVal = noise(x*.015, y*.015);
    vertex(x*noiseVal,y*noiseVal);
  }
  endShape();
  popMatrix();
}

//Save current image
void keyPressed(){
  save("rose.jpg");  
}