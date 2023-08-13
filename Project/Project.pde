//Kostia
PFont myFont;

// Mia
Screen yearBarChartScreen = null;
Screen sortScreen = null;
Screen searchCountryScreen = null;
Screen startScreen = null;
Screen perigeeSortScreen = null;
Screen apogeeSortScreen = null;
Screen statisticsScreen = null;

ArrayList <spaceObject> objectArrayList;
YearBarChart yearBarChart;

PImage searchImage;
PImage EARTH;
PImage ROCKET;
PImage SPACESHIP_VIEW;

//  Declan
public static String[] lines = null;  //Lines taken directly from file
String currentFileName = null;
String currentScreenName = null;
ArrayList<Widget> allWidgets = null;
ArrayList<spaceObject> searchedObjects = null;
ArrayList<spaceObject> perigeeScreenObjects = null;
ArrayList<spaceObject> apogeeScreenObjects = null;
Slider sortScreenSlider = null;
Slider searchScreenSlider = null;
TextWidget focus;
TextWidget textWidget = null;
Widget nameHeaderWidget = null;
Widget dateSortWidget = null;
Widget stateHeaderWidget = null;
Widget massSortWidget = null;
Widget diameterSortWidget = null;
Widget perigeeSortWidget = null;
Widget apogeeSortWidget = null;
boolean sortingUp = true;  //Toggles whether the function is sorting high-to-low or low-to-high
Slider perigeeScreenSlider = null;
Slider apogeeScreenSlider = null;
Widget massStat = null;
Widget diameterStat = null;
Widget yearStat = null; 
Widget spanStat = null;
Widget apogeeStat = null;
Widget perigeeStat = null;
ShootingStar star1 = null;
ShootingStar star2 = null;



//kostia
void settings() {
  size(SCREENWIDTH, SCREENHEIGHT);
}



