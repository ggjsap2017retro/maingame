//

class Stage{
  private int _cw = 20;
  private int _ch = 15;

  Stage(int w, int h){
    _cw = w;
    _ch = h;
    _field = new Tile[_ch][_cw];
    init();
  };

  //
  private Tile[][] _field;

  void fieldTileType(int x, int y, TileType t){
    if(x<0 || _cw <= x || y<0 || _ch <= y){
      return;
    }
    _field[y][x].type = t;
  }

  TileType fieldTileType(int x, int y){
    if(x<0 || _cw <= x || y<0 || _ch <= y){
      return TileType.Empty;
    }
    return _field[y][x].type;
  }

  int width(){return _cw;}
  int height(){return _ch;}

  float vx = 3,vy = 0;
  boolean mouseReleased=true;
  void setup(){
  }

  void draw(){
    for(int y = 0; y < _ch; y++){
      for(int x = 0;x < _cw; x++){
        pushMatrix();
        translate(x*16, y*16);
        _field[y][x].draw();
        popMatrix();
      }
    }
  }

  public void init(){
    for(int y = 0; y < _ch; y++){
      for(int x = 0;x<_cw;x++){
          _field[y][x] = new Tile(TileType.Empty);
      }
    }
  }
}
