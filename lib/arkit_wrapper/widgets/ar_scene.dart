part of AR_Widgets_Library;

class AR_Scene extends StatefulWidget {
  @override
  _AR_Scene_State createState() => _AR_Scene_State();

}

class _AR_Scene_State extends State<AR_Scene> {

  static final renderer = AR_Renderer();

  @override
  Widget build(BuildContext context) => Scaffold(body: renderer.render());
}