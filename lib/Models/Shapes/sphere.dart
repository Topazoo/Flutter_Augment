part of AR_Models_Library;
/*
    Author: Peter Swanson
    Description: Sphere Model
*/

class AR_Sphere extends AR_Model {
  double radius;
  Vector.Vector3 initial_position = Vector.Vector3(0, 0, -0.5);

  AR_Sphere({this.radius = .1, bool has_physics = true, is_visible = true, bool is_active = true}) :
    super(has_physics: has_physics, is_visible: is_visible, is_active: is_active);

  @override
  ARKitNode get _node => ARKitNode(geometry: ARKitSphere(radius: radius), position: initial_position);
}