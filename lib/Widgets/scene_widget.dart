part of AR_Widgets_Library;
/*
    Author: Peter Swanson
    Description: Scene
      Wraps and displays the AR scene renderer in a Flutter widget.
*/

class AR_Scene_Widget extends StatefulWidget {
  
  Base_Renderer renderer;

  AR_Scene_Widget({Base_Renderer renderer}) : this.renderer = renderer;
  /* Scenes take an arbitrary renderer to control the logic, and use it to
     display the application */
  
  @override
  _AR_Scene_State createState() => _AR_Scene_State();
}

class _AR_Scene_State extends State<AR_Scene_Widget> {
 
  @override
  Widget build(BuildContext context) => Scaffold(body: widget.renderer.render_scene());
  /* Render the scene in a scaffold */
}