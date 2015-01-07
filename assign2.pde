// global variables
float frogX, frogY, frogW, frogH, frogInitX, frogInitY;
float leftCar1X, leftCar1Y, leftCar1W, leftCar1H;//car1
float leftCar2X, leftCar2Y, leftCar2W, leftCar2H;//car2
float rightCar1X, rightCar1Y, rightCar1W, rightCar1H;//car3
float rightCar2X, rightCar2Y, rightCar2W, rightCar2H;//car4
float pondY;
float speedA;
float speedB;
float speedC;
float speedD;

boolean alive=true;
int life;
final int GAME_START = 1;
final int GAME_WIN = 2;
final int GAME_LOSE = 3;
final int GAME_RUN = 4;
final int FROG_DIE = 5;
int gameState;
int interval=0;//use millis() to record current time
int currentTime=0;


// Sprites
PImage imgFrog, imgDeadFrog;
PImage imgLeftCar1, imgLeftCar2;
PImage imgRightCar1, imgRightCar2;
PImage imgWinFrog, imgLoseFrog;

void setup(){
  size(640,480);
  textFont(createFont("font/Square_One.ttf", 20));
  // initial state
  gameState = GAME_START;
  
  speedA = 10;
  speedB = 8;
  speedC = 6; 
  speedD = 12;
  
  // the Y position of Pond
  pondY = 32;
  
  // initial position of frog
  frogInitX = 304;
  frogInitY = 448;
  
  frogW = 32;
  frogH = 32;
  
  leftCar1W=leftCar2W=rightCar1W=rightCar2W = 32;//all cars' width 
  leftCar1H=leftCar2H=rightCar1H=rightCar2H = 32;//all cars' height
  leftCar1X = leftCar2X = 0; //position X of car1,2
  rightCar1X = rightCar2X =640;//position X of car3,4
  
  leftCar1Y = 128;//position Y of car1
  rightCar1Y =192;//position Y of car2
  leftCar2Y  =256;//position Y of car3
  rightCar2Y =320;//position Y of car4
  
  imgFrog = loadImage("data/frog.png");
  imgDeadFrog = loadImage("data/deadFrog.png");
  imgLeftCar1 = loadImage("data/LCar1.png");//img of car1
  imgLeftCar2 = loadImage("data/LCar2.png");//img of car2
  imgRightCar1 = loadImage("data/RCar1.png");//img of car3
  imgRightCar2 = loadImage("data/RCar2.png");//img of car4
  imgWinFrog = loadImage("data/win.png");
  imgLoseFrog = loadImage("data/lose.png");
}

void draw(){
  switch (gameState){
    case GAME_START:
        background(10,110,16);
        text("Press Enter", width/3, height/2);    
        break;
        
    case FROG_DIE:
        if(millis()-currentTime>=1000){
        frogX=frogInitX;
        frogY=frogInitY;
        gameState=GAME_RUN;
        }
        break;
        
    case GAME_RUN:
        background(10,110,16);
        //gameState 
        fill(4,13,78);
        rect(0,32,640,32);

        // show frog live
        for(int i=0;i<life;i++){
           image(imgFrog,64+i*48 ,32);
         }
        // draw frog
        image(imgFrog, frogX, frogY);

         //car1 move
         leftCar1X += speedA;
         if (leftCar1X > width){
             leftCar1X = 0;
         }
         image(imgLeftCar1, leftCar1X, leftCar1Y);
  
         //car2 move
         leftCar2X += speedB;
         if (leftCar2X > width){
             leftCar2X = 0;
         }
         image(imgLeftCar2, leftCar2X, leftCar2Y);

        
         //car3 move
         rightCar1X -= speedC;
         if (rightCar1X < 0 ){
             rightCar1X = width;
         }    
         image(imgRightCar1, rightCar1X, rightCar1Y);

         //car4 move
         rightCar2X -= speedD;
         if (rightCar2X < 0){
             rightCar2X = width;
         }    
         image(imgRightCar2, rightCar2X, rightCar2Y);
  
         float frogCX = frogX+frogW/2;
         float frogCY = frogY+frogH/2;
         
//leftCar1Y = 128; position Y of car1
//rightCar1Y =192; position Y of car2
//leftCar2Y  =256; position Y of car3
//rightCar2Y =320; position Y of car4
       
         // car1 hitTest
           if(frogCX>leftCar1X && frogCX<leftCar1X+48 && frogCY>leftCar1Y && frogCY<leftCar1Y+48)
           {
             currentTime = millis();
             image(imgDeadFrog, frogX, frogY);
             life--;
             gameState = FROG_DIE;
           }             
         // car2 hitTest
           if(frogCX>rightCar1X && frogCX<rightCar1X+48 && frogCY>rightCar1Y && frogCY<rightCar1Y+48)
           {
               currentTime = millis();
               image(imgDeadFrog, frogX, frogY);
               life--;
               gameState = FROG_DIE;
           }             
           // car3 hitTest
           if(frogCX>leftCar2X && frogCX<leftCar2X+48 && frogCY>leftCar2Y && frogCY<leftCar2Y+48)
           {
               currentTime = millis();
               image(imgDeadFrog, frogX, frogY);
               life--;
               gameState = FROG_DIE;
           }             
           // car4 hitTest
                if(frogCX>rightCar2X && frogCX<rightCar2X+48 && frogCY>rightCar2Y && frogCY<rightCar2Y+48)
                {
               currentTime = millis();
               image(imgDeadFrog, frogX, frogY);
               life--;
               gameState = FROG_DIE;
           }             
           
           break;
                 
    case GAME_WIN:
        background(0);
        image(imgWinFrog,207,164);
        fill(255);
        text("You Win !!",240,height/4);           
         break;
        
    case GAME_LOSE:
        background(0);
        image(imgLoseFrog,189,160);
        fill(255);
        text("You Lose",240,height/4);          
        break;
    }
  }


// initial position of frog
//frogInitX = 304
//frogInitY = 448

        //frog move
        boolean up;
        boolean down;
        boolean left;
        boolean right;

void keyPressed() {
      if (key == CODED || gameState == GAME_RUN ) {
       switch( keyCode ){
       
        case UP:
          frogY -= 32;
          if(frogY<=0){
            frogY=0;
          }
          break;
          
        case DOWN:
          frogY += 32;
          if(frogY>frogInitY){
            frogY=frogInitY;
          }
          break;
        case LEFT:
          frogX -= 32;
          if(frogX<0){
            frogX=0;
          }
          break;
          
        case RIGHT:
          frogX += 32;
          if(frogX>width-32){
            frogX=width-32;
          }          
          break;
    }}
     
    if(key==ENTER || gameState == GAME_WIN || gameState ==  GAME_LOSE || gameState ==  GAME_START ){
      gameState = GAME_RUN;
      life=3;
      frogX = frogInitX;
      frogY = frogInitY;
    }
    
         // win
         // pondY = 32
           
        if (frogY == 32){
        gameState = GAME_WIN;   
         }
                 
         // lose
         // life = 3
         
         if (life == 0){
         gameState = GAME_LOSE;
         }  
  }
