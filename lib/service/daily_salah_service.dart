import 'package:my_masjid/service/data.dart';

class SalahService {
  Map<dynamic, dynamic>? getDaySalah(DateTime d) {
    Map<String, dynamic> daySalah = {};
    Map<String, dynamic> dayIqama = {};
    //var d = DateTime.now();
    //d = DateTime(2022, 07, 29);
    final daySalahStart = timetableStandardTime[d.month - 1][d.day - 1][0];
    final dayIqamaStart = timetableStandardTime[d.month - 1][d.day - 1][1];
    final salahName = ['Fajr', 'Ishraq', 'Dohor', 'Asr', 'Maghrib', 'Isha'];
    final iqamaName = ['Fajr', 'Dohor', 'Asr', 'Maghrib', 'Isha'];

    // salah start
    for (int i = 0; i < salahName.length; i++) {
      daySalah[salahName[i]] =
          getLocalTimeStr(daySalahStart[i], isDST(d)['isDSTActive']);
    }

    // iqama
    for (int i = 0; i < iqamaName.length; i++) {
      // check each iqama time for jumaa, ramadan and start and end dst time
      dayIqama[iqamaName[i]] =
          getLocalTimeStr(dayIqamaStart[i], isDST(d)['isDSTActive']);
    }
    return {
      'salahStartTime': daySalah,
      'iqamahTime': applyIqamahTimeAdjustments(dayIqama, d)
    };
  }

  String getLocalTimeStr(val, isDSTActive) {
    if (isDSTActive) {
      val += 100;
      if (val >= 1300) val -= 1200;
    }
    return '${(val / 100).floor()}:${(val % 100).toString().padLeft(2, '0')}';
  }

  Map<String, dynamic> isDST(DateTime date) {
    var march = DateTime(date.year, 3, 1);
    final startDST = march.add(Duration(days: (7 - march.weekday) + 7));
    var nov = DateTime(date.year, 11, 1);
    final endDST = nov.add(Duration(days: 7 - march.weekday));
    return {
      'isDSTActive':
          date.compareTo(startDST) == 1 && date.compareTo(endDST) == -1,
      'DSTStart': startDST,
      'DSTEnd': endDST
    };
  }

  Map<String, dynamic> applyIqamahTimeAdjustments(iqamaTime, date) {
    var dstInfo = isDST(date);
    if (dstInfo['isDSTActive'] &&
        DateTime.now()
                .compareTo(dstInfo['DSTStart'].add(const Duration(days: 7))) ==
            -1) {
      iqamaTime['Fajr'] = "6:35";
    } else if (DateTime.now().compareTo(dstInfo['DSTEnd']) == 1 &&
        DateTime.now()
                .compareTo(dstInfo['DSTStart'].add(const Duration(days: 7))) ==
            -1) {
      iqamaTime['Fajr'] = '6:45';
      iqamaTime['Asr'] = '5:00';
      iqamaTime['Isha'] = '8:00';
    }

    if (date.weekday == 5) {
      iqamaTime.remove('Dohor');
      iqamaTime['Jumaa 1'] = dstInfo['isDSTActive'] ? '1:45' : '12:45';
      iqamaTime['Jumaa 2'] = dstInfo['isDSTActive'] ? '2:55' : '1:55';
    }
    return iqamaTime;
  }

  // add ramadan timings
  Map<String, dynamic> applyRamadanAdjustments(iqamaTime, date) {
    var dstInfo = isDST(date);
    if (dstInfo['isDSTActive'] &&
        DateTime.now()
                .compareTo(dstInfo['DSTStart'].add(const Duration(days: 7))) ==
            -1) {
      iqamaTime['Fajr'] = "6:35";
    } else if (DateTime.now().compareTo(dstInfo['DSTEnd']) == 1 &&
        DateTime.now()
                .compareTo(dstInfo['DSTStart'].add(const Duration(days: 7))) ==
            -1) {
      iqamaTime['Fajr'] = '6:45';
      iqamaTime['Asr'] = '5:00';
      iqamaTime['Isha'] = '8:00';
    }

    if (date.weekday == 5) {
      iqamaTime.remove('Dohor');
      iqamaTime['Jumaa 1'] = dstInfo['isDSTActive'] ? '1:45' : '12:45';
      iqamaTime['Jumaa 2'] = dstInfo['isDSTActive'] ? '2:55' : '1:55';
    }
    return iqamaTime;
  }
}
