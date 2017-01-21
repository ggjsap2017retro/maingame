Enemy boss;

PImage[] img;
int cell=2;
int number=0;
int x,y;

void setup(){
 size(1200,800);
 boss=new Enemy(150,200,100,3);
 img=new PImage[cell];
 for(int i=1;i<=img.length;i++){
   img[i-1]=loadImage("change"+i+".png");
 }
 frameRate(10);
}

void draw(){
   background(0);
   number++;
   number=number%cell;
   boss.move();
   boss.display();
}

class Enemy{
  float x,y,diameter;
  float speed;
  int direction=5;
  Enemy(float xpos,float ypos,float dia,float sp){
    x=xpos;
    y=ypos;
    diameter=dia;
    speed=sp;
  }
  
  void display(){
   image(img[number],x,y);
  }
  void move(){
    x+=(speed*direction);
    if((x>(width-x/2))||(x<x/2)){
      direction*=-1;
    }
  }
}