library AR_Physics_Library;
/*
    Author: Peter Swanson
    Description: Physics Library
      AR Physics and dependencies

      Physics are attached to models as mixins and provide auxilliary methods
      for simulating movement, collisions, and other physics behaviors.

    Mixins:
      - Movement: Methods for moving a model on the x, y or z axis.
*/

import 'package:flutter_arkit_wrapper/Models/lib.dart';

part 'movement.dart';
part 'boundary.dart';

