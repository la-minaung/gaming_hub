import 'package:gaming_hub/data/vos/platform_vo.dart';
import 'package:gaming_hub/persistence/daos/platform_dao.dart';
import 'package:gaming_hub/persistence/hive_constants.dart';
import 'package:hive/hive.dart';

class PlatformDaoImpl extends PlatformDao {
  static final PlatformDaoImpl _singleton = PlatformDaoImpl._internal();

  factory PlatformDaoImpl() {
    return _singleton;
  }

  PlatformDaoImpl._internal();

  @override
  List<PlatformVO> getPlatforms() {
    return getPlatformBox().values.toList();
  }

  @override
  Stream<void> getPlatformEventStream() {
    return getPlatformBox().watch();
  }

  @override
  Stream<List<PlatformVO>> getPlatformStream() {
    return Stream.value(getPlatforms());
  }

  @override
  void savePlatforms(List<PlatformVO> platformList) async {
    Map<int, PlatformVO> platformMap = Map.fromIterable(platformList,
        key: (platform) => platform.id, value: (platform) => platform);
    await getPlatformBox().putAll(platformMap);
  }

  Box<PlatformVO> getPlatformBox() {
    return Hive.box<PlatformVO>(BOX_NAME_PLATFORM_VO);
  }
}
