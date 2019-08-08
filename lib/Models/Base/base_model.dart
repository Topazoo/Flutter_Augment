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

abstract class AR_Model {

  ARKitNode node;
  Vector3 position;

  bool is_visible;
  bool is_active;

  ARKitNode get _node;
  
  AR_Model({ARKitNode node, Vector3 position, bool is_visible = true, bool is_active = true}) : this.is_visible = is_visible, this.is_active = is_active
  {
      (position != null) ? this.position = position : (node != null) ? this.position = node.position.value : this.position = Vector3(0, 0, -0.5);
      (node != null) ? this.node = node : this.node = _node;
  } 

  void update() {}
}