class Boss{
  Animation _boss;
  boolean _enableToJumped = false;
  float speed;
  float _x,_y;
  Boss(float xpos,float ypos,float sp){
    _x=xpos;
    _y=ypos;
    speed=sp;
    _boss=new Animation("boss_stand0",2);
  }
  
   private Stage _stage;
  void setStage(Stage s){
    _stage = s;
  };
  
  void  draw(){
    _boss.draw(0);
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
    _y+=_vy;
  }
}