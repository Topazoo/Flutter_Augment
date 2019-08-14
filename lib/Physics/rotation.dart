part of AR_Physics_Library;
/*
    Author: Peter Swanson
    Description: Rotation Mixin

      Allows the model to rotate on the x, y and z-axix. One or more
      axes may be specified.
*/

mixin Rotation {

  void rotate({AR_Model model, double x = 0, double y = 0, double z = 0}) =>
  model.set_rotation(x: model.node.eulerAngles.value.x + x, y: model.node.eulerAngles.value.y + y, z: model.node.eulerAngles.value.z + z);
  // Rotate the model on the specified axes by the specified amount

}