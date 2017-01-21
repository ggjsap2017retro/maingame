/*void setup(){
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
   image(img,x,y);
}*/

class Enemy{
  Animation _fly;
  float x,y,diameter;
  float speed;
  int direction=1;
  Enemy(float xpos,float ypos,float dia,float sp){
    x=xpos;
    y=ypos;
    diameter=dia;
    speed=sp;
    _fly=new Animation("Bird",2);
  }
  
  void draw(){
    _fly.draw(1);
    pushMatrix();
    translate(x,y);
    _fly.draw(1);
    popMatrix();
  }
  void move(){
    x+=(speed*direction);
    if((x>(width-x/2))||(x<x/2)){
      direction*=-1;
    }
  }
}