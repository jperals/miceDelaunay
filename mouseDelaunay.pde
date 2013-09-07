import megamu.mesh.*;

Delaunay myDelaunay;
ArrayList<float[]> points;

void setup() {
  size(640, 480);
  points = new ArrayList<float[]>();
  /*points.add(new float[]{0, 0});
  points.add(new float[]{width - 1, 0});
  points.add(new float[]{width - 1, height - 1});
  points.add(new float[]{0, height - 1});*/
  //points.add(new float[]{width/2 - 1, height/2 - 1});
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
  println("hello");
  float[] newPoint = new float[]{mouseX, mouseY};
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

