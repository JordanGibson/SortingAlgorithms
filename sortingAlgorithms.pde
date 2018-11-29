int valueCount = 1020;

int[] values = new int[valueCount];

void setup(){
  size(2040, 1020);
  colorMode(HSB);
  for(int i = 0; i < valueCount; i++){
   values[i] = i;
  }
  values = shuffle(values);
}

void draw(){
  clear();
  strokeWeight(3);
  for(int i = 0; i < valueCount; i++){
    stroke((values[i]/4.5) % 255, 255, 255);
    line(i * width/height, height, i * width/height, height - values[i]);
  }
  CocktailShakerSort();
}

void BubbleSort(){
   for(int i = 0 ; i < valueCount - 1; i++){
      if(values[i] > values[i+1]){
          int temp = values[i + 1];
          values[i + 1] = values[i];
          values[i] = temp;
        }
    } 
}

void CocktailShakerSort(){
  boolean sorted = false;
  while(!sorted){
    sorted = true;
    for(int i = 0; i < values.length - 2; i++){
     if(values[i] > values[i+1]){
        int temp = values[i];
        values[i] = values[i+1];
        values[i+1]=temp;
        sorted = false;
       }
     }
     
     if(sorted){
       break;
     }
       
     for(int i = values.length - 2; i > 0 ; i--){
      if(values[i] > values[i+1]){
        int temp = values[i];
        values[i] = values[i+1];
        values[i+1]=temp;
        sorted = false;
      }
     }
     if(!sorted)
       sorted = true;
    }
}

void RadixSort(){

}

int[] SortByIndex(int[] values, int index){
  int[][] tempArr = new int[10][values.length];
  for(int i = 0; i < values.length; i++){
    String valueString = str(values[i]);
    int charIndex = valueString.length() - 1 - index;
    int indexedValue = valueString.charAt(charIndex) - 48;
    int affectedLength = tempArr[indexedValue].length;
    tempArr[i][affectedLength] = values[i];
  }
  int[] returnList = new int[values.length];
  for(int i = 0; i < 10; i++){
   for(int j = 0; j < values.length; j++){
     if(tempArr[i][j] != 0)
       returnList[returnList.length] = tempArr[i][j];
   }
  }
  return returnList;
}

int[] shuffle(int[] list){
 for (int i = list.length-1; i > 0; i--) 
    {
        int j = int(random(i)); 
  
        int temp = list[i];
        list[i] = list[j];
        list[j] = temp; 
    }
   return list;
}