//Declan
void setup() 
{
  currentFileName = "gcat.tsv";                                //Type file name here to test different files.
  lines = loadStrings(currentFileName);

  //kostia
  frameRate(250);
  myFont = loadFont("BookmanOldStyle-48.vlw");
  textFont(myFont);
  textSize(14);
  
  
  spaceObject[] objectArray = generateObjects(lines);
  objectArrayList = new ArrayList();

  for (int i=0; i<objectArray.length; i++) {
    objectArrayList.add(objectArray[i]); 
  }
  
  // Mia  
  currentScreenName = START_SCREEN;
  
  EARTH = loadImage("earth.png");
  ROCKET = loadImage("rocketship.png");
  SPACESHIP_VIEW = loadImage("SpaceShipView2.png");
  
  PImage buttonImage = loadImage("return.png");
  PhotoWidget returnButton = new PhotoWidget(890, 60, 30, 30, buttonImage, EVENT_RETURN);
  focus=null;
  allWidgets = new ArrayList<Widget>(); 
  allWidgets.add(returnButton);
  
  //Declan & Mia 
  // create year BarChart screen "Year Barchart"
  yearBarChart = new YearBarChart(50, lowestYear, highestYear, COLOR_SILVER_PINK, COLOR_ISABELLINE);    // uses a static variable made in GenerateObjects
  ArrayList<Widget> yearWidgetList = new ArrayList<Widget>();
  yearWidgetList.add(returnButton);
  yearBarChartScreen = new Screen(COLOR_XIKETIC, yearWidgetList);
  
  // Mia & Declan  
  // create search (by Country) screen "Search By Country"
  ArrayList<Widget> searchCountryWidgetList = new ArrayList<Widget>();
  searchImage = loadImage("search.png");
  PhotoWidget searchButton = new PhotoWidget(755, 106, 30, 30, searchImage, EVENT_SEARCH);
  nameHeaderWidget = new Widget(10, 15, 185, 30, "[Name]",COLOR_INDEPENDENCE, COLOR_ISABELLINE, myFont, EVENT_SORT_BY_NAME, true );
  dateSortWidget = new Widget(200, 15, 130, 30, "[Launch Date]",COLOR_INDEPENDENCE, COLOR_ISABELLINE, myFont, EVENT_SORT_BY_LAUNCHDATE , true); 
  stateHeaderWidget = new Widget(335, 15, 70, 30, "[State]",COLOR_INDEPENDENCE, COLOR_ISABELLINE, myFont, EVENT_NULL, true );
  massSortWidget = new Widget(410, 15, 65, 30, "[Mass]",COLOR_INDEPENDENCE, COLOR_ISABELLINE, myFont, EVENT_SORT_BY_MASS, true );
  diameterSortWidget = new Widget(480, 15, 95, 30, "[Diameter]",COLOR_INDEPENDENCE, COLOR_ISABELLINE, myFont, EVENT_SORT_BY_DIAMETER, true );
  perigeeSortWidget = new Widget(580, 15,75, 30, "[Perigee]",COLOR_INDEPENDENCE, COLOR_ISABELLINE, myFont, EVENT_SORT_BY_PERIGEE, true );
  apogeeSortWidget = new Widget(660, 15, 75, 30, "[Apogee]",COLOR_INDEPENDENCE, COLOR_ISABELLINE, myFont, EVENT_SORT_BY_APOGEE, true );
  textWidget = new TextWidget(800, 100, 130, 40, "Enter country", COLOR_ISABELLINE, COLOR_XIKETIC, myFont, EVENT_TEXT, 18);
  
  searchedObjects = new ArrayList<spaceObject>();
  allWidgets.add(dateSortWidget);
  allWidgets.add(textWidget);
  allWidgets.add(searchButton);
  allWidgets.add(nameHeaderWidget);
  allWidgets.add(apogeeSortWidget);
  allWidgets.add(perigeeSortWidget);
  allWidgets.add(diameterSortWidget);
  allWidgets.add(massSortWidget);
  allWidgets.add(stateHeaderWidget);
  searchCountryWidgetList.add(nameHeaderWidget);
  searchCountryWidgetList.add(apogeeSortWidget);
  searchCountryWidgetList.add(perigeeSortWidget);
  searchCountryWidgetList.add(dateSortWidget);
  searchCountryWidgetList.add(diameterSortWidget);
  searchCountryWidgetList.add(massSortWidget);
  searchCountryWidgetList.add(stateHeaderWidget);
  searchCountryWidgetList.add(textWidget);
  searchCountryWidgetList.add(returnButton); 
  searchCountryWidgetList.add(searchButton);
  searchCountryScreen = new Screen(COLOR_XIKETIC, searchCountryWidgetList);       
  searchScreenSlider = new Slider(950, 50, COLOR_ISABELLINE, COLOR_INDEPENDENCE); //y = 50 => slider at top of screen    
  
  // Declan created sort by perigee screen
  ArrayList<Widget> perigeeScreenWidgetList = new ArrayList<Widget>();
  perigeeScreenWidgetList.add(returnButton);
  perigeeScreenObjects = (ArrayList<spaceObject>) objectArrayList.clone();
  perigeeScreenObjects = sortSpaceObjects(perigeeScreenObjects, "PerigeeStartHigh");
  perigeeScreenSlider = new Slider(950, 50, COLOR_ISABELLINE, COLOR_INDEPENDENCE);
  perigeeSortScreen = new Screen(COLOR_XIKETIC, perigeeScreenWidgetList);
  
  // Declan created sort by apogee screen
  ArrayList<Widget> apogeeScreenWidgetList = new ArrayList<Widget>();
  apogeeScreenWidgetList.add(returnButton);
  apogeeScreenObjects = (ArrayList<spaceObject>) objectArrayList.clone();
  apogeeScreenObjects = sortSpaceObjects(apogeeScreenObjects, "ApogeeStartHigh");
  apogeeScreenSlider = new Slider(950, 50, COLOR_ISABELLINE, COLOR_INDEPENDENCE);
  apogeeSortScreen = new Screen(COLOR_XIKETIC, apogeeScreenWidgetList);
  
  // Declan created statistics screen
  ArrayList<Widget> statisticsScreenWidgetList = new ArrayList<Widget>();
  statisticsScreenWidgetList.add(returnButton);
  massStat = new Widget(525, 635,75, 40, "[MASS]", COLOR_OTHER_DARK_BLUE, COLOR_ISABELLINE, myFont, EVENT_MASS_STATS, true);
  statisticsScreenWidgetList.add(massStat);
  allWidgets.add(massStat);
  diameterStat = new Widget (390, 635,115, 40, "[DIAMETER]", COLOR_OTHER_DARK_BLUE, COLOR_ISABELLINE, myFont, EVENT_DIAMETER_STATS, true);
  statisticsScreenWidgetList.add(diameterStat);
  allWidgets.add(diameterStat);
  yearStat = new Widget (525, 745,75, 40, "[YEAR]", COLOR_OTHER_DARK_BLUE, COLOR_ISABELLINE, myFont, EVENT_YEAR_STATS, true);
  statisticsScreenWidgetList.add(yearStat);
  allWidgets.add(yearStat);
  spanStat = new Widget(525, 690,75, 40, "[SPAN]", COLOR_OTHER_DARK_BLUE, COLOR_ISABELLINE, myFont, EVENT_SPAN_STATS, true);
  statisticsScreenWidgetList.add(spanStat);
  allWidgets.add(spanStat);
  perigeeStat = new Widget(390, 690,115, 40, "[PERIGEE]", COLOR_OTHER_DARK_BLUE, COLOR_ISABELLINE, myFont, EVENT_PERIGEE_STATS, true);
  statisticsScreenWidgetList.add(perigeeStat);
  allWidgets.add(perigeeStat);
  apogeeStat = new Widget(390, 745,115, 40, "[APOGEE]", COLOR_OTHER_DARK_BLUE, COLOR_ISABELLINE, myFont, EVENT_APOGEE_STATS, true);
  statisticsScreenWidgetList.add(apogeeStat);
  allWidgets.add(apogeeStat);
  statisticsScreen = new Screen(COLOR_XIKETIC, statisticsScreenWidgetList);
  star1 = new ShootingStar(0, SCREENHEIGHT/2 + 100, 1);
  star2 = new ShootingStar(SCREENWIDTH - 5, SCREENHEIGHT/3 + 100, -2);
  
  // Mia + Darius create Start screen "Start Screen" 
  ArrayList<Widget> startWidgetList = new ArrayList<Widget>();
  Widget yearBarChartButton = new Widget(50, 641, 200, 40, "GRAPH BY YEAR", COLOR_INDEPENDENCE, COLOR_ISABELLINE, myFont, EVENT_YEAR_BAR_CHART); 
  allWidgets.add(yearBarChartButton);
  startWidgetList.add(yearBarChartButton);
  Widget searchByCountryButton = new Widget(100, 770, 200, 40, "SEARCH BY COUNTRY", COLOR_HELIOTROPE_GRAY, COLOR_XIKETIC, myFont, EVENT_SEARCH_BY_COUNTRY); 
  allWidgets.add(searchByCountryButton);
  startWidgetList.add(searchByCountryButton);
  Widget perigeeScreenWidget = new Widget(270, 360, 200, 40, "SORT ALL BY PERIGEE", COLOR_HELIOTROPE_GRAY, COLOR_XIKETIC, myFont, EVENT_SORT_BY_PERIGEE_SCREEN);
  allWidgets.add(perigeeScreenWidget);
  startWidgetList.add(perigeeScreenWidget);
  Widget apogeeScreenWidget = new Widget(525,170, 200,40, "SORT ALL BY APOGEE", COLOR_INDEPENDENCE, COLOR_ISABELLINE, myFont, EVENT_SORT_BY_APOGEE_SCREEN);
  allWidgets.add(apogeeScreenWidget);
  startWidgetList.add(apogeeScreenWidget);
  Widget statScreenWidget = new Widget(763, 710, 200, 40, "STATISTICS", COLOR_HELIOTROPE_GRAY, COLOR_XIKETIC, myFont, EVENT_STATISTICS_SCREEN);
  allWidgets.add(statScreenWidget);
  startWidgetList.add(statScreenWidget);
  startScreen = new Screen(COLOR_XIKETIC, startWidgetList); 
}








