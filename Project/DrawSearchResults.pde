//Method "drawSearchedObjects()" written by Declan to draw searched data
//NOTE: This method is now obsolete!  Do not use.  Use drawSortedData(); instead.
public void drawSearchedObjects(float scrollPosition){
  float scrollOffset = scrollPosition/100;
  int margin = 50;
  int itemDistance = 13;
  //int displaySize = SCREENHEIGHT - (2 * margin);
  float listLength = searchedObjects.size() * itemDistance;
  
  fill (COLOR_ISABELLINE);
  if(searchedObjects.size() != 0){
    for(int i = 0; i < searchedObjects.size(); i++){
    float lineY = margin + (itemDistance*i) - (scrollOffset * listLength);// + 190;//include scrollOffset somewhere here
    text(searchedObjects.get(i).name, 20, lineY); 
    text(searchedObjects.get(i).launchYear + searchedObjects.get(i).launchMonth + searchedObjects.get(i).launchDay, 210, lineY);
    text(searchedObjects.get(i).state, 310, lineY);
    text(searchedObjects.get(i).mass, 350, lineY);
    text(searchedObjects.get(i).diameter, 400, lineY);
    text(searchedObjects.get(i).perigee, 500, lineY);
    text(searchedObjects.get(i).apogee, 590, lineY);
  }
  }
  
}
