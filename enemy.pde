enum EnemyType{
  Bird,Dog,Boss;
}

class Enemy implements Entity{
  Animation _animation ;
  boolean _enableToJumped = false;
  float _x,_y;
  float _life;
  float speed;
  int direction=-1;
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
      _life = 10;
    }else if(_enemytype==EnemyType.Dog){
      _animation = new Animation("Dog",2);
      speed=0.5;
      _life = 20;
    }else if(_enemytype==EnemyType.Boss){
      _animation=new Animation("boss_stand0",2);
      speed=1;
      _life = 100;
    }
    
  }

  private Stage _stage;
  void setStage(Stage s){
    _stage = s;
  };
  
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

    if(_life <= 0){
      _shouldDie = true;
    }
  }

  boolean shouldDie(){return _shouldDie;}
  int width(){return 16;}
  int height(){return 16;};
  float x(){return _x;}
  float y(){return _y;}
  EntityTypes type(){return EntityTypes.Enemy;}
  //TODO
  void callCollidingEvent(EntityTypes type){
    if(type == EntityTypes.Shock){
      _life -= 2;
    }
  };
}
