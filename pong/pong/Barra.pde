class Barra
{
  static final int Ancho = 20;
  static final int Alto = 80;
  
  int x,y;
  
  public Barra(int x, int y)
  {
    this.x = x - (Ancho/2);
    this.y = y - (Alto/2);
  }
  
  public void draw()
  {
    fill(0);
    rect(x,y,Ancho,Alto);
  }
  
  public void Reset()  { y = height/2-Alto/2; }
  
  public void MoverArriba()  { y -= ( y > 0) ? 15 : 0; }

  public void MoverAbajo()  { y += (y < height-Alto) ? 15 : 0; }
}