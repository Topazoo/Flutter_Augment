part of AR_Models_Library;
/*
    Author: Peter Swanson
    Description: Moving Sphere Model
      A model that demos physics mixins
*/

class AR_Sphere_Moving extends AR_Sphere {

  AR_Sphere_Moving({radius = .1}) : super(radius: radius);

  @override
  void _setup() {
    apply_color(model: this, image: 'earth2.jpg');
    physics.set_bounds(bounds: {'z': -1}, callback: out_of_bounds_callback);
    physics.set_velocity(z: -.1);
  }

  void out_of_bounds_callback() => set_position(x: 0, y: 0, z: -.5);
}