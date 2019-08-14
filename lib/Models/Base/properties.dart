part of AR_Models_Library;
/*
    Author: Peter Swanson
    Description: Properties Delegate for Models
      Used to store the properties associated with a model.

      Attributes:
        Model:
          - model: The associated AR_Model. 
          - initial_position: The initial position of the model.
                              Defaults to -.5 on the z-axis.
        Base:
          - is_visible: True if the model should be displayed in the scene.
          - is_active: True if the model should be updated when the scene is updated.      
          - has_physics: True if the model has access to physics methods and properties.

        Physics (Optional):      
          - velocity: Vector added to the model's position each time the scene is updated to move the model.      
          - angular_velocity: Vector added to the model's rotatation each time the scene is updated to rotate the model.     
          - bounds: The bounds set on the model's axes.
          - out_of_bounds_callback: The callback to fire if the bounds have been exceeded.                              
*/

class AR_Model_Properties {
  // LINKED MODEL
  AR_Model model;
  Vector.Vector3 initial_position;

  // BASE PROPERTIES
  bool is_visible;
  bool is_active;
  bool has_physics;

  // PHYSICS PROPERTIES
  Vector.Vector3 velocity;
  Vector.Vector3 angular_velocity;
  
  Map bounds;
  Function out_of_bounds_callback;

  AR_Model_Properties({this.model, this.is_active = true, this.is_visible = true, this.has_physics=true, this.initial_position})
  {
    /* 
        Sets the intial position (defaults to -.5 on the z-axis) and an initial materials array.
        for the graphics mixin.
        
        Sets the initial velocity, angular_velocity, and bounds properties.
    */

    if(initial_position == null)
      initial_position = new Vector.Vector3(0, 0, -.5);

    model.node.position.value = initial_position;
    model.node.geometry.materials.value = new List<ARKitMaterial>();

    if(has_physics)
    {
      model.node.eulerAngles.value = Vector.Vector3.zero(); // Allows rotation
      this.velocity = new Vector.Vector3.zero();
      this.angular_velocity = new Vector.Vector3.zero();
      this.bounds = new Map();
    }
  }
}