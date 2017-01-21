enum EnemyType{
  Bird,Dog;
}

class Enemy implements Entity{
  Animation _animation ;
  float _x,_y;
  float speed;
  int direction=1;
  EnemyType _enemytype;
  boolean _shouldDie;
  Enemy(float xpos,float ypos,EnemyType t){
    _x=xpos;
    _y=ypos;
    _enemytype=t;
    
    _shouldDie = false;
    if(_enemytype==EnemyType.Bird){ 
      _animation = new Animation("Bird",2);
      speed=1;
    }else if(_enemytype==EnemyType.Dog){
      _animation = new Animation("Dog",2);
      speed=0.5;
    }
    
  }

  private Stage _stage;
  void setStage(Stage s){
    _stage = s;
  };
  
  void draw(){
    pushMatrix();
    translate(_x,_y);
    _animation.draw(1);
    popMatrix();
  }

  void update(){
    _x+=(speed*direction);
    if((_x>(20*16-_x))||(_x<_x/2)){
      direction*=-1;
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
