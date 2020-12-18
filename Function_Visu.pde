
float xo;
float yo;
float zoom;
float angle;

float fx[][] = new float[800*20][2];

void setup() {
  size(800, 600); 
  //surface.setResizable(true);
  smooth();

  xo = width/2;
  yo = height/2;
  zoom = 3;
  angle = 0;
  
  //float w = -width;
  //for(int i=0; i < 800*2; i++){
  // fx[i][0] = i;
  // fx[i][1] = funcao(w);
  // w++;
  //}
  
  
  
  
  float w = -width;
  for(int i= 0; i < 800*20; i++){
    fx[i][0] = w;
    fx[i][1] = funcao(w);
    w += 1;
  }
  
}

void draw() {
  //rotate(PI/2);
  translate(xo, yo);
  if(zoom < 0.5)
    zoom = 0.5;
  scale(zoom);
  rotate(angle);
  
  //System.out.println(zoom);
  
  background(255);

  grid();

  stroke(249, 129, 42);
  noFill();
  beginShape();
  curveVertex(fx[0][0],fx[0][1]);
  
  for(int i=0; i < width*2; i++)
    curveVertex(fx[i][0], fx[i][1]);
  
  curveVertex(fx[(800*2)-1][0],fx[(800*2)-1][1]);
  endShape();
  
  
  
  //for (float i=-width; i < width; i += 0.1)
  //  point(i, funcao(i));
    
  //fill(255, 0,0);
  //textSize(30);
  //textAlign(CENTER);
  //text("EU TE AMOOOO", 0, -20);
}

void grid() {

  fill(0);
  stroke(0);

  textSize(4);
  textAlign(LEFT, TOP);
  // VERTICAL LINES
  for (int i = -width; i < width; i += 20) {
    line(i, -height, i, height);
    text(i, i, 0);
  }
  // HORIZONTAL LINES
  for (int i = -height; i < height; i += 20) {
    line(-width, i, width, i);
    text(-i, 0, i);
  }



  //stroke(10);

  ellipse(0, 0, 5, 5);
}

float funcao(float x) {
  float y = x*x/10.0;

  return -y;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP)
      yo += 1;
    else if (keyCode == DOWN)
      yo -= 1;
    else if (keyCode == RIGHT)
      xo -= 1;
    else if (keyCode == LEFT)
      xo += 1;
  }
  if (key == ' ') {
    zoom = 3;
    xo = width/2;
    yo = height/2;
  }

  if (key == 'm')
    zoom += .1;
  if (key == 'n')
    zoom -= .1;
}

void mouseDragged() {
  xo += (mouseX - pmouseX); 

  yo += (mouseY - pmouseY);
}

public void mouseWheel(MouseEvent e) {
  zoom -= 0.1*(e.getCount());
}