//Declan, Mia and Darius
void draw() 
{
   noStroke();
    switch(currentScreenName){     //Call to draw screen and any other funcionality within the screen within a case here (barchart, etc)
      case YEAR_BAR_CHART: 
        yearBarChartScreen.draw();  
        yearBarChart.draw();
        break;
      case SEARCH_BY_COUNTRY:
        
        searchCountryScreen.draw();
        drawSortedData(searchedObjects,searchScreenSlider.getNumber());
        if (searchedObjects.size() != 0){
          searchScreenSlider.move();
          searchScreenSlider.draw();
        }
        dateSortWidget.draw();
        nameHeaderWidget.draw();
        apogeeSortWidget.draw();
        perigeeSortWidget.draw();
        diameterSortWidget.draw();
        massSortWidget.draw();
        stateHeaderWidget.draw();
        break;
      case SORT_BY_PERIGEE:
        perigeeSortScreen.draw();
        drawSortedData(perigeeScreenObjects, perigeeScreenSlider.getNumber());
        perigeeScreenSlider.move();
        perigeeScreenSlider.draw();
        fill(COLOR_ISABELLINE);
        text("[Name]", 20, 30); 
        fill(COLOR_INDEPENDENCE);
        text("[Launch Date]", 212, 30);
        text("[State]", 350, 30);
        text("[Mass]", 425, 30);
        text("[Diameter]", 495, 30);
        fill(COLOR_ISABELLINE);
        text("[PERIGEE]", 595, 30);
        fill(COLOR_INDEPENDENCE);
        text("[Apogee]", 675, 30);
        break;
      case SORT_BY_APOGEE:
        apogeeSortScreen.draw();
        drawSortedData(apogeeScreenObjects, apogeeScreenSlider.getNumber());
        apogeeScreenSlider.move();
        apogeeScreenSlider.draw();
        fill(COLOR_ISABELLINE);
        text("[Name]", 20, 30); 
        fill(COLOR_INDEPENDENCE);
        text("[Launch Date]", 212, 30);
        text("[State]", 350, 30);
        text("[Mass]", 425, 30);
        text("[Diameter]", 495, 30);
        text("[Perigee]", 595, 30);
        fill(COLOR_ISABELLINE);
        text("[APOGEE]", 675, 30);
        fill(COLOR_INDEPENDENCE);
        break;
      case STATISTICS_SCREEN:
        statisticsScreen.draw();
        star1.move();
        star1.draw();
        star2.move();
        star2.draw();
        image(SPACESHIP_VIEW, 0,0,SCREENWIDTH,SCREENHEIGHT);
        massStat.draw();
        diameterStat.draw();
        yearStat.draw();
        spanStat.draw();
        perigeeStat.draw();
        apogeeStat.draw();
        drawStatsData();
        break;
      default:
      case START_SCREEN:
        startScreen.draw();
        stroke(COLOR_SILVER_PINK);
        noFill();
        ellipse(450, 350, 800, 600);
        image(EARTH, 250, 110, 200, 100);
        image(ROCKET, 350, 390, 450, 450);
        fill(COLOR_ISABELLINE);
        ellipse(230, 100, 20, 20); // perigee
        ellipse(835, 430, 20, 20); // apogee
        stroke(COLOR_ISABELLINE);
        
        line(520, 530, 110, 530);  // year bar chart
        line(110, 530, 110, 640);
        
        line(520, 550, 320, 550);  // search by country
        line(320, 550, 320, 790);
        line(320, 790, 301, 790);
        
        line(790, 430, 900, 540);  // stats
        line(500, 795, 545, 840);
        line(900, 540, 545, 840);
        line(722, 690, 762, 730);
        
        line(230, 100, 230, 380);  // perigee
        line(230, 380, 270, 380);
        
        line(835, 430, 905, 430);  // apogee
        line(905, 430, 905, 190);
        line(905, 190, 725, 190);
        noStroke();
        
    }
    
}






