//Method "sortSpaceObjects" written by Declan to sort an ArrayList of spaceObjects.
//Makes use of custom Comparator classes, inheriting from Comparator.Comparator class, listed below the method.
import java.util.Collections;
import java.util.Comparator;
import java.lang.*;

ArrayList sortSpaceObjects(ArrayList<spaceObject> objectArray, String sortBy){
  switch(sortBy){
    case "DateStartHigh":
      Collections.sort(objectArray, new LaunchComparator());
      Collections.reverse(objectArray);
      break;
    case "DateStartLow":
      Collections.sort(objectArray, new LaunchComparator());
      break;
    case "MassStartHigh":
      Collections.sort(objectArray, new MassComparator());
      Collections.reverse(objectArray);
      break;
    case "MassStartLow":
      Collections.sort(objectArray, new MassComparator());
      break;
    case "DiameterStartHigh":
      Collections.sort(objectArray, new DiameterComparator());
      Collections.reverse(objectArray);
      break;
    case "DiameterStartLow":
      Collections.sort(objectArray, new DiameterComparator());
      break;
    case "ApogeeStartHigh":
      Collections.sort(objectArray, new ApogeeComparator());
      Collections.reverse(objectArray);
      break;
    case "ApogeeStartLow":
      Collections.sort(objectArray, new ApogeeComparator());
      break;
    case "PerigeeStartHigh":
      Collections.sort(objectArray, new PerigeeComparator());
      Collections.reverse(objectArray);
      break;
    case "PerigeeStartLow":
    Collections.sort(objectArray, new PerigeeComparator());
      break;
    case "NameAZ":
    Collections.sort(objectArray, new NameComparator());
    Collections.reverse(objectArray);
      break;
    case "NameZA":
    Collections.sort(objectArray, new NameComparator());
      break;
  
  }
  return objectArray;
}

//Class "LaunchComparator" written by Declan which compares the launchDates of two spaceObjects for sorting purposes.
class LaunchComparator implements Comparator<spaceObject>{
    @Override
    public int compare(spaceObject object1, spaceObject object2){
      int launchScore1 = (object1.launchYear*365)+(object1.launchDay);
      int launchScore2 = (object2.launchYear*365)+(object2.launchDay);
      switch(object1.launchMonth.toUpperCase()){
        case "JAN":
          launchScore1 += 0;
          break;
        case "FEB":
         launchScore1 += 31;
          break;
        case "MAR":
         launchScore1 += 59;
          break;
        case "APR":
         launchScore1 += 90;
          break;
        case "MAY":
         launchScore1 += 120;
          break;
        case "JUN":
         launchScore1 += 151;
         break;
        case "JUL":
         launchScore1 += 181;
         break;
        case "AUG":
         launchScore1 += 212;
         break;
        case "SEP":
         launchScore1 += 243;
         break;
        case "OCT":
         launchScore1 += 273;
         break;
        case "NOV":
         launchScore1 += 304;
         break;
        case "DEC":
         launchScore1 += 334;
         break;
        default:
         break;
      }
      
      switch(object2.launchMonth.toUpperCase()){
        case "JAN":
          launchScore2 += 0;
          break;
        case "FEB":
         launchScore2 += 31;
          break;
        case "MAR":
         launchScore2 += 59;
          break;
        case "APR":
         launchScore2 += 90;
          break;
        case "MAY":
         launchScore2 += 120;
          break;
        case "JUN":
         launchScore2 += 151;
         break;
        case "JUL":
         launchScore2 += 181;
         break;
        case "AUG":
         launchScore2 += 212;
         break;
        case "SEP":
         launchScore2 += 243;
         break;
        case "OCT":
         launchScore2 += 273;
         break;
        case "NOV":
         launchScore2 += 304;
         break;
        case "DEC":
         launchScore2 += 334;
         break;
        default:
         break;
      }
      
      if(launchScore1 > launchScore2){
        return 1;
      }
      else if(launchScore1 < launchScore2){
        return -1;
      }
      else {
        return 0;
      }
      
    }
}//https://www.quora.com/How-do-I-sort-an-ArrayList-of-objects-by-each-objects-integer-parameter

//Class "MassComparator" written by Declan which compares the masses of two spaceObjects for sorting purposes.
class MassComparator implements Comparator<spaceObject>{
    @Override
    public int compare(spaceObject spaceObject1, spaceObject spaceObject2){
      if(spaceObject1.mass > spaceObject2.mass){
        return 1;
      }
      else if (spaceObject1.mass < spaceObject2.mass){
        return -1;
      }
      else{
        return 0;
      }
    }
}

//Class "DiameterComparator" written by Declan which compares the diameters of two spaceObjects for sorting purposes.
class DiameterComparator implements Comparator<spaceObject>{
    @Override
    public int compare(spaceObject spaceObject1, spaceObject spaceObject2){
      if(spaceObject1.diameter > spaceObject2.diameter){
        return 1;
      }
      else if (spaceObject1.diameter < spaceObject2.diameter){
        return -1;
      }
      else{
        return 0;
      }
    }
}

//Class "ApogeeComparator" written by Declan which compares the apogees of two spaceObjects for sorting purposes.
class ApogeeComparator implements Comparator<spaceObject>{
   @Override
   public int compare(spaceObject object1, spaceObject object2){
     if(object1.apogee > object2.apogee){
       return 1;
     }
     else if (object1.apogee < object2.apogee){
       return -1;
     }
     else {
       return 0;
     }
   
   }
}

//Class "PerigeeComparator" written by Declan which compares the perigees of two spaceObjects for sorting purposes.
class PerigeeComparator implements Comparator<spaceObject>{
   @Override
   public int compare(spaceObject object1, spaceObject object2){
     if(object1.perigee > object2.perigee){
       return 1;
     }
     else if (object1.perigee < object2.perigee){
       return -1;
     }
     else {
       return 0;
     }
   
   }
}

//Class "NameComparator" written by Declan which compares the names of two spaceObjects for sorting purposes.
class NameComparator implements Comparator<spaceObject>{
  @Override
  public int compare(spaceObject object1, spaceObject object2){
    
    return object1.name.toUpperCase().compareTo(object2.name.toUpperCase());
  }
}
