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

enum EnemyType{
  Brid,Dog;
}

class Enemy{
  Animation _fly;
  Animation _dwalk;
  float x,y;
  float speed;
  int direction=1;
  EnemyType _enemytype;
  Enemy(float xpos,float ypos, float sp,EnemyType t){
    x=xpos;
    y=ypos;
    speed=sp;
    _enemytype=t;
    
    if(_enemytype==EnemyType.Brid){
      x=100;
    }else if(_enemytype==EnemyType.Dog){
      x=900;
    }
    
    _fly=new Animation("Bird",2);
    _dwalk=new Animation("Dog",2);
  }
  
  void draw(){
    _fly.draw(1);
    pushMatrix();
    translate(x,y+30);
    _fly.draw(1);
    popMatrix();
    
    _dwalk.draw(1);
    pushMatrix();
    translate(x,y+75);
    _dwalk.draw(1);
    popMatrix();
  }
  void move(){
    x+=(speed*direction);
    if((x>(width-x))||(x<x/2)){
      direction*=-1;
    }
  }
}