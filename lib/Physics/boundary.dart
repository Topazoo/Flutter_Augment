part of AR_Physics_Library;
/*
    Author: Peter Swanson
    Description: Boundaries Mixin

*/

mixin Boundaries {
  void _out_of_bounds_handler(AR_Model model, Function callback, String axis, num bound, num value)
  {
    if(callback != null)
    {
      try {
        callback({'axis': axis, 'bound': bound, 'pos': value});
      } catch (e) {
        callback();
      }
    }
  }

  bool _in_boundry(AR_Model model, Function callback, Map bounds, String axis, double next_pos)
  {
    if(bounds.containsKey(axis))
    {
      dynamic bound = bounds[axis];

      if(bound != null && bound is num)
        bound = List.from([bound]);

      if(bound != null && bound is List)
      {
        for(num b in bound)
        {
          if(b.abs() <= next_pos.abs())
          {
            _out_of_bounds_handler(model, callback, axis, b, next_pos);
            return false;
          }
        } 
      }
    }

    return true;
  }

  bool check_bounds(AR_Model model, Map bounds, Function callback)
  {
    for(MapEntry<String, double> axis in {
      'x': model.position.x, 'y': model.position.y, 'z': model.position.z
    }
    .entries)
    {
      
      if(! _in_boundry(model, callback, bounds, axis.key, axis.value))
        return false;
    }

    return true;
  }
}