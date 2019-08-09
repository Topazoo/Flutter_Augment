part of AR_Models_Library;
/*
    Author: Peter Swanson
    Description: Moving Sphere Model
*/

class AR_Sphere_Moving extends AR_Sphere {

  Movement mover = new Movement();

  AR_Sphere_Moving({radius = .1, is_visible = true, bool is_active = true}) :
    super(is_visible: is_visible, is_active: is_active, radius: radius);

  @override
  ARKitNode get _node => ARKitNode(geometry: ARKitSphere(radius: radius), position: position);

  @override
  void update() {
    mover.move(this, x: .0001);
  }
}