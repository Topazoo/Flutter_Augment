library AR_Manager_Library;
/*
    Author: Peter Swanson
    Description: Model Manager Library
      Model and Asset manager resources and dependencies

      The model manager tracks ARKitNodes in a scene and updates them 
      asynchronously on a loop. ARKitNodes are wrapped in an AR_Model 
      so that the manager can track state information
      (see Models/Base/base_model.dart).

      The asset manager allows content to be loaded from files.
*/

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter_arkit_wrapper/Models/lib.dart';

part 'model_manager.dart';
part 'asset_manager.dart';