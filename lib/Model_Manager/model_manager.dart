part of AR_Manager_Library;
/*
    Author: Peter Swanson
    Description: Model Manager
      Tracks created ARKitNodes and updates them asynchronously on a loop
      ARKitNodes are wrapped in an AR_Model (see Models/Base/base_model.dart)
*/

class AR_Model_Manager {
  final Duration UPDATE_SPEED = Duration(milliseconds: 2);

  Map<String, AR_Model> _scene_models;
  Timer tick_timer;

  AR_Model_Manager()
  {
    /* Instantiate model storage and start async update loop */

    _scene_models = new Map<String, AR_Model>();
    tick_timer = new Timer.periodic(UPDATE_SPEED, (timer) => update_models());
  }
  
  AR_Model fetch(String key) => (_scene_models.containsKey(key)) ? _scene_models[key] : null;
  /* Fetch a model by key */

  void store(String key, AR_Model value) => _scene_models[key] = value;
  /* Store a model with a key to retreive it */

  void update_models() => _scene_models.forEach((_, model) => (model.is_active) ? model.update() : null);
  /* Update all models marked active (called in a loop asynchronously by the timer) */
}