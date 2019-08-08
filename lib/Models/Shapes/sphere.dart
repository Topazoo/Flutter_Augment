part of AR_Models_Library;
/*
    Author: Peter Swanson
    Description: Sphere Model
      A sphere model (testing for now)
*/

class AR_Sphere extends AR_Model {
  double radius;

  AR_Sphere({radius = .1, is_visible = true, bool is_active = true}) : this.radius = radius,
    super(is_visible: is_visible, is_active: is_active);

  @override
  ARKitNode get _node => ARKitNode(geometry: ARKitSphere(radius: radius), position: position);
}