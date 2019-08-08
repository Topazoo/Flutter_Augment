part of AR_Widgets_Library;
/*
    Author: Peter Swanson
    Description: Scene
      Wraps and displays the AR scene renderer in a Flutter widget.
*/

class AR_Scene extends StatefulWidget {
  @override
  _AR_Scene_State createState() => _AR_Scene_State();
}

class _AR_Scene_State extends State<AR_Scene> {

  static final renderer = new Demo_Renderer();

  @override
  Widget build(BuildContext context) => Scaffold(body: renderer.render_scene());
}