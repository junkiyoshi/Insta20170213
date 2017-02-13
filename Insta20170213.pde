import org.gicentre.handy.*;

HandyRenderer h;
ArrayList<Star> stars;

float _color_value;
float roughness;

void setup()
{
  size(512, 512);
  colorMode(HSB);
  frameRate(3);
  h = HandyPresets.createMarker(this);
  
  roughness = 2;
  h.setRoughness(roughness);
  
  stars = new ArrayList<Star>();
  for(int i = 0; i < 360; i += 18)
  {
    float x = 200 * cos(radians(i)) + width / 2;
    float y = 200 * sin(radians(i)) + height / 2;
    stars.add(new Star(x, y, 40, i));
  }
  
  _color_value = 192;
}

void draw()
{
  background(255);

  if(frameCount > 30 && frameCount % 6 == 0 && frameCount < 96)
  {
      roughness += 1;
      h.setRoughness(roughness % 10);
  }

  for(Star s : stars)
  {
    s.run();
  }
  
  _color_value = (_color_value + 10) % 255;
  h.setStrokeColour(color(_color_value, 255, 255));
  fill(color(_color_value, 255, 255), 64);
  h.ellipse(width /2, height / 2, 180, 180);
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 103)
  {
     exit();
  }
  */
}