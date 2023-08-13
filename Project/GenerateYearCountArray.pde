//Method "getYearCount()" written by Declan to get the amount of launches in a given year.
public static ArrayList yearList= new ArrayList();
int getYearCount(int year)
{
  int count = 0;
  for(int i = 0; i < yearList.size(); i++){
    if((int)yearList.get(i) == year)count++;
  }
  return count;
}
