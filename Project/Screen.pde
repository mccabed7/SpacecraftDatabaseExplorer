//Class "Screen" written by Declan to organise the screens and their widgets.
//Declan added method "widgetMouseCheck()" to check is the mouse hovering over a widget.  If it is, the cursor image changes from an arrow to a hand.
import java.util.ArrayList;
class Screen{
  color screenColor= color(1);
  ArrayList<Widget> myWidgets = null;
  Screen(color backgroundColor, ArrayList myWidgets)  //Note for constructor: myWidgets can't be null.  If empty, set to "new ArrayList<Widget>()"
  {
    this.screenColor = (color)backgroundColor;
    this.myWidgets = myWidgets;
  }
  
  void addWidget(Widget widget){
    myWidgets.add(widget);
  }
  
  void draw()
  {
    background(screenColor);
    if(myWidgets != null){
      for(int i = 0; i < myWidgets.size(); i++)
      {
        if(!myWidgets.get(i).isDrawnElsewhere)myWidgets.get(i).draw();
        
      }
      widgetMouseCheck();
    }
  }
  
  void widgetMouseCheck()
  {
    int totalHovers = 0;
    for(int i = 0; i <= myWidgets.size()-1; i++)
    {
      if(myWidgets.get(i).isMouseOver())
      {
        totalHovers++;
      }
    }
    if(totalHovers > 0)
    {
      cursor(HAND);
    }
    else
    {
      cursor(ARROW);
    }
  }
}
