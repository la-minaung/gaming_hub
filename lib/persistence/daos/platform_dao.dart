import 'package:gaming_hub/data/vos/platform_vo.dart';

abstract class PlatformDao {
  Stream<void> getPlatformEventStream();
  Stream<List<PlatformVO>> getPlatformStream();
  List<PlatformVO> getPlatforms();
  void savePlatforms(List<PlatformVO> platformList);
}
