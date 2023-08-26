import 'package:flutter/material.dart';
import 'package:rememorise/models/memory.dart';
import 'package:rememorise/repositories/memories_repository.dart';

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
}
