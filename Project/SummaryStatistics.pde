//Mia

import java.lang.Float;

class SummaryStatistics{
  ArrayList yearList = new ArrayList();
  int yearWithMostLaunches, yearWithFewestLaunches;
  int firstLaunchYear, latestLaunchYear;
  float averageSpaceObjectDiameter, averageSpaceObjectSpan;
  int heaviestSpaceObject, lightestSpaceObject;
  
  SummaryStatistics(){
    this.yearWithMostLaunches = getYearWithMostLaunches();
    this.firstLaunchYear = getFirstLaunchYear();
    this.latestLaunchYear = getLatestLaunchYear();
    this.averageSpaceObjectDiameter = getAverageSpaceObjectDiameter();
    this.lightestSpaceObject = getLightestSpaceObject();
    this.heaviestSpaceObject = getHeaviestSpaceObject();
    this.averageSpaceObjectSpan = getAverageSpaceObjectSpan();
  }
  
  @Override
  public String toString(){
    return ("Year with most launches:                       [" + yearWithMostLaunches + "]\n"
          + "First launch year:                             [" + firstLaunchYear + "]\n"
          + "Latest launch year:                            [" + latestLaunchYear + "]\n"
          + "Lightest space object mass:                    [" + lightestSpaceObject + "]\n"
          + "Heaviest space object mass:                    [" + heaviestSpaceObject + "]\n"
          + "Average space object diameter:                 [" + averageSpaceObjectDiameter + "]\n"
          + "Average space object span:                     [" + averageSpaceObjectSpan + "]\n");
  }
  
  int getYearWithMostLaunches(){
    int currentCount=0;
    int highestCount=0;
    for (int i=lowestYear; i<=highestYear; i++){
        yearList.add(i);
    }
    for(int i=0; i<yearList.size(); i++){
      currentCount=getYearCount((int)yearList.get(i));
      if(highestCount<currentCount) {
        highestCount=currentCount;
        yearWithMostLaunches = (int)yearList.get(i);
      }
    }
    return yearWithMostLaunches;
  }
  
  
  
  int getFirstLaunchYear(){
    return lowestYear;
  }
  
  int getLatestLaunchYear(){
    return highestYear;
  }
  
  float getAverageSpaceObjectDiameter(){
    float spaceObjectDiameterSum = 0.0;
    int numberOfDiameters = 0;
    Float diameter = new Float((float)spaceObjectDiameterList.get(0));
    for (int i=0; i<spaceObjectDiameterList.size(); i++){
      diameter = (float)spaceObjectDiameterList.get(i);
      if(diameter!=0 && !diameter.isNaN()){
        spaceObjectDiameterSum += diameter;
        numberOfDiameters++;
      }
    }
    return spaceObjectDiameterSum/numberOfDiameters;
  }
  
  int getLightestSpaceObject(){
    return lowestMass;
  }
  
  int getHeaviestSpaceObject(){
    return highestMass;
  }
  
  float getAverageSpaceObjectSpan(){
    float spaceObjectSpanSum = 0.0;
    int numberOfSpans = 0;
    Float span = new Float((float)spaceObjectSpanList.get(0));
    for (int i=0; i<spaceObjectSpanList.size(); i++){
      span = (float)spaceObjectSpanList.get(i);
      if(span!=0 && !span.isNaN()){
        spaceObjectSpanSum += span;
        numberOfSpans++;
      }
    }
    return spaceObjectSpanSum/numberOfSpans;
  }
  
}
