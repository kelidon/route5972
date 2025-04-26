class PlotDataManager {
  String? getDialogIdByNPC(String npcId, List<String> inventory) {
    return switch (npcId) {
      'npc1' =>
          inventory.contains('taria_reject')?
              'loc1-char1-end-fail':
        inventory.contains('taria_race_win')
            ? 'loc1-char1-after-win'
            : inventory.contains('taria_race_access')
            ? 'loc1-char1-2'
            : 'loc1-char1-1',
      'npc2' => inventory.contains('encrypted_audio_log') ? 'loc1-char2-4' : 'loc1-char2-1',
      'npc3' => inventory.contains('experimental_ship_hull') ? 'loc2-char3-3' : 'loc2-char3-1',
      'npc4' => inventory.contains('nolan_race_win') ? 'loc2-char4-after-win' : 'loc2-char4-1',
      'npc5' => 'loc3-char-5-1',
      'npc6' => 'loc3-char-6-1',
      _ => null,
    };
  }

  List<String>? getNPCIdsByLocation(String locationId, List<String> inventory) {
    return switch (locationId) {
      'loc1' => ['npc1', 'npc2'],
      'loc2' => ['npc3', if (inventory.contains('encrypted_audio_log')) 'npc4'],
      'loc3' => [
        if (inventory.contains('roxy_access')) 'npc5',
        if (inventory.contains('agent_access')) 'npc6',
      ],
      _ => null,
    };
  }
}
