part of AR_Models_Library;
/*
    Author: Peter Swanson
    Description: Moving Sphere Model
      A model that demos physics mixins
*/

class AR_Sphere_Moving extends AR_Sphere with Movement, Boundaries {

  AR_Sphere_Moving({radius = .1, is_visible = true, bool is_active = true}) : super(is_visible: is_visible, is_active: is_active, radius: radius);

  @override
  void setup() {
    apply_color(model: this, image: 'earth2jpg');
  }

  @override
  void update() {
    move(model: this, y: -.001, z:-.001);
    check_bounds(model: this, bounds: {'y': -.05}, callback: out_of_bounds_callback);
  }

  void out_of_bounds_callback() => set_position(x: 0, y: 0, z: -.5);
}