part of AR_Rendering_Library;

class AR_Renderer {

  final bool debug;

  AR_Renderer({bool debug = true}) : this.debug = debug;

  ARKitController controller;

  void render_object(dynamic ar_object) => this.controller.add(ar_object);

  void initialize(ARKitController arkitController) {
    this.controller = arkitController;

    final node = ARKitNode(
        geometry: ARKitSphere(radius: 0.1), position: Vector3(0, 0, -0.5)
    );

    render_object(node);
  }

  ARKitSceneView render() =>
    ARKitSceneView(
      onARKitViewCreated: initialize,
      showStatistics: true,
    );
}