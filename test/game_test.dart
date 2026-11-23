import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_hafiza_zinciri/oyun_hafiza_zinciri.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(hafizaZinciriConfig.title.length, 33);
    expect(hafizaZinciriConfig.tagline.length, 33);
    for (final s in hafizaZinciriConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(hafizaZinciriConfig.gameId, hafizaZinciriId);
    expect(hafizaZinciriRules.gameId, hafizaZinciriId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(hafizaZinciriRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: hafizaZinciriId, optionalMechanics: hafizaZinciriRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(hafizaZinciriRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
