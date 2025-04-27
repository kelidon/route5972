import 'dart:async';

import 'package:route5972/plot/model/dialog_data.dart';
import 'package:route5972/plot/model/npc_data.dart';
import 'package:route5972/plot/plot_data_manager.dart';
import 'package:route5972/plot/plot_repo.dart';
import 'package:rxdart/rxdart.dart';

class PlotService {
  final PlotRepo _repo = PlotRepo();
  final PlotDataManager _dataManager = PlotDataManager();

  final Set<String> inventory = {};

  Future<void> loadData() => _repo.loadData();

  final StreamController<DialogData> _currentDialogController = BehaviorSubject<DialogData>();

  Stream<DialogData>? get currentDialogStream => _currentDialogController.stream;

  void showDialog(DialogData data) {
    _currentDialogController.add(data);
  }

  NPCData? getNPC(String npcId) {
    final npc = _repo.getNPC(npcId);
    if (npc == null) {
      return null;
    }
    return npc;
  }

  DialogData? getNPCDialog(String npcId) {
    final dialogId = _dataManager.getDialogIdByNPC(npcId, inventory.toList());

    if (dialogId == null) {
      return null;
    }

    return _repo.getDialog(dialogId);
  }

  List<NPCData> getNPCsByLocation(String locationId) {
    final npcIds = _dataManager.getNPCIdsByLocation(locationId, inventory.toList());

    if (npcIds == null) {
      return [];
    }

    return npcIds.map((id) => _repo.getNPC(id)).whereType<NPCData>().toList();
  }

  Type getTypeById(String id) {
    if (_repo.races.containsKey(id)) {
      return _repo.races[id]!.runtimeType;
    } else if (_repo.dialogs.containsKey(id)) {
      return _repo.dialogs[id]!.runtimeType;
    } else if (_repo.items.containsKey(id)) {
      return _repo.items[id]!.runtimeType;
    } else if (_repo.endings.containsKey(id)) {
      return _repo.endings[id]!.runtimeType;
    } else if (_repo.locations.containsKey(id)) {
      return _repo.locations[id]!.runtimeType;
    } else if (_repo.npcs.containsKey(id)) {
      return _repo.npcs[id]!.runtimeType;
    } else if (_repo.ships.containsKey(id)) {
      return _repo.ships[id]!.runtimeType;
    }
    throw Exception('No data found for id: $id');
  }
}
