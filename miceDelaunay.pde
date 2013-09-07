import oscP5.*;
import netP5.*;

import megamu.mesh.*;

OscP5 oscP5;
NetAddress theOther;

Delaunay myDelaunay;
ArrayList<float[]> points;

void setup() {
  size(640, 480);

  oscP5 = new OscP5(this, MY_PORT);
  theOther = new NetAddress(OTHER_IP, OTHER_PORT);

  points = new ArrayList<float[]>();
  float[][] pointsArray = pointsArrayListToPointsArray(points);
  myDelaunay = new Delaunay( pointsArray );
  stroke(255,0,0);
}

void draw() {
  float[][] myEdges = myDelaunay.getEdges();
  for(int i=0; i<myEdges.length; i++) {
    float startX = myEdges[i][0];
    float startY = myEdges[i][1];
    float endX = myEdges[i][2];
    float endY = myEdges[i][3];
    line( startX, startY, endX, endY );
  }
}

void mousePressed() {
  OscMessage msg = new OscMessage("/mousePosition");
  msg.add(mouseX);
  msg.add(mouseY);
  oscP5.send(msg, theOther);
  addPointToDelaunay(myDelaunay, mouseX, mouseY);
}

void oscEvent(OscMessage msg) {
  if (msg.checkAddrPattern("/mousePosition")) {
    int x = msg.get(0).intValue();  
    int y = msg.get(1).intValue();
    addPointToDelaunay(myDelaunay, float(x), float(y));
  }
}

void addPointToDelaunay(Delaunay delaunay, float x, float y) {
  float[] newPoint = new float[]{x, y};
  points.add(newPoint);
  float[][] pointsArray = pointsArrayListToPointsArray(points);
  println(pointsArray.toString());
  myDelaunay = new Delaunay( pointsArray );
}

float[][] pointsArrayListToPointsArray(ArrayList<float[]> pointsList) {
  float[][] pointsArray = new float[pointsList.size()][2];
  for(int i = 0; i < pointsList.size(); i++) {
    pointsArray[i] = pointsList.get(i);
  }
  return pointsArray;
}

