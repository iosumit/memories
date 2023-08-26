import 'package:rememorise/apis/memories_api.dart';

import '../models/memory.dart';

class MemoriesRepository {
  final MemoriesApi _api;

  MemoriesRepository(this._api);

  Future<GetMemoriesResponse> fetchMemories() async {
    Map res = await _api.fetchMemories();
    return GetMemoriesResponse.fromJson(res);
  }

  Future<Map> addNewMemory(body) async => _api.addNewMemory(body);
  Future<Map> deleteMemory(body) async => _api.deleteMemory(body);
  Future<Map> updateMemory(body) async => _api.updateMemory(body);
}
