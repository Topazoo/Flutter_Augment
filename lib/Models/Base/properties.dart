part of AR_Models_Library;
/*
    Author: Peter Swanson
    Description: Properties Delegate for Models
*/

class AR_Model_Properties {
  AR_Model model;

  bool is_visible;
  bool is_active;

  AR_Model_Properties({model, this.is_active = true, this.is_visible = true});
}