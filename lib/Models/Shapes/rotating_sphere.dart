part of AR_Models_Library;
/*
    Author: Peter Swanson
    Description: Rotating Sphere Model
      A model that demos physics 
*/

class AR_Sphere_Rotating extends AR_Sphere {

  AR_Sphere_Rotating() : super();

  @override
  void _setup() {
    apply_texture(model: this, image: 'earth2.jpg');
    set_angular_velocity(y: .001);
  }
}