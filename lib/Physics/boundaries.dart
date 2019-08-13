part of AR_Physics_Library;
/*
    Author: Peter Swanson
    Description: Boundaries Mixin
      Used to set position boundaries on a model. When a model exceeds these boundaries a callback is
      fired. When attached to a model, the model's bounds can be checked with check_bounds(). check_bounds()
      returns a boolean value, but can accept an optional callback to get detailed information about the specific
      boundary crossed.

      Boundaries format:
      {
        'x': -1,      // Sets a negative x-axis boundary
        'y': [1, -.5] // Sets a negative and positive y-axis boundary (order-insensitive)
                      // No z-axis boundary
      }

      The callback can take an optional map parameter to get detailed information about the boundary 
      that was crossed.
      
      Details format:
      {
        'axis': 'y',  // Exceeded the y-axis boundary
        'bound' '-.5' // Exceeded the boundary set at -.5
      }
*/

mixin Boundaries {
  void _out_of_bounds_handler(AR_Model model, Function callback, String axis, num bound)
  {
    /* Handle a model going out of bounds by calling the passed callback (if one exists) 
       Attempt to fire the callback with detailed information and fall back on no parameters */

    if(callback != null)
    {
      try {
        callback({'axis': axis, 'bound': bound});
      } catch (e) {
        callback();
      }
    }
  }

  bool _in_boundry(AR_Model model, Function callback, Map bounds, String axis, double pos)
  {
    /* Check the bounds on a specific axis if that axis has bounds. If a bound is exceeded, 
       call the callback if that exists. */

    if(bounds.containsKey(axis))
    {
      dynamic bound = bounds[axis];

      // Convert single (non-list) bounds to a list simplify things
      if(bound != null && bound is num) 
        bound = List.from([bound]);

      if(bound != null && bound is List)
      {
        for(num b in bound)
        {
          if(b.abs() <= pos.abs())
          {
            _out_of_bounds_handler(model, callback, axis, b);
            return false;
          }
        } 
      }
    }

    return true;
  }

  bool check_bounds({AR_Model model, Map bounds, Function callback})
  {
    /* Check if the passed model has exceeded any of the passed boundaries and
       call the passed callback if it exists. */

    // Convert the model position to the same format as the bounds and check each axis
    for(MapEntry<String, double> axis in {
      'x': model.node.position.value.x, 'y': model.node.position.value.y, 'z': model.node.position.value.z
    }
    .entries)
    {
      if(! _in_boundry(model, callback, bounds, axis.key, axis.value))
        return false;
    }

    return true;
  }
}