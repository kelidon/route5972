import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:route5972/plot/model/dialog_data.dart';
import 'package:route5972/plot/model/ending_data.dart';
import 'package:route5972/plot/model/item_data.dart';
import 'package:route5972/plot/model/location_data.dart';
import 'package:route5972/plot/model/npc_data.dart';
import 'package:route5972/plot/model/race_data.dart';
import 'package:route5972/plot/model/ship_data.dart';

class PlotRepo {
  PlotRepo();

  final Map<String, DialogData> dialogs = {};
  final Map<String, EndingData> endings = {};
  final Map<String, ItemData> items = {};
  final Map<String, LocationData> locations = {};
  final Map<String, NPCData> npcs = {};
  final Map<String, RaceData> races = {};
  final Map<String, ShipData> ships = {};

  DialogData? getDialog(String id) => dialogs[id];

  EndingData? getEnding(String id) => endings[id];

  ItemData? getItem(String id) => items[id];

  LocationData? getLocation(String id) => locations[id];

  NPCData? getNPC(String id) => npcs[id];

  RaceData? getRace(String id) => races[id];

  ShipData? getShip(String id) => ships[id];

  Future<void> loadData() async {
    await loadDialogs();
    await loadEndings();
    await loadItems();
    await loadLocations();
    await loadNPCs();
    await loadRaces();
    await loadShips();
  }

  Future<void> loadDialogs() async {
    final jsonString = await rootBundle.loadString('assets/data/dialogs.json');

    final List<DialogData> dialogDataList =
        (json.decode(jsonString) as List).map((data) => DialogData.fromJson(data)).toList();

    dialogs.addAll({for (var data in dialogDataList) data.id: data});
  }

  Future<void> loadEndings() async {
    final jsonString = await rootBundle.loadString('assets/data/endings.json');

    final List<EndingData> endingDataList =
        (json.decode(jsonString) as List).map((data) => EndingData.fromJson(data)).toList();

    endings.addAll({for (var data in endingDataList) data.id: data});
  }

  Future<void> loadItems() async {
    final jsonString = await rootBundle.loadString('assets/data/items.json');

    final List<ItemData> itemDataList =
        (json.decode(jsonString) as List).map((data) => ItemData.fromJson(data)).toList();

    items.addAll({for (var data in itemDataList) data.id: data});
  }

  Future<void> loadLocations() async {
    final jsonString = await rootBundle.loadString('assets/data/locations.json');

    final List<LocationData> locationDataList =
        (json.decode(jsonString) as List).map((data) => LocationData.fromJson(data)).toList();

    locations.addAll({for (var data in locationDataList) data.id: data});
  }

  Future<void> loadNPCs() async {
    final jsonString = await rootBundle.loadString('assets/data/npcs.json');

    final List<NPCData> npcDataList =
        (json.decode(jsonString) as List).map((data) => NPCData.fromJson(data)).toList();

    npcs.addAll({for (var data in npcDataList) data.id: data});
  }

  Future<void> loadRaces() async {
    final jsonString = await rootBundle.loadString('assets/data/races.json');

    final List<NPCData> npcDataList =
        (json.decode(jsonString) as List).map((data) => NPCData.fromJson(data)).toList();

    npcs.addAll({for (var data in npcDataList) data.id: data});
  }

  Future<void> loadShips() async {
    final jsonString = await rootBundle.loadString('assets/data/ships.json');

    final List<ShipData> shipDataList =
        (json.decode(jsonString) as List).map((data) => ShipData.fromJson(data)).toList();

    ships.addAll({for (var data in shipDataList) data.id: data});
  }
}
