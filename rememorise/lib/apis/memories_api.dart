import '../utils/api_service.dart';

class MemoriesApi {
  final String base = "http://localhost:8300";
  Future<Map> fetchMemories() async {
    try {
      final response = await ApiService.callApi(
        method: ApiService.GET,
        url: "$base/memories",
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map> addNewMemory(body) async {
    try {
      final response = await ApiService.callApi(
        method: ApiService.POST,
        body: body,
        url: "$base/memories/new",
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map> updateMemory(body) async {
    try {
      final response = await ApiService.callApi(
        method: ApiService.PUT,
        body: body,
        url: "$base/memories/update",
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map> deleteMemory(id) async {
    try {
      final response = await ApiService.callApi(
        method: ApiService.DELETE,
        url: "$base/memories/$id",
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
