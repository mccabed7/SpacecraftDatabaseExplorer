//Method "getObjectsByCountry()" written by Declan to get a subset of objects based on a search query.
//Declan added feature allowing to search by full country names, common alternative names, and country abbreviation.
public ArrayList<spaceObject> getObjectsByCountry(String searchQuery, ArrayList<spaceObject> searchIn){
  ArrayList<spaceObject> foundObjects = new ArrayList<spaceObject>();
  String tempString = "";
  String searchFor = searchQuery;
  if(searchQuery.equalsIgnoreCase("Russia")){
    searchFor = "RU";
  }
  else if (searchQuery.equalsIgnoreCase("The united states") || searchQuery.equalsIgnoreCase("united states") || searchQuery.equalsIgnoreCase("america")  || searchQuery.equalsIgnoreCase("the states") || searchQuery.equalsIgnoreCase("the usa") || searchQuery.equalsIgnoreCase("usa") || searchQuery.equalsIgnoreCase("the us")||searchQuery.equalsIgnoreCase("us")){
    searchFor = "US";
  }
  else if (searchQuery.equalsIgnoreCase("The soviet union") || searchQuery.equalsIgnoreCase("soviet union")){
    searchFor = "SU";
  }
  else if (searchQuery.equalsIgnoreCase("united kingdom") || searchQuery.equalsIgnoreCase("the united kingdom")  || searchQuery.equalsIgnoreCase("the uk")){
    searchFor = "UK";
  }
  else if (searchQuery.equalsIgnoreCase("france")){
    searchFor = "F";
  }
  else if (searchQuery.equalsIgnoreCase("china")){
    searchFor = "CN";
  }
  else if (searchQuery.equalsIgnoreCase("Japan")){
    searchFor = "J";
  }
  else if (searchQuery.equalsIgnoreCase("New Zealand")){
    searchFor = "NZ";
  }
  else if (searchQuery.equalsIgnoreCase("Mexico")){
    searchFor = "MX";
  }
  else if (searchQuery.equalsIgnoreCase("India")){
    searchFor = "I";
  }
  else if (searchQuery.equalsIgnoreCase("finland")){
    searchFor = "FI";
  }
  else if (searchQuery.equalsIgnoreCase("brazil")){
    searchFor = "BR";
  }
  else if (searchQuery.equalsIgnoreCase("The united arab emirates") || searchQuery.equalsIgnoreCase("united arab emirates")  || searchQuery.equalsIgnoreCase("arab emirates")){
    searchFor = "UAE";
  }
  else if (searchQuery.equalsIgnoreCase("australia")){
    searchFor = "AU";
  }
  else if (searchQuery.equalsIgnoreCase("poland")){
    searchFor = "PL";
  }
  else if (searchQuery.equalsIgnoreCase("international")){
    searchFor = "I-INT";
  }
  else if (searchQuery.equalsIgnoreCase("israel")){
    searchFor = "IL";
  }
  else if (searchQuery.equalsIgnoreCase("ireland")){
    searchFor = "IE";
  }
  else if (searchQuery.equalsIgnoreCase("czech republic")){
    searchFor = "CZ";
  }
  else if (searchQuery.equalsIgnoreCase("germany")){
    searchFor = "D";
  }
  else if (searchQuery.equalsIgnoreCase("saudi arabia")){
    searchFor = "SA";
  }
  else if (searchQuery.equalsIgnoreCase("south korea") || searchQuery.equalsIgnoreCase("korea")){
    searchFor = "KR";
  }
  else if (searchQuery.equalsIgnoreCase("jordan")){
    searchFor = "JO";
  }
  else if (searchQuery.equalsIgnoreCase("saudi arabia")){
    searchFor = "SA";
  }
  else if (searchQuery.equalsIgnoreCase("turkey")){
    searchFor = "T";
  }
  else if (searchQuery.equalsIgnoreCase("netherlands") || searchQuery.equalsIgnoreCase("the netherlands")){
    searchFor = "NL";
  }
  else if (searchQuery.equalsIgnoreCase("canada")){
    searchFor = "CA";
  }
  else if (searchQuery.equalsIgnoreCase("columbia")){
    searchFor = "CO";
  }
  else if (searchQuery.equalsIgnoreCase("qatar")){
    searchFor = "QA";
  }
  else if (searchQuery.equalsIgnoreCase("philippines") || searchQuery.equalsIgnoreCase("the philippines")){
    searchFor = "PH";
  }
   else if (searchQuery.equalsIgnoreCase("argentina")){
    searchFor = "AR";
  }
   else if (searchQuery.equalsIgnoreCase("malaysia")){
    searchFor = "MA";
  }
  else if (searchQuery.equalsIgnoreCase("indonesia")){
    searchFor = "ID";
  }
  else if (searchQuery.equalsIgnoreCase("hong kong") || searchQuery.equalsIgnoreCase("hongkong")){
    searchFor = "HK";
  }
  else if (searchQuery.equalsIgnoreCase("venezuela")){
    searchFor = "VE";
  }
  else if (searchQuery.equalsIgnoreCase("taiwan")){
    searchFor = "TW";
  }
  for(int i = 0; i < searchIn.size(); i++){
    tempString = searchIn.get(i).state;
    if(searchFor.equalsIgnoreCase(tempString)) foundObjects.add(searchIn.get(i));
  }
  return foundObjects;
  
}
