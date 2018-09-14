class Map {
  boolean[][] colored;
  int xRes = 100;
  int yRes = 60;
  int incSize = 1000/100;
  
  String[] line = new String[xRes * yRes];
  
  public Map(String mapText) { //mapText = "map.txt"
    colored = new boolean[xRes][yRes];
    loadMap(mapText);
  }
  
  void loadMap(String map) {
    int lineLocation = 0;
    line = loadStrings(map); //map is "map.txt"
    
    for (int i = 0; i < xRes; i++) {
      for (int j = 0; j < yRes; j++) {
        colored[i][j] = boolean(line[lineLocation]);
        lineLocation++;
      }
    }
  }
  
  void displayMap() {
    noStroke();
    rectMode(CORNER);
    for (int i = 0; i < xRes; i++) {
      for (int j = 0; j < yRes; j++) {
        if (colored[i][j]) { //if tile is colored, fill black
          fill(0);
        }
        else { //if tile is not colored, no fill
          noFill();
        }
        rect(i * incSize, j * incSize, incSize, incSize);
      }
    }
  }
}
