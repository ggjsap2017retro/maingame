class Point {
  int x1;
  int y1;

  Point(int ix, int iy) {
    x1=ix;
    y1=iy;
  }
}

// PImage[] img, imgE;
//
// Point[] player=new Point[4];
// Point[] enemy=new Point[4];
//
// int cell=2;
// int cellE=2;
// int number=0;
// int speed=10;
// int x=0;
// int y=0;
// int change=0;
// int changeE=0;
// boolean atari=false;

// void setup() {
//   size(1024, 768);
//
//   player[0]=new Point(0, 0);
//   player[1]=new Point(0, 500);
//   player[2]=new Point(500, 0);
//   player[3]=new Point(500, 500);
//
//   enemy[0]=new Point(700, 0);
//   enemy[1]=new Point(700, 417);
//   enemy[2]=new Point(1000, 0);
//   enemy[3]=new Point(1000, 417);
//
//   img = new PImage[cell];
//   imgE=new PImage[cellE];
//   for (int i=0; i<img.length; i++) {
//     img[i]=loadImage(i+".png");
//   }
//   for (int j=0; j<imgE.length; j++) {
//     imgE[j]=loadImage("E"+j+".png");
//   }
//   frameRate(30);
// }
//
// void draw() {
//   background(255);
//   image(imgE[changeE], 700, 0);
//   image(img[change], x, y);
//   boolean r1=isCollisionSide(player[2], player[3], enemy[0], enemy[1]);
//   boolean r2=isCollisionSide(enemy[0], enemy[1], player[2], player[3]);
//   boolean r3=isCollisionSide(enemy[0], enemy[1], player[0], player[1]);
//   boolean r4=isCollisionSide(player[0], player[1], enemy[0], enemy[1]);
//   player[0]=new Point(0+x, 0);
//   player[1]=new Point(0+x, 500);
//   player[2]=new Point(500+x, 0);
//   player[3]=new Point(500+x, 500);
//   if ( r1 == true && r2 == true ) {
//     changeE=1;
//   } else if (r3==true&&r4==true) {
//     changeE=0;
//   }
// }
//
// void keyPressed() {
//   if (key == CODED) {
//     if (keyCode == RIGHT) {
//       x+=speed;
//       change=0;
//     }
//     if (keyCode == LEFT) {
//       x-=speed;
//       change=0;
//     }
//     if (keyCode == UP) {
//       change=1;
//     }
//   }
// }
//
// boolean isCollisionSide(Point r1, Point r2, Point p1, Point p2) {
//   float t1, t2;
//
//   t1 = (r1.x1-r2.x1)*(p1.y1-r1.y1)+(r1.y1-r2.y1)*(r1.x1-p1.x1);
//   t2 = (r1.x1-r2.x1)*(p2.y1-r1.y1)+(r1.y1-r2.y1)*(r1.x1-p2.x1);
//
//   if (t1*t2<0||t1>=0||t2>=0) {
//     return(true);
//   } else {
//     return(false);
//   }
// }
//
// void Punch() {
// }
//
// void Kick() {
// }
//
// void Wave() {
// }
