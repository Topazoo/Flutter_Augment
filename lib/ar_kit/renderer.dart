part of AR_Kit;

class AR_Renderer {

  ARKitController controller;

  void render_object(dynamic ar_object) => this.controller.add(ar_object);

  void onARKitViewCreated(ARKitController arkitController) {
    this.controller = arkitController;

    final node = ARKitNode(
        geometry: ARKitSphere(radius: 0.1), position: Vector3(0, 0, -0.5)
    );

    render_object(node);
  }
}