//Declan
void mousePressed(){
  int event;
  for(int i = 0; i < allWidgets.size(); i++){
    Widget widget = allWidgets.get(i);
    event = widget.getEvent(mouseX,mouseY);
    switch(event){
      case EVENT_RETURN:
        currentScreenName = START_SCREEN;
        statsQuery = "null";
        focus=null;
        break;
      case EVENT_YEAR_BAR_CHART:
        currentScreenName = YEAR_BAR_CHART; //Do something here.  Change screen by setting currentScreenName to a different String, etc.
        yearBarChart.reset();
        break;
      case EVENT_SEARCH_BY_COUNTRY:
        currentScreenName = SEARCH_BY_COUNTRY; //Do something here.  Change screen by setting currentScreenName to a different String, etc.
        break;
      case EVENT_SORT_BY_LAUNCHDATE:
        if(sortingUp)
        {
          searchedObjects= sortSpaceObjects(searchedObjects, "DateStartLow");
          sortingUp = false;
        }
        else
        {
          searchedObjects= sortSpaceObjects(searchedObjects, "DateStartHigh");
          sortingUp = true;
        }
        println("Sorting by launchdate");
        break;
      case EVENT_SORT_BY_MASS:
        println("Sorting by mass");
        if(sortingUp)
        {
          searchedObjects= sortSpaceObjects(searchedObjects, "MassStartLow");
          sortingUp = false;
        }
        else
        {
          searchedObjects= sortSpaceObjects(searchedObjects, "MassStartHigh");
          sortingUp = true;
        }
        break;
        case EVENT_SORT_BY_DIAMETER:
        println("Sorting by diameter");
        if(sortingUp)
        {
          searchedObjects= sortSpaceObjects(searchedObjects, "DiameterStartLow");
          sortingUp = false;
        }
        else
        {
          searchedObjects= sortSpaceObjects(searchedObjects, "DiameterStartHigh");
          sortingUp = true;
        }
        break;
        case EVENT_SORT_BY_PERIGEE:
        println("Sorting by perigee");
        if(sortingUp)
        {
          searchedObjects= sortSpaceObjects(searchedObjects, "PerigeeStartLow");
          sortingUp = false;
        }
        else
        {
          searchedObjects= sortSpaceObjects(searchedObjects, "PerigeeStartHigh");
          sortingUp = true;
        }
        break;
        case EVENT_SORT_BY_APOGEE:
        println("Sorting by apogee");
        if(sortingUp)
        {
          searchedObjects= sortSpaceObjects(searchedObjects, "ApogeeStartLow");
          sortingUp = false;
        }
        else
        {
          searchedObjects= sortSpaceObjects(searchedObjects, "ApogeeStartHigh");
          sortingUp = true;
        }
        break;
        case EVENT_SORT_BY_NAME:
        println("Sorting by name");
        if(sortingUp)
        {
          searchedObjects= sortSpaceObjects(searchedObjects, "NameAZ");
          sortingUp = false;
        }
        else
        {
          searchedObjects= sortSpaceObjects(searchedObjects, "NameZA");
          sortingUp = true;
        }
        break;
      case EVENT_SORT_BY_PERIGEE_SCREEN:
        println("Drawing perigee list");
        currentScreenName = SORT_BY_PERIGEE;
        break;
      case EVENT_SORT_BY_APOGEE_SCREEN:
        println("Drawing apogee list");
        currentScreenName = SORT_BY_APOGEE;
        break;
      case EVENT_STATISTICS_SCREEN:
        println("Stats Screen");
        currentScreenName = STATISTICS_SCREEN;
        break;
      case EVENT_MASS_STATS:
        println("Showing mass stats");
        statsQuery = "mass";
        break;
      case EVENT_DIAMETER_STATS:
        println("Showing diameter stats");
        statsQuery = "diameter";
        break;
      case EVENT_YEAR_STATS:
        println("Showing years stats");
        statsQuery = "year";
        break;
      case EVENT_SPAN_STATS:
        println("Showing span stats");
        statsQuery = "span";
        break;
      case EVENT_PERIGEE_STATS:
        println("Showing perigee stats");
        statsQuery = "perigee";
        break;
      case EVENT_APOGEE_STATS:
        println("Showing apogee stats");
        statsQuery = "apogee";
        break;
      case EVENT_TEXT:
        println("Pressed button.");
        focus=textWidget;
        break; 
      case EVENT_NULL:
        break;
      case EVENT_SEARCH:
        String search = textWidget.getLabel();
        search = search.trim();
        searchedObjects = getObjectsByCountry(search, objectArrayList);
        break;
      default:
    }
  }
}

void keyPressed() {
  if(focus != null) {
    if(key==ENTER){
      String search = textWidget.getLabel();
      searchScreenSlider.ry = 50;
      search = search.trim();
      searchedObjects = getObjectsByCountry(search, objectArrayList);
    }
    else if(key==SHIFT || key=='\uFFFF'){           // \uFFFF is the key code for caps
    }
    else{
     focus.append(key);
    }
  }
}









void printAllInstances(ArrayList<spaceObject> list) {
  float y = 30;
  for (int k = 0; k< list.size(); k++) {
    String printout = "Name:  " + list.get(k).name + ";" +"\t" + "    Launchdate :  " + list.get(k).launchYear + "  " + list.get(k).launchMonth + "  " + list.get(k).launchDay + "  " + ";" + "\t" + "   Status:  " + list.get(k).status + ";" + "\t" + "   mass:  " + list.get(k).mass + ";" + "\t" + "   Diameter:  " + list.get(k).diameter + ";" + "\t" + "   Perigee:  " + list.get(k).perigee + ";" + "\t" + "    apogee:  " + list.get(k).apogee + ";" + "\t";
    fill(0, 408, 612);
    text(printout, 0, y);
    y = y + 20;
  }
}
