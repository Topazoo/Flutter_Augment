part of AR_Rendering_Library;
/*
    Author: Peter Swanson
    Description: Demo Renderer

*/

class Demo_Renderer extends Base_Renderer {

  Demo_Renderer() : super();

  @override
  void _setup()
  {
    render_model(model: AR_Sphere()); //DEBUG
  }
}