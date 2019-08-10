part of AR_Physics_Library;
/*
    Author: Peter Swanson
    Description: Movement Mixin

      Allows the model to move along the x, y and z-axix. One or more
      axes may be specified.
*/

mixin Movement {

  void move({AR_Model model, double x = 0, double y = 0, double z = 0}) =>
  model.set_position(x: model.position.x + x, y: model.position.y + y, z: model.position.z + z);
  // Move the model on the specified axes by the specified amount

}