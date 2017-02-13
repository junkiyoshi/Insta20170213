class Star
{
  PVector location;
  float radius;
  PVector[] points;
  float color_value;
  float angle;
  
  Star(float x, float y, float r, float a)
  {
    location = new PVector(x, y);
    radius = r;
    points = new PVector[10];
    angle = a;
    color_value = a / 360 * 255;
  }
  
  void run()
  {
    update();
    display();
  }
  
  void update()
  {
    color_value = (color_value + 10) % 255;
  }
  
  void display()
  {
    pushMatrix();
    translate(location.x, location.y);
    rotate(radians(angle));
    
    h.setStrokeColour(color(color_value, 255, 255));
    fill(color_value, 255, 255, 64);
    
    h.beginShape();
    for(int i = 0; i < points.length; i++)
    {
      float x, y;
      if(i % 2 == 0)
      {
        x = radius * cos(radians(i * 36));
        y = radius * sin(radians(i * 36));
      }else
      {
        x = radius * 0.5 * cos(radians(i * 36));
        y = radius * 0.5 * sin(radians(i * 36));
      }
      
      h.vertex(x, y);
    }
    h.endShape(CLOSE);
    popMatrix();
    
  }
}