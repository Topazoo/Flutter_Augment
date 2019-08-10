part of AR_Manager_Library;
/*
    Author: Peter Swanson
    Description: Asset Manager
      Handles loading data from files including app configuration and
      serialized models.
*/

mixin AR_Asset_Manager {
  Future<Map> _load_asset_json(String path) async => json.decode(await rootBundle.loadString('assets/$path'));
  /* Load an asset from the provided path */

  Future<Map> load_config() => _load_asset_json('config.json');
  /* Load the configuration file */
}