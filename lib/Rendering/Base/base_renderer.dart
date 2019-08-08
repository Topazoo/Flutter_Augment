part of AR_Rendering_Library;
/*
    Author: Peter Swanson
    Description: Base Renderer
       Shared logic for managing the scene state and objects in the scene using an
       ARKitController and a model manager.
*/

abstract class Base_Renderer {

  ARKitController controller; // Controls the scene
  AR_Model_Manager manager;  // Controls the models on the scene

  Base_Renderer() : manager = new AR_Model_Manager();

  String render_model({String key, AR_Model model}) {
    /* Render a model to the scene. Models can be assigned a key or
       a key can be generated on insertion. Rendered models will automatically be 
       tracked by the renderer's model manager. */

    if(key == null)
      key = randomString();
    
    manager.store(key, model);
    controller.add(model.node);

    return key;
  } 

  void render(ARKitController arkitController) {
    /* Initialize a renderer with the controller linked to the
       Flutter widget displaying the scene and a model manager. */

    controller = arkitController;
    _render();
  }

  void _render();

  ARKitSceneView render_scene() => 
    ARKitSceneView(onARKitViewCreated: render, showStatistics: true);
    /* Initialize the renderer and return a linked Flutter widget to display it */
}