// Hero hero;

// void setup(){
// hero= new Hero();
//  size(1024,768);
// hero.setup();
// }
// void draw(){
// background(255);
// hero.draw();
// }
//
// void keyRressed(){
// hero.keyPressed();
// }

class Hero implements Entity{
  boolean _leftKey,_rightKey,_panchKey,w,_kickKey,_jumpKey,lr=true;
  boolean _enableToJumped = false;

  Animation _animationRun;
  Animation _animationPanch;
  Animation _animationKick;
  int _animationCounter;

  Hero(){
    _animationRun   = new Animation("player_run", 4);
    _animationPanch = new Animation("player_panch", 2);
    _animationKick  = new Animation("player_kick", 2);
    _animationCounter = 0;
  }

  private int _hitPoint = 50;

  int hitPoint(){return _hitPoint;}

  void setup(){
  }

  private Stage _stage;
  void setStage(Stage s){
    _stage = s;
  };

  float _fy = 0.1, _vy = 0;

  void update(){
    if(_stage.fieldTileType((int)((_x+8)/16.0), (int)((_y+8.0+8.0)/16.0)) != TileType.Block){
      _enableToJumped = false;
      _vy += 0.1;
    }else{
      _enableToJumped = true;
      _vy = 0; 
    }

    if(_rightKey==true){
      if(_stage.fieldTileType((int)((_x+16.0)/16), (int)(_y+8)/16) != TileType.Block){
        _x+=2;
      }
    }
    if(_leftKey==true){
      if(_stage.fieldTileType((int)((_x)/16), (int)(_y+8)/16) != TileType.Block){
        _x-=2;
      }
    }
    if(_panchKey==true){
      // if(lr==true){
      //   image(hito4,_x,313);
      // }else if(lr == false){
      //   image(hito5,_x,313);
      // }
    }


    if(_jumpKey && _enableToJumped){
      if(_stage.fieldTileType((int)(_x/16), (int)(_y-16)/16) != TileType.Block){
        _vy -= 3;
      }else{
        _vy = 0;
      }
    }
    _y+=_vy;
    // else if(w==true){
    //   // if(lr==true){
    //   //   image(hito6,_x,463);
    //   // }else if(lr == false){
    //   //   image(hito7,_x,463);
    //   // }
    // }else if(_kickKey==true){
    //   if(lr==true){
    //     image(hito8,_x,463);
    //   }else if(lr == false){
    //     image(hito9,_x,463);
    //   }
    // }else if(_jumpKey==true){
    //   if(lr==true){
    //     image(hito10,_x,_y);
    //   }else if(lr == false){
    //     image(hito11,_x,_y);
    //   }
    // }
    // else { 
    //   image(hito1,_x,463);
    // }
  }

  boolean shouldDie(){return false;}

  int width(){return 16;}
  int height(){return 16;};

  private float _x = 0, _y = 16*5;

  float x(){return _x;}
  float y(){return _y;}

  EntityTypes type(){return EntityTypes.Hero;}
  void callCollidingEvent(EntityTypes type){
    if(type == EntityTypes.Enemy){
      _hitPoint -= 1;
    }
  };

  void draw() {
    
    if(_rightKey || _leftKey){
      _animationCounter += 1;
    }

    if(_leftKey){
      pushMatrix();
      scale(-1, 1);
      _animationRun.draw((_animationCounter/4)%4);
      popMatrix();
    }else{
      _animationRun.draw((_animationCounter/4)%4);
    }

    // if(_rightKey==true){
    //   _x+=4;
    //   image(hito2,_x,463);
    // }else if(_leftKey==true){
    //   _x-=4;
    //   image(hito3,_x,463);
    // }else if(_panchKey==true){
    //   if(lr==true){
    //     image(hito4,_x,313);
    //   }else if(lr == false){
    //     image(hito5,_x,313);
    //   }
    // }
    // else if(w==true){
    //   if(lr==true){
    //     image(hito6,_x,463);
    //   }else if(lr == false){
    //     image(hito7,_x,463);
    //   }
    // }else if(_kickKey==true){
    //   if(lr==true){
    //     image(hito8,_x,463);
    //   }else if(lr == false){
    //     image(hito9,_x,463);
    //   }
    // }else if(_jumpKey==true){
    //   if(lr==true){
    //     image(hito10,_x,_y);
    //   }else if(lr == false){
    //     image(hito11,_x,_y);
    //   }
    // }
    // else { 
    //   image(hito1,_x,463);
    // }
  }

  void keyPressed(char k, int kCode) {
    if (k == CODED) {      // コード化されているキーが押された
      if (kCode == RIGHT) {    // キーコードを判定
        _rightKey=true;
      } else if (kCode == LEFT) {
        _leftKey=true;
      }
      if (kCode == DOWN) {
        _kickKey=true;
      }else if(kCode == UP){
        _jumpKey=true;
      }
    }

    if(k =='x'||k=='X'){
      _rightKey=false;
      _leftKey=false;
      _panchKey=true;
    }else if(k=='z'||k=='Z'){
      _rightKey=false;
      _leftKey=false;
      _panchKey=false;
      w=true;
    }
  }

  void keyReleased(char k, int kCode){
    if (k == CODED) {      // コード化されているキーが押された
      if (kCode == RIGHT) {    // キーコードを判定
        _rightKey=false;
      } else if (kCode == LEFT) {
        _leftKey=false;
      }
      if (kCode == DOWN) {
        _kickKey=false;
      }else if(kCode == UP){
        _jumpKey=false;
      }
    }
  }
}
