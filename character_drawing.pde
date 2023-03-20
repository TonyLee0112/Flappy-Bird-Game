// float a = 400, b = 150, s = 150;
//void setup(){
//  size(800,500);
//  angry_bird();
  
//}
void angry_bird(float a, float b, float s){
  
  fill(255,0,0);
  strokeWeight(2);
  ellipse(a-s/7.5,b-s/2+s/75,s/3,s/7.5);
  ellipse(a-s/30,b-s/2+s/75,s/7.5,s/3);
  
  fill(0,0,0);
  quad(a-s/2-s/7.5,b-s/15, a-s/2-s/7.5,b+s/30, a-s/2+s/50, b+s/50, a-s/2+s/30, b-s/18.75);
  quad(a-s/1.875,b-s/6.52, a-s/2.14,b-s/18.75, a-s/2,b-s/50, a-s/1.76, b-s/8.33);
  quad(a-s/1.76,b+s/11.5, a-s/2,b-s/50, a-s/2.14,b+s/50, a-s/1.875, b+s/8.33);
  
  fill(255,0,0);
  circle(a,b,s);
  strokeWeight(1);
  
  fill(255,255,255);
  circle(a+s/15,b,s/4);
  circle(a+s/3.2,b,s/4);
  
  fill(0);
  circle(a+s/10,b,s/10);
  circle(a+s/3.4,b,s/10);
  
  fill(255,255,0);
  triangle(a+s/30,b+s/5,a+s/2.7,b+s/4.6,a+s/5.35,b+s/18.75);
  triangle(a+s/30,b+s/5,a+s/3.33,b+s/4.68,a+s/5.35,b+s/3.33);
  
  fill(0,0,0);
  quad(a-s/25,b-s/4, a+s/4.7,b-s/10, a+s/5.55,b-s/30, a-s/11.5,b-s/6);
  quad(a+s/6,b-s/10, a+s/2.2,b-s/4.05, a+s/2,b-s/6, a+s/5,b-s/30);
}

  
