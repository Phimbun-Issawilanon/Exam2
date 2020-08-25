public class Ball{
  float position_x,  position_y;
  float size;
  float area;
  
  Ball(float pos_x,float pos_y){
    position_x = pos_x;
    position_y = pos_y;
    size = random(10,100);
  }

  void draw(){
    circle(position_x,position_y,size);
  }
  
  float get_area(){
    area = 3.14*pow((size/2),2);
    return area;
  }
}

public class Block{
  float position_x,  position_y;
  float size;
  float area;
  
  Block(float pos_x,float pos_y,float size){
    this.position_x = pos_x;
    this.position_y = pos_y;
    this.size = size;
  }

  void draw(){
    rect(this.position_x, this.position_y, this.size, this.size);
  }
  
  float get_area(){
    area = pow(this.size, 2);
    return area;
  }
}
int n=3;
int index_block;
int index_ball;
float area_block = 0;
float area_ball = 0;
float area = 0;
int windowSize = 300;
boolean check_circle;
Block[] block = new Block[n];
Ball[] ball = new Ball[n];

void setup(){
  size(300,300);
  background(255, 255, 255);
  for(int i=0; i<n; i++){
    block[i] = new Block(random(100,windowSize-100), random(100,windowSize-100), random(10,100));
    ball[i] = new Ball(random(100,windowSize-100), random(100,windowSize-100));
  }
  for(int i=0; i<n; i++){
    ball[i].draw();
    area_ball += ball[i].get_area();
  }
  for(int i=0; i<n; i++){
    block[i].draw();
    area_block += block[i].get_area();
  }
  area = area_block+area_ball;
  println("area_block: "+area_block);
  println("area_ball: "+area_ball);
  println("Summary area: "+area);
  println("-------------------------------------------------");
}
void draw(){
  background(255,255,255);
  for(Ball ball : ball){
    ball.draw();
  }
  for(Block block : block){
    block.draw();
  }
}

void mouseClicked(){
  check_circle = true;
    delay(300);
    index_block = block.length-1;
    index_ball = ball.length-1;
    for(index_block = block.length-1;index_block>-1;index_block--){
      if(mouseX>block[index_block].position_x && mouseX< block[index_block].position_x+block[index_block].size && mouseY > block[index_block].position_y && mouseY< block[index_block].position_y+block[index_block].size){
        for(int i=index_block; i<block.length-1;i++){
          block[i] = block[i+1];
        }
        block = (Block[]) shorten(block);
        area_block = 0;
        area = 0;
        for(int i=0; i<block.length; i++){
          area_block += block[i].get_area();
        }
        area = area_block+area_ball;
        println("area_block: "+area_block);
        println("area_ball: "+area_ball);
        println("Summary area: "+area);
        println("-------------------------------------------------");
        check_circle = false; 
        break;
      }
    }
    if(check_circle == true){
      for(index_ball = ball.length-1;index_ball>-1;index_ball--){
        if(mouseX>ball[index_ball].position_x-(ball[index_ball].size/2) && mouseX< ball[index_ball].position_x+(ball[index_ball].size/2) && mouseY > ball[index_ball].position_y-(ball[index_ball].size/2) && mouseY< ball[index_ball].position_y+(ball[index_ball].size/2)){
          for(int i=index_ball; i<ball.length-1;i++){
            ball[i] = ball[i+1];
          }
          ball = (Ball[]) shorten(ball);
          area_ball = 0;
          area = 0;
          for(int i=0; i<ball.length; i++){
            area_ball += ball[i].get_area();
          }
          area = area_block+area_ball;
          println("area_block: "+area_block);
          println("area_ball: "+area_ball);
          println("Summary area: "+area);
          println("-------------------------------------------------");
          break;
        }
      }
    }
}
