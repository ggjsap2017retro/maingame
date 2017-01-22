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
  Bird,Dog,Boss;
}

class Enemy implements Entity{
  Animation _animation ;
  boolean _enableToJumped = false;
  float _x,_y;
  float speed;
  int direction=-1;
  EnemyType _enemytype;
  Enemy(float xpos,float ypos, float sp,EnemyType t){
    x=xpos;
    y=ypos;
    speed=sp;
    _enemytype=t;
    
    if(_enemytype==EnemyType.Brid){
      x=100;
    }else if(_enemytype==EnemyType.Dog){
      _animation = new Animation("Dog",2);
      speed=0.5;
    }else if(_enemytype==EnemyType.Boss){
      _animation=new Animation("boss_stand0",2);
      speed=1;
    }
    
    _fly=new Animation("Bird",2);
    _dwalk=new Animation("Dog",2);
  }
  
  void draw(){
    _animation.draw(0);
  }
  
  float _fy = 0.1, _vy = 0;

  void update(){
    
    if(_stage.fieldTileType((int)((_x+8)/16.0), (int)((_y+8.0+8.0)/16.0)) != TileType.Block){
      _enableToJumped = false;
      _vy += 0.3;
    }else{
      _enableToJumped = true;
      _vy = 0; 
    }
    _x+=(speed*direction);
    if(_y>(20*16)){
      direction*=-1;
    }
    if(_enemytype==EnemyType.Dog){
    _y+=_vy;
    }
  }

  boolean shouldDie(){return _shouldDie;}
  int width(){return 16;}
  int height(){return 16;};
  float x(){return _x;}
  float y(){return _y;}
  EntityTypes type(){return EntityTypes.Enemy;}
  //TODO
  void callCollidingEvent(EntityTypes type){};
}
