part of AR_Manager_Library;
/*
    Author: Peter Swanson
    Description: Asset Manager
      Mixin that handles loading data from files including the app configuration,
      materials and serialized models.
*/

mixin AR_Asset_Manager {

  Future<Map> _load_asset_json(String path, [Function callback]) async
  {
    /* Load an asset from the provided path. Return it or pass it to an optional callback */

    final loaded_asset = json.decode(await rootBundle.loadString('assets/$path'));

    if(callback != null)
      callback(loaded_asset);

    return loaded_asset;
  }

  Future<Map> load_config([Function callback]) => _load_asset_json('config.json');
  /* Load the configuration file with an optional callback */
}