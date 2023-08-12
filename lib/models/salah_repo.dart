import 'package:get/get.dart';
import 'package:my_masjid/models/salah_interface.dart';
import 'package:my_masjid/models/salah_model.dart';
import 'package:my_masjid/service/daily_salah_service.dart';

class SalahRepo implements SalahInterface {
  final _salahService = Get.put(SalahService());

  @override
  SalahTimeModel getDailySalah(DateTime d) {
    final dailySalah = _salahService.getDaySalah(d);
    if (dailySalah == null) {
      return SalahTimeModel();
    }
    return SalahTimeModel.fromMap(dailySalah);
  }
}
