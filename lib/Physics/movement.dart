part of AR_Physics_Library;
/*
    Author: Peter Swanson
    Description: Movement Mixin

*/

class Movement {
  Map<String, double> bounds;

  Movement({bounds})
  {
    (bounds != null) ? this.bounds = bounds : this.bounds = {};
  }

  Map<String, double> _bound_move(AR_Model model, double x, double y, double z)
  {
    Map<String, double> true_move = {'x': x, 'y': y, 'z': z};

    if((x > 0 && bounds.containsKey('x-pos') && bounds['x-pos'] <= model.position.x + x) ||
      x < 0 && bounds.containsKey('x-neg') && bounds['x-neg'] <= (model.position.x + x).abs())
      true_move['x'] = 0;

    if((y > 0 && bounds.containsKey('y-pos') && bounds['y-pos'] <= model.position.y + y) ||
      y < 0 && bounds.containsKey('y-neg') && bounds['y-neg'] <= (model.position.y + y).abs())
      true_move['y'] = 0;

    if((z > 0 && bounds.containsKey('z-pos') && bounds['z-pos'] <= model.position.z + z) ||
      z < 0 && bounds.containsKey('z-neg') && bounds['z-neg'] <= (model.position.z + z).abs())
      true_move['z'] = 0;

    return true_move;
  }

  void move(AR_Model model, {double x = 0, double y = 0, double z = 0})
  {
    Map<String, double> true_move = _bound_move(model, x, y, z);
    
    model.position.setValues(model.position.x + true_move['x'], model.position.y + true_move['y'], model.position.z + true_move['z']);
    model.node.position.value = Vector3(model.position.x + true_move['x'], model.position.y + true_move['y'], model.position.z + true_move['z']);
  }
}