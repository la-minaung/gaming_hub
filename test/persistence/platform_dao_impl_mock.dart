import 'package:gaming_hub/data/vos/platform_vo.dart';
import 'package:gaming_hub/persistence/daos/platform_dao.dart';

class PlatformDaoImplMock extends PlatformDao {
  Map<int, PlatformVO> platformInDatabaseMock = {};

  @override
  Stream<void> getPlatformEventStream() {
    return Stream<void>.value(null);
  }

  @override
  Stream<List<PlatformVO>> getPlatformStream() {
    return Stream.value(platformInDatabaseMock.values.toList());
  }

  @override
  List<PlatformVO> getPlatforms() {
    return platformInDatabaseMock.values.toList();
  }

  @override
  void savePlatforms(List<PlatformVO> platformList) {
    platformList.forEach((platform) {
      platformInDatabaseMock[platform.id] = platform;
    });
  }
}
