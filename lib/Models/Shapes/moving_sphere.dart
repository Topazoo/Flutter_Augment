part of AR_Models_Library;
/*
    Author: Peter Swanson
    Description: Moving Sphere Model
*/

class AR_Sphere_Moving extends AR_Sphere with Movement, Boundaries {

  Movement mover;

  AR_Sphere_Moving({radius = .1, is_visible = true, bool is_active = true}) : super(is_visible: is_visible, is_active: is_active, radius: radius);

  @override
  ARKitNode get _node => 
  ARKitNode(
    geometry: ARKitSphere(radius: radius),
    physicsBody: ARKitPhysicsBody(
      ARKitPhysicsBodyType.kinematic,
    ),
    position: position
  );

  @override
  void update() {
    move(this, y: -.0001, z:-.0001);
    check_bounds(this, {'y': -.01}, out_of_bounds_callback);
  }

  void out_of_bounds_callback() => set_position(x: 0, y: 0, z: -.5);
}