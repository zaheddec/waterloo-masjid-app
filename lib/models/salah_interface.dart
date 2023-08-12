import 'package:my_masjid/models/salah_model.dart';

abstract class SalahInterface {
  SalahTimeModel getDailySalah(DateTime d); // READ
  //List<SalahTimeModel> getWeeklySalah();
  //List<SalahTimeModel> getMonthlySalah();
}
