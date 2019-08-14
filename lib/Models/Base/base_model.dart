part of AR_Models_Library;
/*
    Author: Peter Swanson
    Description: Base Model
      The base attributes and methods that all models share.

      Shared Attributes:
        - node: The ARKit node to wrap so the model manager can track
                state information. The node can either be inherited via
                the _node property or passed via the constructor.
        - physics: Physics delegate that allows stateful physics properties
                   like velocity that are applied each time the model is
                   updated.
        - properties: Properties delegate that stores the model's properties
                      (See properties.dart).   

      Shared Methods:
        Control:
          - setup(): Called when the model is added to the scene.
          - update(): Called periodically on a loop by the renderer.
        
        Physics:
        - set_position(): Sets the node position if it exists.
        - set_rotation(): Sets the node rotation if it exists.
        - set_velocity(): Set a velocity to modify the node's position when update() is called.
        - set_angular_velocity(): Set an angular velocity to modify the node's rotation when update() is called.
        - set_bounds(): Set position boundaries and a callback to fire if they are exceeded.

      Extendable Methods:
        - _setup(): Called when the model is added to the scene. Overridden by 
                    derived classes for specific model setup.
        - _update(): Called periodically on a loop by the renderer. Overridden 
                     by derived classes for specific model update logic.
        - _node: Used by derived classes to instantiate a node when
                 a model is instantiated, instead of passing it via
                 the constructor.
*/

class AR_Model with AR_Model_Graphics, Movement, Rotation, Boundaries {

  ARKitNode node;
  AR_Model_Properties properties;
  
  AR_Model({ARKitNode node, Vector.Vector3 position, bool has_physics = true, bool is_visible = true, bool is_active = true})
  {
    /* Instantiate at a given position (if given) with a given node (if given). 
       Otherwise default to the node created on instantiation.

       Set up initial model properties.
    */

    (node != null) ? this.node = node : this.node = _node;
    
    properties = new AR_Model_Properties(model:this, is_active: is_active, is_visible: is_active, has_physics: has_physics, initial_position: position);
  } 

  void set_position({double x, double y, double z})
  {
    /* Set the position of the node if it exists */

    if(node != null)
    {
      node.position.value = new Vector.Vector3(x, y, z);
      node.position.notifyListeners(); /* Fun note: This is supposed to be a debug function only for testing but 
                                          the listner doesn't fire unless I use it. */
    }
  }

  void set_rotation({double x, double y, double z})
  {
    /* Set the rotation of the node if it exists */

    if(node != null)
    {
      node.eulerAngles.value = new Vector.Vector3(x, y, z);
      node.eulerAngles.notifyListeners(); /* Fun note: This is supposed to be a debug function only for testing but 
                                          the listner doesn't fire unless I use it. */
    }
  }

  void set_velocity({double x = 0, double y = 0, double z = 0}) => properties.velocity = new Vector.Vector3(x, y, z);
  /* Set a velocity to modify the node's position when update() is called */

  void set_angular_velocity({double x = 0, double y = 0, double z = 0}) => properties.angular_velocity = new Vector.Vector3(x, y, z);
  /* Set an angular velocity to modify the node's rotation when update() is called */
  
  void set_bounds({Map bounds, Function callback}) {properties.bounds = bounds; properties.out_of_bounds_callback = callback;}
  /* Set position boundaries and a callback to fire if they are exceeded */

  void _physics_update() {
    /* Render all persistent physics on model update.

       Rotate the model if angular velocity is set.
       Move the model if velocity is set and check if it has exceeded it's bounds.
    */

    rotate(model: this, x: properties.angular_velocity.x, y: properties.angular_velocity.y, z: properties.angular_velocity.z);
    move(model: this, x: properties.velocity.x, y: properties.velocity.y, z: properties.velocity.z);
    check_bounds(model: this, bounds: properties.bounds, callback: properties.out_of_bounds_callback);
  }

  ARKitNode get _node => null;
  /* Derived classes can override this to create a node on instantiation */

  void update()
  {
    /* Update logic shared by all models.
      
       Render model physics updates if physics are applied then call derived class update logic.
    */
    
    if(properties.has_physics)
      _physics_update();

    _update();
  }

  void setup() => _setup();
  /* Setup logic shared by all models */

  void _update() {}
  /* Derived classes can override this to add specific functionalities to
     perform each time the main loop executes */

  void _setup() {}
  /* Derived classes can override this to add specific functionalities to
     perform before the main loop executes */
}