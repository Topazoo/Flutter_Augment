part of AR_Rendering_Library;
/*
    Author: Peter Swanson
    Description: Base Renderer
       Shared logic for managing the scene and objects in the scene using an ARKitController and a model manager attached to
       a Flutter widget.

    Shared Attributes:
      - controller: The ARKit controller. It manages the scene and serves as a bridge between 
                    the backend and frontend. It handles adding models to the scene and global events.
      - manager: The model manager. It tracks the currently displayed models and delegates periodic state updates to them.
      - update_timer: A timer that causes the scene and it's displayed models to rebuild their states.
      - UPDATE_SPEED: The frequency that the update timer should fire.

    Shared Methods:
      - setup(): Sets the controller and delegate application setup to derived class.
      - update_loop(): Called when the update timer fires. Updates all active models and calls derived class update logic.
      - render_model(): Render a model to the scene. The model is tracked automatically by the model manager.
      - render(): Calls render() when a controller has been successfully created and linked to the widget displaying the app.
      - build(): Creates the Flutter widget and renders the app.

    Abstract Methods:
      - _setup(): Runs after render(). Overridden by derived classes for specific renderer setup.
      - _update(): Runs when the update timer fires. Overridden by derived classes for specific update logic.
*/

abstract class Base_Renderer extends StatefulWidget {

  @override
  _Base_Renderer_State createState() => _Base_Renderer_State();

}

class _Base_Renderer_State extends State<Base_Renderer> with AR_Asset_Manager {

  ARKitController controller; 
  AR_Model_Manager model_manager;

  Map config;
  
  Timer update_timer;

  _Base_Renderer_State()
  {
    /* Instantiate model manager, load the configuration and start update timer */

    load_config().then((config) // Asset loading must be asynchronous
    {
      this.config = config;
      model_manager = new AR_Model_Manager();
      update_timer = new Timer.periodic(Duration(milliseconds: config['UPDATE_INTERVAL_MS']), (timer) => update_loop());
    });
  }

  void setup(ARKitController arkitController) {
    /* Set the controller and set up all models (after derived class setup logic) */

    controller = arkitController;

    _setup();

    model_manager.setup_models();
  }

  void update_loop() {
    /* Shared periodic AR application logic. Update all active models and call derived class logic */

    model_manager.update_models(); 

    _update();
  }

  String render_model({String key, AR_Model model}) {
    /* Render a model to the scene. Models can be assigned a key or
       a key can be generated on insertion. Rendered models will automatically be 
       tracked by the renderer's model manager */

    if(key == null)
      key = randomString();
    
    model_manager.store(key, model); // Track the model for updates
    controller.add(model.node); // Display the model

    return key;
  } 

  ARKitSceneView render() => 
    ARKitSceneView(onARKitViewCreated: setup);
    /* Initialize the renderer on successfull ARKit instantiation.
       Return a linked Flutter widget to display it */

  @override
  Widget build(BuildContext context) => render();
  /* Render the scene as a Flutter widget */

  void _setup() {}
  /* Overridden in derived classes to add AR application setup logic */

  void _update() {} 
  /* Overridden in derived classes to add periodic AR application logic */
}