part of AR_Rendering_Library;
/*
    Author: Peter Swanson
    Description: Demo Renderer
      This renderer is used to demo and optimize how renderers can be extended
      with arbitrary application logic.
*/

class Demo_Renderer extends Base_Renderer {

  Demo_Renderer() : super();

  @override
  void _setup()
  {
    render_model(model: AR_Sphere_Moving()); // Render a moving sphere
  }
}