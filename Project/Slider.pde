//  Mia

class Slider{
  float x, y, width, height, linewidth, lineheight;
  float rx, ry;
  float number;
  color barColor, sliderColor;
  
  Slider(int x, int y, color barColor, color sliderColor){
    this.barColor = barColor; 
    this.sliderColor = sliderColor;
    this.x = x; 
    this.y = y;
    this.rx = this.x-9;
    this.ry = this.y;
    width = 20;
    height = 4;
    linewidth = 2;
    lineheight = 800;
    this.number = ((this.ry-this.y)/8)+1;
  }
  
  void draw(){
    fill(barColor);
    rect(x, y, linewidth, lineheight);
    rect(x-5, y, 12, 2);
    //text("", x, y);                     // uncomment and modify if we need labels
    rect(x-5, y+800, 12, 2);
    //text("", x , y + height);           // uncomment and modify if we need labels
    
    stroke(255);
    fill(sliderColor);
    rect(rx, ry, width, height);
    
    this.number = ((this.ry-this.y)/8)+1;
  }
  
  void move(){
    if (mousePressed && mouseX>=x-10 && mouseX<=x+width){
      ry=mouseY;
      if (ry<=y) ry=y;      
      else if (ry>=y+lineheight-height - 4) ry=y+lineheight-height - 4; 
    }
  }
  
  float getNumber(){
    return number;
  }
  
  float ry(){
    return ry;
  }
  
  float x(){
    return x;
  }
  
  float y(){
    return y;
  }
  
  float height(){
    return height;
  }
  
  float width(){
    return width;
  } 
}
