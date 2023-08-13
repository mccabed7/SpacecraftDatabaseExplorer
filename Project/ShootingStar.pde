//Class "ShootingStar" written by Declan which draws a small star moving back and forth across the screen randomly.
import java.util.Random;

class ShootingStar{
  float xPos, yPos;
  float xDir, yDir;
  Random randomGenerator = new Random();
  ShootingStar(int startX, int startY, int startDir){
    xPos = startX;
    yPos = startY;
    xDir = startDir;
    yDir = randomGenerator.nextFloat(-2.2, 2.2);
  }
  
  void move(){
    if(xPos < -50 || xPos > SCREENWIDTH + 50){
      yPos = randomGenerator.nextInt(100, SCREENHEIGHT -100);
      xDir *= -1;
      yDir = randomGenerator.nextFloat(-1.5, 1.5);
    }
    yPos += yDir;
    xPos += xDir;
  }
  
  void draw(){
    fill(COLOR_ISABELLINE);
    circle(xPos,yPos,7);
  }
}
