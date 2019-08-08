part of AR_Rendering_Library;
/*
    Author: Peter Swanson
    Description: Renderer
       Manages the scene state and objects in the scene using an
       ARKitController and a model manager.
*/

class AR_Renderer {

  ARKitController controller; // Controls the scene
  AR_Model_Manager manager;  // Controls the models on the scene

  void render_model(AR_Model model, [String key]) {
    /* Render a model to the scene. Models can be assigned a key or
       a key can be generated on insertion. Rendered models will automatically be 
       tracked by the renderer's model manager. */

    if(key == null)
      key = randomString();
    
    manager.store(key, model);
    controller.add(model.node);
  } 

  void initialize(ARKitController arkitController) {
    /* Initialize a renderer with the controller linked to the
       Flutter widget displaying the scene and a model manager. */

    controller = arkitController;
    manager = new AR_Model_Manager();

    final node = ARKitNode(
        geometry: ARKitSphere(radius: 0.1), position: Vector3(0, 0, -0.5)
    ); //DEBUG

    render_model(AR_Model(node)); //DEBUG
  }

  ARKitSceneView render() => 
    ARKitSceneView(onARKitViewCreated: initialize, showStatistics: true);
    /* Initialize the renderer and return a linked Flutter widget to display it */
}