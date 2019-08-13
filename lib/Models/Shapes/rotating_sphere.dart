part of AR_Models_Library;
/*
    Author: Peter Swanson
    Description: Rotating Sphere Model
      A model that demos physics mixins
*/

class AR_Sphere_Rotating extends AR_Sphere with Rotate {

  AR_Sphere_Rotating({radius = .1, is_visible = true, bool is_active = true}) : super(is_visible: is_visible, is_active: is_active, radius: radius);

  @override
  void setup() {
    apply_color(model: this, image: 'earth2.jpg');
  }

  @override
  void update() {
    rotate(model: this, y: .1);
  }
}