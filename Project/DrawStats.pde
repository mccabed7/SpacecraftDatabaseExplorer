//Method "drawStatsData()" written by Declan draw the stats screen.
String statsQuery = "null";
public void drawStatsData(){
  SummaryStatistics statsSet1 = new SummaryStatistics();
  textSize(20);
  
  switch(statsQuery){
    case "null":
      break;
    case "year":
      //Draw a well-fitting rectangle here (Perhaps a dark color, and set text colour to a bright sort of colour, like neon green)
      fill(0,0,0,150);
      rect(310,280,385,210);
      fill(COLOR_INDIA_GREEN);
      text("Statistics Category: YEARS", 325, 300);
      text("Year with Most Launches: " + statsSet1.getYearWithMostLaunches(), 325, 320);
      text("Year with Fewest Launches: 1957", 325, 340);
      text("First Ever Launch: " + statsSet1.getFirstLaunchYear(), 325, 360);
      text("Most Recent Launch Year: " + statsSet1.getLatestLaunchYear(), 325, 380);
      break;
    case "mass":
      fill(0,0,0,150);
      rect(310,280,385,210);
      fill(COLOR_INDIA_GREEN);
      text("Statistics Category: MASS", 325, 300);
      text("Average object mass: " + averageMass + "kg", 325, 320);
      text("Highest Mass: " + statsSet1.getHeaviestSpaceObject() + "kg", 325, 340);
      text("Lightest Mass: " + statsSet1.getLightestSpaceObject() + "kg", 325, 360);
      //text("Most recent launch year: " + statsSet1.getLatestLaunchYear(), 325, 380);
      break;
    case "span":
      fill(0,0,0,150);
      rect(310,280,385,210);
      fill(COLOR_INDIA_GREEN);
      text("Statistics Category: SPAN", 325, 300);
      text("Average object mass: " + statsSet1.getAverageSpaceObjectSpan() + "m", 325, 320);
      text("Highest Span: " + highestSpan + "m", 325, 340);
      text("Lowest Span: " + lowestSpan + "m", 325, 360);
      break;
    case "diameter":
      fill(0,0,0,150);
      rect(310,280,385,210);
      fill(COLOR_INDIA_GREEN);
      text("Statistics Category: DIAMETER", 325, 300);
      text("Average object diameter: " + statsSet1.getAverageSpaceObjectDiameter() + "m", 325, 320);
      text("Highest Diameter: " + highestDiameter + "m", 325, 340);
      text("Lowest Diameter: " + lowestDiameter + "m", 325, 360);
      break;
    case "apogee":
      fill(0,0,0,150);
      rect(310,280,385,210);
      fill(COLOR_INDIA_GREEN);
      text("Statistics Category: APOGEE", 325, 300);
      text("Average object apogee: " + averageApogee + "m", 325, 320);
      text("Highest Apogee: " + highestApogee + "m", 325, 340);
      text("Lowest Apogee: " + lowestApogee + "m", 325, 360);
      break;
    case "perigee":
      fill(0,0,0,150);
      rect(310,280,385,210);
      fill(COLOR_INDIA_GREEN);
      text("Statistics Category: PERIGEE", 325, 300);
      text("Average object perigee: " + averagePerigee + "m", 325, 320);
      text("Highest Perigee: " + highestPerigee + "m", 325, 340);
      text("Lowest Perigee: " + lowestPerigee + "m", 325, 360);
      break;
  }
  textSize(14);
}
