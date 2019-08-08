part of AR_Models_Library;
/*
    Author: Peter Swanson
    Description: Base Model
      The base attributes and methods that all models share.

      Shared Attributes:
        - node: The ARKit node to wrap so the model manager can track
                state information.
        - is_visible: Whether the node should be shown.
        - is_active: Whether the node should be updated.   

      Shared Methods:
        - update(): Called periodically on a loop by the model manager.        
*/

class AR_Model {

  ARKitNode node;

  bool is_visible;
  bool is_active;
  
  AR_Model(ARKitNode node, {bool is_visible = true, bool is_active = true}) : 
    this.node = node, 
    this.is_visible = is_visible,
    this.is_active = is_active; 

  void update() {}
}