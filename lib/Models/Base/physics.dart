part of AR_Models_Library;
/*
    Author: Peter Swanson
    Description: Physics Delegate for Models
*/

class AR_Model_Physics with Movement, Rotation, Boundaries{
  AR_Model model;

  Vector.Vector3 velocity;
  Vector.Vector3 angular_velocity;
  
  Map bounds;
  Function out_of_bounds_callback;

  AR_Model_Physics({this.model, velocity, angular_velocity, this.bounds})
  {
    (velocity != null) ? this.velocity = velocity : this.velocity = new Vector.Vector3.zero();
    (angular_velocity != null) ? this.angular_velocity = angular_velocity : this.angular_velocity = new Vector.Vector3.zero();
  } 

  void set_velocity({double x = 0, double y = 0, double z = 0}) => this.velocity = new Vector.Vector3(x, y, z);
  void set_angular_velocity({double x = 0, double y = 0, double z = 0}) => this.angular_velocity = new Vector.Vector3(x, y, z);
  void set_bounds({Map bounds, Function callback}) {this.bounds = bounds; this.out_of_bounds_callback = callback;}

  void physics_update() {
    rotate(model: model, x: angular_velocity.x, y: angular_velocity.y, z: angular_velocity.z);
    move(model: model, x: velocity.x, y: velocity.y, z: velocity.z);

    if(bounds != null)
      check_bounds(model: model, bounds: bounds, callback: out_of_bounds_callback);
  }

}