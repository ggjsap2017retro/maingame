//
static final int _cw = 20;
static final int _ch = 15;
//
int[][] field = new int[_ch][_cw];
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
     //println(_ch*y,_cw*x);
     line(x*16,y*16,x*16,y*16);
      if(field[y][x] == 1){
        rect(x * 16, y * 16,16,16);
      }
    }
    }
  }
  
  /*
  if(mousePressed){
    if(mouseReleased){
    pushMatrix();
    translate(x,0);
    fill(255,255,255);
    for(int i = 0; i < height; i++){
  int c = 255 * i / height;
  stroke(c);
  line(i, 0, i, width);
    }
 stroke(255);
 ellipse(x,y,30,30);
 x = mouseX;
    popMatrix();
    }
  }
 */


public void init(){
  for(int y = 0; y < _ch; y++){
      for(int x = 0;x<_cw;x++){
          if(y == _ch-3){
             field[y][x] = 1;
          }else{
            field[y][x] = 0;
      }
  }
}
}