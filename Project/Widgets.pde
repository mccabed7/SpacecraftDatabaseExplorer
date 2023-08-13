//Class "Widget" written by Declan outlining the widgets.  
//Declan added method "isMouseOver()" to check is he mouse currently hovering over the widget.  Currently used for changing mouse cursor image
//Declan added button highlighting if the mouse is hovering over it.
class Widget {
  int x, y, width, height;
  String label; int event;
  color widgetColor, labelColor;
  PFont widgetFont;
  boolean isDrawnElsewhere = false;
  Widget(int x,int y, int width, int height, String label,
    color widgetColor, color labelColor, PFont widgetFont, int event){
    this.x=x; this.y=y; this.width = width; this.height= height;
    this.label=label; this.event=event;
    this.widgetColor=widgetColor; this.labelColor = labelColor; 
    this.widgetFont=widgetFont;
  }
  
  
  Widget(int x,int y, int width, int height, String label,
    color widgetColor, color labelColor, PFont widgetFont, int event, boolean isDrawnElsewhere){
    this.x=x; this.y=y; this.width = width; this.height= height;
    this.label=label; this.event=event;
    this.widgetColor=widgetColor; this.labelColor = labelColor; 
    this.widgetFont=widgetFont;
    this.isDrawnElsewhere = isDrawnElsewhere;
  }
  
  void draw(){
    noStroke();
    if(isMouseOver()) stroke(COLOR_ISABELLINE);
    fill(widgetColor);
    rect(x,y,width,height);
    noStroke();
    
    fill(labelColor);
    text(label, x+10, y+height-10);
    //isMouseOver();
  }
  
int getEvent(int mX, int mY){
    if(mX>x && mX < x+width && mY >y && mY <y+height){
      return event;
    }
    return EVENT_NULL;
  }
  
  boolean isMouseOver()
  {
    int mX = mouseX;
    int mY = mouseY;
    if(mX>x && mX < x+width && mY >y && mY <y+height){
      return true;
    }
    else
    {
      return false;
    }
  }
}

// Mia

class PhotoWidget extends Widget {  
  PImage image;
  
  PhotoWidget(int x, int y, int width, int height, PImage image, int event){
    super(x, y, width, height, "", color(0), color(0), myFont, event);
    this.image = image;
  }
  
  @Override 
  void draw(){
    image(image, x, y, width, height);

  }
}
