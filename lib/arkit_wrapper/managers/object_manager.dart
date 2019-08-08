part of AR_Managers_Library;

class AR_Object_Manager {
  final Duration TICK_SPEED = Duration(milliseconds: 2);

  Map<String, AR_Model> _scene_models;
  Timer tick_timer;

  AR_Object_Manager()
  {
    _scene_models = new Map<String, AR_Model>();
    tick_timer = new Timer.periodic(TICK_SPEED, (timer) => update_models());
  }
  
  AR_Model fetch(String key) => (_scene_models.containsKey(key)) ? _scene_models[key] : null;

  void store(String key, AR_Model value) => _scene_models[key] = value;

  void update_models() => _scene_models.forEach((_, model) => (model.is_active) ? model.update() : null);
}