part of AR_Models_Library;
/*
    Author: Peter Swanson
    Description: Base Model
      The base attributes and methods that all models share.

      Shared Attributes:
        - node: The ARKit node to wrap so the model manager can track
                state information. The node can either be inherited via
                the _node property or passed via the constructor.
        - Position: The x,y and z coordiantes of the model.
        - is_visible: Whether the node should be shown.
        - is_active: Whether the node should be updated.   

      Shared Methods:
        - update(): Called periodically on a loop by the renderer.
        - set_position(): Sets the node position if it exists.

      Shared Properties:    
        - _node: Used by derived classes to instantiate a node when
                 a model is instantiated, instead of passing it via
                 the constructor.     
*/

class AR_Model with AR_Graphics {

  ARKitNode node;
  Vector.Vector3 position = Vector.Vector3(0, 0, -0.5);

  bool is_visible;
  bool is_active;
  
  AR_Model({ARKitNode node, Vector.Vector3 position, bool is_visible = true, bool is_active = true}) : 
    this.is_visible = is_visible, this.is_active = is_active
  {
    /* Instantiate at a given position (if given) with a given node (if given). 
       Otherwise default to the node created on instantiation */

    (node != null) ? this.node = node : this.node = _node;
    (position != null) ? this.position = position : (node != null) ? this.position = node.position.value : null;

    this.node.geometry.materials.value = new List<ARKitMaterial>();
  } 

  void set_position({double x, double y, double z})
  {
    /* Set the position of the node if it exists */

    if(node != null)
    {
      position.setValues(x, y, z);
      node.position.value = new Vector.Vector3(x, y, z);
      node.position.notifyListeners(); /* Fun note: This is supposed to be a debug function only for testing but 
                                          the listner doesn't fire unless I use it. */
    }
  }

  ARKitNode get _node => null;
  /* Derived classes can override this to create a node on instantiation */

  void update() {}
  /* Derived classes can override this to add specific functionalities to
     perform each time the main loop executes */

  void setup() {}
  /* Derived classes can override this to add specific functionalities to
     perform before the main loop executes */
}