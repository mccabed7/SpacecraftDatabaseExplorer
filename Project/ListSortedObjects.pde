//Method "drawSortedData()" written by Declan to draw the list of objects, and their corresponding data.
public void drawSortedData(ArrayList<spaceObject> objectList, float scrollPosition){
  float scrollOffset = (scrollPosition - 1)/99;
  int margin = 50;
  int itemDistance = 13;
  int displaySize = SCREENHEIGHT - (2 * margin);
  float listLength = objectList.size() * itemDistance;
  
  fill (COLOR_ISABELLINE);
  for(int i = 0; i < objectList.size(); i++){
    float lineY =  itemDistance + margin + (itemDistance*i) - ((scrollOffset) * listLength);// + yStartOffset;//include scrollOffset somewhere here
    //if(i == 0) println("scrollPosition = " + scrollPosition + " scrollOffset = " + scrollOffset);
    if(lineY > 0 && lineY <= SCREENHEIGHT + 10)
    {
    text(objectList.get(i).name, 20, lineY); 
    text(objectList.get(i).launchYear + objectList.get(i).launchMonth + objectList.get(i).launchDay, 212, lineY);
    text(objectList.get(i).state, 350, lineY);
    text(objectList.get(i).mass, 425, lineY);
    text(objectList.get(i).diameter, 495, lineY);
    text(objectList.get(i).perigee, 595, lineY);
    text(objectList.get(i).apogee, 675, lineY);
    }
    
  }
  
  fill(COLOR_XIKETIC);
  stroke(COLOR_ISABELLINE);
  rect(-1,-1,SCREENWIDTH+1, margin);
  rect(-1,margin+displaySize+3,SCREENWIDTH+1, margin);
  fill(COLOR_ISABELLINE);

}
