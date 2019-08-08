part of AR_Rendering_Library;

class AR_Renderer {

  final bool debug;

  AR_Renderer({bool debug = true}) : this.debug = debug;

  ARKitController controller;
  AR_Object_Manager manager;

  void render_object(AR_Model model, [String key]) {
    if(key == null)
      key = randomString();
    
    manager.store(key, model);
    controller.add(model.node);
  } 

  void initialize(ARKitController arkitController) {
    controller = arkitController;
    manager = new AR_Object_Manager();

    final node = ARKitNode(
        geometry: ARKitSphere(radius: 0.1), position: Vector3(0, 0, -0.5)
    );

    render_object(AR_Model(node));
  }

  ARKitSceneView render() =>
    ARKitSceneView(
      onARKitViewCreated: initialize,
      showStatistics: true,
    );
}