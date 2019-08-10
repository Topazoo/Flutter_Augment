part of AR_Rendering_Library;
/*
    Author: Peter Swanson
    Description: Base Renderer
       Shared logic for managing the scene state and objects in the scene using an ARKitController and a model manager.

    Shared Attributes:
      - controller: The ARKit controller. It manages the scene and serves as a bridge between 
                    the backend and frontend. It handles adding models to the scene and global events.
      - manager: The model manager. It tracks the currently displayed models and delegates periodic state updates to them.
      - update_timer: A timer that causes the scene and it's displayed models to rebuild their states.
      - UPDATE_SPEED: The frequency that the update timer should fire.

    Shared Methods:
      - render(): Sets the controller and delegate application setup to derived class.
      - update_loop(): Called when the update timer fires. Updates all active models and calls derived class update logic.
      - render_model(): Render a model to the scene. The model is tracked automatically by the model manager.
      - render_scene(): Calls render() when a controller has been successfully created and linked to the widget displaying the app.

    Abstract Methods:
      - _setup(): Runs after render(). Overridden by derived classes for specific renderer setup.
      - _update(): Runs when the update timer fires. Overridden by derived classes for specific update logic.
*/

abstract class Base_Renderer extends StatefulWidget {

  @override
  _Base_Renderer_State createState() => _Base_Renderer_State();
  
}

class _Base_Renderer_State extends State<Base_Renderer> {

  ARKitController controller; 
  AR_Model_Manager manager;
  
  Timer update_timer;
  final Duration UPDATE_SPEED = Duration(milliseconds: 1);

  _Base_Renderer_State()
  {
    /* Instantiate model manager and start update timer */

     manager = new AR_Model_Manager();
     update_timer = new Timer.periodic(UPDATE_SPEED, (timer) => update_loop());
  }

  void render(ARKitController arkitController) {
    /* Set the controller and delegate application setup to derived class */

    controller = arkitController;

    _setup();
  }

  void update_loop() {
    /* Shared periodic AR application logic. Update all active models and call derived class logic */

    manager.update_models(); 

    _update();
  }

  String render_model({String key, AR_Model model}) {
    /* Render a model to the scene. Models can be assigned a key or
       a key can be generated on insertion. Rendered models will automatically be 
       tracked by the renderer's model manager */

    if(key == null)
      key = randomString();
    
    manager.store(key, model); // Track the model for updates
    controller.add(model.node); // Display the model

    return key;
  } 

  ARKitSceneView render_scene() => 
    ARKitSceneView(onARKitViewCreated: render, worldAlignment: ARWorldAlignment.camera);
    /* Initialize the renderer on successfull ARKit instantiation.
       Return a linked Flutter widget to display it */

  void _setup() {}
  /* Overridden in derived classes to add AR application setup logic */

  void _update() {} 
  /* Overridden in derived classes to add periodic AR application logic */
 
  @override
  Widget build(BuildContext context) => render_scene();
  /* Render the scene in a scaffold */
}