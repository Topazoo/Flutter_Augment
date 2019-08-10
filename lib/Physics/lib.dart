library AR_Physics_Library;
/*
    Author: Peter Swanson
    Description: Physics Library
      AR Physics and dependencies

      Physics are attached to models as mixins and provide auxilliary methods
      for simulating movement, collisions, and other physics behaviors.

      Since physics are mixins they can be attached to any class and their methods
      may be called by that class as if they are methods of that class.

    Mixins:
      - Movement: Methods for moving a model on the x, y or z-axis.
      - Boundaries: Methods for checking and executing functions if a model has exceeded an axis boundary.
*/

import 'package:flutter_arkit_wrapper/Models/lib.dart';

part 'movement.dart';
part 'boundaries.dart';

