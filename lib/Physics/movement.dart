part of AR_Physics_Library;
/*
    Author: Peter Swanson
    Description: Movement Mixin

*/

mixin Movement {
  void move(AR_Model model, {double x = 0, double y = 0, double z = 0}) =>
  model.set_position(x: model.position.x + x, y: model.position.y + y, z: model.position.z + z);
}