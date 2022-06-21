int[][] cell = new int [30][30];
int[][] cell2 = new int [30][30];
int gap,n,len = 30, hover;
void setup() {
  size(400, 350);
  background(0);
  gap = 10;
  for (int i = 0; i < 300; i++) {
    int temp = (int)random(30);
    int temp2 = (int)random(30);
    cell[temp2][temp] = 1;
    cell2[temp2][temp] = 1;
  }
  surface.setLocation(displayWidth/2-200, displayHeight/2-280);
  frameRate(30);
  stroke(100);
  strokeWeight(0.3);
}

void draw() {
  background(0);
  game();
  buttons();
  fill(255);
  textSize(15);
  text("reset", 342, 270);
  textSize(15);
  text("Conway's Game of Life", width/2-20, 320);
}

void game() {
  for (int y = 0; y < len; y++) {
    for (int x = 0; x < len; x++) {
      if (cell[y][x] == 0) {
        noFill();
      } else {
        fill(255);
      }
      if (x!=0 && x!= len-1 && y!=0 && y!=len-1) {
        n = cell[y][x-1] + cell[y][x+1] + cell[y+1][x] + cell[y-1][x] + cell[y+1][x-1] + cell[y+1][x+1] + cell[y-1][x-1] + cell[y-1][x+1];
        if (n==3) {
          cell2[y][x] = 1;
          n = 0;
        } else if (n < 2 || n > 3) {
          cell2[y][x] = 0;
          n = 0;
        } else n = 0;
        rect(x*gap, y*gap, gap, gap, 2, 2, 2, 2);
      }
    }
  }
  for (int y = 0; y < len; y++) {
    for (int x = 0; x < len; x++) {
      cell[y][x] = cell2[y][x];
    }
  }
}

void buttons() {
  stroke(255);
  strokeWeight(1);
  fill(hover);
  rectMode(CENTER);
  rect(342, 266, 80, 30);
  stroke(100);
  strokeWeight(0.3);
  textAlign(CENTER);
  if (mouseX > 342-40 && mouseX < 342+40 && mouseY > 266-40 && mouseY < 266+40) hover = 40;
  else hover = 0;
}

void mouseReleased() {
  if (mouseX > 342-40 && mouseX < 342+40 && mouseY > 266-40 && mouseY < 266+40) {
    for (int i = 0; i < 300; i++) {
      int temp = (int)random(30);
      int temp2 = (int)random(30);
      cell[temp2][temp] = 1;
      cell2[temp2][temp] = 1;
    }
  }
}
