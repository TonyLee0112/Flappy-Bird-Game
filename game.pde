//// PImage : datatype for storing image
//// PImage class contains fields for the width and height of the image
PImage backpic, birdpic, wallpic, welcomescreen, starpic; 
// game setup
int game, score, highscore, x, y, vertical, wallx[] = new int[2], wally[] = new int[2];
int starx = -60, stary = -60;
// game = 0,1
// score, highscore
// x : background location
// y : bird location
// vertical : bird up and down
// wallx[i], wally[i] : 2 walls
void setup(){
  // images loaded by loadImage()
  starpic = loadImage("https://raw.githubusercontent.com/TonyLee0112/Flappy-Bird-Game/main/star.png");
  backpic = loadImage("https://raw.githubusercontent.com/Gaspared/FlappyBird/main/img/back.png");
  wallpic = loadImage("https://raw.githubusercontent.com/TonyLee0112/Flappy-Bird-Game/main/wall.png");
  welcomescreen = loadImage("https://raw.githubusercontent.com/Gaspared/FlappyBird/main/img/start.png");
  game = 1; score = 0; highscore = 0; x = -200; vertical = 0;
  // backgoround size
  size(600,800);
  // text size
  fill(0,0,0);
  textSize(20);
}

// 프로그램이 멈추거나 정지함수가 호출되기 전까지 블럭안의 코드를 계속 반복 실행
void draw(){
  // game == 0 : start game
  if (game == 0){
    imageMode(CORNER);
    image(backpic, x, 0);
    image(backpic, x+backpic.width,0);
    x -= 5; // background moving speed
    
    vertical +=1; // bird falling speed
    y+= vertical; // bird falls 
    
    if (x == -1800) x = 0; // 1800 : width of the background image -> plays game infinitely 
    
    for(int i = 0; i<2; i++){
      imageMode(CENTER); // 중심을 기준으로 그리기
      image(wallpic, wallx[i], wally[i] - (wallpic.height/2+100)); // top wall
      image(wallpic, wallx[i], wally[i] + (wallpic.height/2+100)); // bottom wall
      if (wallx[i]<0){ // wall reaches the left boarder
        wally[i] = (int)random(200, height-200); // wall random height
        wallx[i] = width;
        if (i==1){
          starx = width;
          stary = wally[i];
        }
      }
      if(wallx[i] == width/2) highscore = max(++score, highscore); // wall passes the center -> score + 1
      if(y>height || y<0 || (abs(width/2-wallx[i])<20 && abs(y-wally[i])>100)) game=1; 
      // bird 높이가 height보다 크거나, 0보다 작거나, 
      // 벽 center과 새 center 사이의 거리가 x축 기준 -> 25보다 작고, y축 기준 -> 100보다 작은 경우 
      // wellcome image로 이동(game over)
      wallx[i] -= 6; // wall move to left(speed)
    }
    angry_bird(width/2, y, 30);
    text("Score "+score, 10, 20);
    starx -= 6;
    Star(starx,stary);
    if (abs(starx-width/2) < 56 && abs(stary-wally[1]) < 56){
      score += 2;
      starx = -100;
    }
}
  // game == 1 : wellcome screen
  else{
    imageMode(CENTER);
    image(welcomescreen, width/2, height/2);
    text("High Score: "+highscore, 20, 100);
    text("Click to restart", 20, 400);
  }
}
void mousePressed(){
  vertical = -15;
  if (game == 1){
    wallx[0] = 600;
    wally[0] = y = height/2;
    wallx[1] = 900;
    wally[1] = 600;
    x = game = score = 0;
  }
}
void Star(float x, float y) {
  imageMode(CENTER); 
  image(starpic,x,y);
}
      
      
      
