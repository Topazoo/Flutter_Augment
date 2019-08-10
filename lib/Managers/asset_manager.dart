part of AR_Manager_Library;
/*
    Author: Peter Swanson
    Description: Asset Manager
      Mixin that handles loading data from files including app configuration and
      serialized models.
*/

mixin AR_Asset_Manager {

  Future<Map> _load_asset_json(String path, [Function callback]) async => 
  (callback != null) ? callback(json.decode(await rootBundle.loadString('assets/$path'))) :
                       json.decode(await rootBundle.loadString('assets/$path'));
  /* Load an asset from the provided path. Return it or pass it to an optional callback */

  Future<Map> load_config([Function callback]) => _load_asset_json('config.json');
  /* Load the configuration file with an optional callback */
}