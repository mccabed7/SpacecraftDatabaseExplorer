// Mia

class YearBarChart{
  int numberOfYears;
  int heightOfBar;
  float widthOfBar = 1;
  int xPos, yPos, freqLineRightXpos, freqLineBottomYpos;
  int year;
  ArrayList years = new ArrayList();
  ArrayList<Widget> bars = new ArrayList<Widget>();
  float scale, countXpos, countYpos, widthOfLongestBar, tempWidthOfBar;
  int highestCount, highestCountYear;
  int currentCount;
  color barColor, textColor;
  
  YearBarChart(int xPos, int lowestYear, int highestYear, color barColor, color textColor){
    this.barColor = barColor;
    this.textColor = textColor;
    
    numberOfYears = highestYear-lowestYear+1;
    
    for (int i=lowestYear; i<=highestYear; i++){
        years.add(i);
    }
    
    this.year = lowestYear;        
    
    this.heightOfBar = 800/(2*numberOfYears+1);
    this.yPos = xPos+heightOfBar;
    this.xPos = xPos;
    this.freqLineRightXpos = xPos + 850;
    this.freqLineBottomYpos = 850;
    this.countYpos = freqLineBottomYpos+20;
    
    tempWidthOfBar=1;    
    
    currentCount=0;
    highestCount=0;
    for(int i=0; i<years.size(); i++){
      currentCount=getYearCount((int)years.get(i));
      if(highestCount<currentCount) {
        highestCount=currentCount;
        highestCountYear = (int)years.get(i);
      }
    }  
    
    this.scale = 800*1.0/highestCount; 
  }
  
  void draw(){
    widthOfLongestBar = scale * getYearCount(highestCountYear);
    countXpos = xPos + widthOfLongestBar; 
    
    stroke(255);
    fill(textColor);
    text(highestCount, countXpos-10, countYpos-30);
    line(countXpos, freqLineBottomYpos-5, countXpos, freqLineBottomYpos+5);
    
    
    int shift = 3;
    boolean alternate = false;
    boolean visible = true;
    if (highestCount>=1000)  alternate = true;
    
    for(int i=0; i<highestCount; i+=100){
      if (alternate && !visible){
        visible = true;
      }
      else{
        text(i, (i*scale)-shift+xPos, countYpos);
        visible = false;
      }
      line(i*scale+xPos, freqLineBottomYpos-5, i*scale+xPos, freqLineBottomYpos+5);
      if (i>=0 && i<900){
        shift = 10;
      }
      else {
        shift = 20;
      }          
    }
    
    line(xPos, xPos, xPos, freqLineBottomYpos);  // length 800
    line(xPos, freqLineBottomYpos, freqLineRightXpos, freqLineBottomYpos); 
    text("Years", xPos, 40);
    text("Frequency",freqLineRightXpos + 10, freqLineBottomYpos + 5);
    
    for(int i=years.size()-1; i>=0; i--){
      widthOfBar = scale * getYearCount((int)years.get(i));
      stroke(textColor);
      fill(barColor);
      if (tempWidthOfBar>=widthOfBar){                                          // no animation after wipe animation is finished
        rect(50, yPos, widthOfBar, heightOfBar);
        fill(textColor);
        text(year + i, 55 + widthOfBar, yPos + heightOfBar / 2 + 5);
      }
      else{                                                                     // wiping animation
        rect(50, yPos, tempWidthOfBar, heightOfBar);
        fill(textColor);
        text(year + i, 55 + tempWidthOfBar, yPos + heightOfBar / 2 + 5);
      }
      yPos+=heightOfBar*2;  
      tempWidthOfBar+=0.3;
    }
    yPos = 50+heightOfBar;
  }
  
  void reset(){
    tempWidthOfBar = 1;
  }
  
}
