part of AR_Models_Library;

class AR_Model {

  ARKitNode node;

  bool is_visible;
  bool is_active;

  dynamic update_override;
  
  AR_Model(ARKitNode node, {bool is_visible = true, bool is_active = true, dynamic update_override}) : 
    this.node = node, 
    this.is_visible = is_visible,
    this.is_active = is_active, 
    this.update_override = update_override;

  void update() => (update_override != null) ? update_override() : _update();

  void _update() {}
}