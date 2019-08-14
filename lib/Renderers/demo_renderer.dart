part of AR_Rendering_Library;
/*
    Author: Peter Swanson
    Description: Demo Renderer
      This renderer is used to demo and optimize how renderers can be extended
      with arbitrary application logic.
*/

class Demo_Renderer extends Base_Renderer {

  @override
  _Demo_Renderer_State createState() => _Demo_Renderer_State();
  
}

class _Demo_Renderer_State extends _Base_Renderer_State {

  @override
  void _setup()
  {
    render_model(model: AR_Sphere_Rotating()); // Render a moving sphere
  }
  
}