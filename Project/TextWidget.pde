public class TextWidget extends Widget {
  int maxlen;
  Widget textWidget;
  TextWidget(int x, int y, int width, int height, String label, color widgetColor, color fontColor,
                                                    PFont font, int event, int maxlen){
    super(x, y, width, height, label, widgetColor, fontColor, font, event);
    this.maxlen=maxlen;
  }
 
   void append(char s){
     if(s==BACKSPACE){
       if(!label.equals("")) 
          label=label.substring(0,label.length()-1);
     }
     else if (label.length() <maxlen)
       label=label+str(s);
     } //<>//

   String getLabel(){
     return this.label;
   }
   
}
