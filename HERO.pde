Hero hero;

void setup(){
hero= new Hero();
 size(1024,768);
hero.setup();
}
void draw(){
background(255);
hero.draw();
}

void keyRressed(){
hero.keyPressed();
}

class Hero{PImage hito1,hito2,hito3,hito4,hito5,hito6,hito7,hito8,hito9,hito10,hito11;
int x=0,y=313;
boolean s,h,p,w,u,j,lr=true;
void setup(){
  
 
  hito1 = loadImage("立ち絵.png");
  hito2 = loadImage("歩き.png");
  hito3 = loadImage("R歩き.png");
  hito4 = loadImage("パンチ.png");
  hito5 = loadImage("Rパンチ.png");
  hito6 = loadImage("波.png");
  hito7 = loadImage("R波.png");
  hito8 = loadImage("下段.png");
  hito9 = loadImage("R下段.png");
  hito10 = loadImage("跳.png");
  hito11 = loadImage("R跳.png");
}
void draw() {
  
  if(h==true){
     x+=4;
  image(hito2,x,463);
}else if(s==true){
     x-=4;
  image(hito3,x,463);
}else if(p==true){
  if(lr==true){
  image(hito4,x,313);
}else if(lr == false){
    image(hito5,x,313);
  }
}
  else if(w==true){
  if(lr==true){
  image(hito6,x,463);
      }else if(lr == false){
        image(hito7,x,463);
      }
    }else if(u==true){
  if(lr==true){
  image(hito8,x,463);
      }else if(lr == false){
        image(hito9,x,463);
      }
    }else if(j==true){
  if(lr==true){
  image(hito10,x,y);
      }else if(lr == false){
        image(hito11,x,y);
      }
    }
    else { 
     image(hito1,x,463);
  }
}

void keyPressed( ) {
  if (key == CODED) {      // コード化されているキーが押された
    if (keyCode == RIGHT) {    // キーコードを判定
       s=false;
       p=false;
       h=true;
      lr=true;
    } else if (keyCode == LEFT) {
      h=false;
      p=false;
      s=true;
      lr=false;
    }else if (keyCode == DOWN) {
      u=true;
      h=false;
      s=false;
      p=false;
      w=false;
    }else if(keyCode == UP){
      h=false;
      s=false;
      p=false;
      w=false;
      u=false;
      j=true;
    }
  }
  if(key =='x'||key=='X'){
    h=false;
    s=false;
    p=true;
  }else if(key=='z'||key=='Z'){
    h=false;
    s=false;
    p=false;
    w=true;
  }
}
void keyReleased(){
h=false;
s=false;
p=false;
w=false;
u=false;
j=false;
}
}