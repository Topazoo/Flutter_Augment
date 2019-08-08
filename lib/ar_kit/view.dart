part of AR_Kit;

class AR_View extends StatefulWidget {
  @override
  _AR_View_State createState() => _AR_View_State();
}

class _AR_View_State extends State<AR_View> {

  static final renderer = AR_Renderer();

  @override
  Widget build(BuildContext context) => Scaffold(
      body: ARKitSceneView(onARKitViewCreated: renderer.onARKitViewCreated)
  );
}