//

class Stage{
  private int _cw = 20;
  private int _ch = 15;

  Stage(int w, int h){
    _cw = w;
    _ch = h;
  };

  //
  Tile[][] field = new Tile[_ch][_cw];
  //float x = 30 ,y = 470;
  float vx = 3,vy = 0;
  boolean mouseReleased=true;
  void setup(){
    size(320, 240);
  }

  void draw(){
    init();
    background(0,255,255);
    fill(0,240,0);
    for(int y = 0; y < _ch; y++){
      for(int x = 0;x < _cw; x++){
        //for debug
        line(x*16,y*16,x*16,y*16);

        popMatrix();
        translate(x*16, y*16);
        field[y][x].draw();
        pushMatrix();
      }
    }
  }

  public void init(){
    for(int y = 0; y < _ch; y++){
      for(int x = 0;x<_cw;x++){
        if(y == _ch-3){
          field[y][x] = new Tile(TileType.Block);
        }else{
          field[y][x] = new Tile(TileType.Empty);
        }
      }
    }
  }

}

