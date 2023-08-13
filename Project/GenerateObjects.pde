
int highestYear;
int lowestYear =1000000;
int highestMass;               // Mia
int lowestMass =1000000;  
float lowestDiameter = 10000;
float highestDiameter;
float averageMass = 0;
float lowestSpan = 1000;
float highestSpan = 0;
float highestApogee;
float lowestApogee = 100;
float averageApogee;
float highestPerigee;
float lowestPerigee = 100;
float averagePerigee;
public static ArrayList spaceObjectDiameterList = new ArrayList(); // Mia
public static ArrayList spaceObjectSpanList = new ArrayList(); // Mia

//Method written by Declan to extract the data from the file and return the data as an array of "spaceObjects".
//Most statistics also calculated in this method are calculated by Mia, a few by Declan.
public spaceObject[] generateObjects(String[] fileLines){ 
  spaceObject[] spaceObjectArray = new spaceObject[fileLines.length-1];
  float totalMass = 0;
  float totalApogee = 0;
  float totalPerigee = 0;
  for(int i = 1; i < fileLines.length; i++){
    String[] lineValues = fileLines[i].split("\t");
    String name = lineValues[4];
    int launchYear = 1970;
    String launchMonth  = "Unknown";
    int launchDay= -1;
    String launchDateString = lineValues[6];
    
    String[] launchDateValues = launchDateString.split(" ", 4);
    if(launchDateValues.length != 1){
      launchYear = parseInt(launchDateValues[0]);
      launchMonth = launchDateValues[1].toUpperCase();  
      launchDay = (launchDateValues.length == 3)? parseInt(launchDateValues[2]): parseInt(launchDateValues[3]);
    
      if(launchYear < lowestYear){
        lowestYear = launchYear;
      }
      if(launchYear > highestYear){
        highestYear = launchYear;
      }
    
      yearList.add(launchYear);
    }
    
    
    String status = lineValues[11];
    String state = lineValues[14];
    
    int mass = parseInt(lineValues[18]);
    if(mass < lowestMass && mass!=0){                   // Mia
      lowestMass = mass;
    }
    if(mass > highestMass){
      highestMass = mass;
    }
    totalMass += mass;
    
    float diameter = parseFloat(lineValues[26]);
    if(diameter < lowestDiameter && diameter != 0){
        lowestDiameter = diameter;
      }
      if(diameter > highestDiameter){
        highestDiameter = diameter;
      }
    spaceObjectDiameterList.add(diameter);              // Mia
    float span = parseFloat(lineValues[28]);            // Mia
    if(span < lowestSpan && span != 0){
      lowestSpan = span;
    }
    if(span > highestSpan){
      highestSpan = span;
    }
    spaceObjectSpanList.add(span);
    int perigee = parseInt(lineValues[32]);
    totalPerigee += perigee;
    if(perigee < lowestPerigee && perigee != 0){
      lowestPerigee = perigee;
    }
    if(perigee > highestPerigee){
      highestPerigee = perigee;
    }
    int apogee = parseInt(lineValues[34]);
    totalApogee += apogee;
    if(apogee < lowestApogee && apogee != 0){
      lowestApogee = apogee;
    }
    if(apogee > highestApogee){
      highestApogee = apogee;
    }
    spaceObjectArray[i-1] = new spaceObject(name,launchYear,launchMonth,launchDay,status,state,mass,diameter,perigee,apogee);
  }
  averageMass = totalMass/(float)spaceObjectArray.length;
  averageApogee = totalApogee/(float)spaceObjectArray.length;
  averagePerigee = totalPerigee/(float)spaceObjectArray.length;
  return spaceObjectArray;
}

//
