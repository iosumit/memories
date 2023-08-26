import 'package:flutter/material.dart';
import 'package:rememorise/models/memory.dart';
import 'package:rememorise/repositories/memories_repository.dart';
import 'package:rememorise/utils/consts.dart';

class MemoriesBloc extends ChangeNotifier {
  List<Memory> memories = [];
  bool isSyncing = false;
  final MemoriesRepository _repository;

  MemoriesBloc(this._repository);

  Future<List<Memory>?> fetchMemory() async {
    try {
      isSyncing = true;
      notifyListeners();
      final res = await _repository.fetchMemories();
      isSyncing = false;
      if (res.data != null) {
        memories = res.data!;
        notifyListeners();
        return res.data!;
      } else {
        throw res;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String> addNewMemory(body) async {
    try {
      final res = await _repository.addNewMemory(body);
      if (res['data'] != null) {
        return "";
      } else {
        throw res;
      }
    } catch (e) {
      if (e is Map && e.containsKey('message')) {
        return e['message'];
      }
      return Strings.errorDefaultMessage;
    }
  }

  Future<String> updateMemory(body) async {
    try {
      final res = await _repository.updateMemory(body);
      if (res['data'] != null) {
        return "";
      } else {
        throw res;
      }
    } catch (e) {
      if (e is Map && e.containsKey('message')) {
        return e['message'];
      }
      return Strings.errorDefaultMessage;
    }
  }

  Future<String> deleteMemory(id) async {
    try {
      final res = await _repository.deleteMemory(id);
      if (res['status'] != 'Error') {
        return "";
      } else {
        throw res;
      }
    } catch (e) {
      if (e is Map && e.containsKey('message')) {
        return e['message'];
      }
      return Strings.errorDefaultMessage;
    }
  }
}
