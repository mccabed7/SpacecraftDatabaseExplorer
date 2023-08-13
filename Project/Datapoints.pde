//Darius

class spaceObject {
  String name;
  int launchYear;
  String launchMonth;
  int launchDay;
  String status;
  String state;
  int mass;
  float diameter;
  int perigee;
  int apogee;
  spaceObject(String name, int launchYear, String launchMonth, int launchDay,
  String status, String state, int mass, float diameter, int perigee, int apogee) {
    this.name = name;
    this.launchYear = launchYear;
    this.launchMonth = launchMonth;
    this.launchDay = launchDay;
    this.status = status;
    this.state = state;
    this.mass = mass;
    this.diameter = diameter;
    this.perigee = perigee;
    this.apogee = apogee;
  }
  
  // Mia
  
  @Override
  public String toString() {
    return (name + "\t" + launchYear + "\t" + launchMonth + "\t" + launchDay + "\t" 
             + status + "\t" + state + "\t" + mass + "\t" + diameter + "\t" + perigee + "\t"
             + apogee);
  }
}
