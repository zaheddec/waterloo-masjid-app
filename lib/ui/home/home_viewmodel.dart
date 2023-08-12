import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_masjid/models/salah_model.dart';
import 'package:my_masjid/models/salah_repo.dart';
import 'package:my_masjid/service/local_notification_service.dart';

class SalahHomeViewModel extends GetxController {
  final _salah = Get.put(SalahRepo()); // Get.find<SalahRepo>();
  final _localNotifications = Get.find<LocalNotificationService>();
  final salah = SalahTimeModel().obs;
  RxList<String> iqamaName = ['Fajr', 'Dohor', 'Asr', 'Maghrib', 'Isha'].obs;
  RxString currentSalah = ''.obs;
  RxString currentDay = ''.obs;
  RxString currentDayInWeek = ''.obs;
  DateTime currentDate = DateTime.now();
  List<String> daysInWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  final PageController pageController = PageController(initialPage: 365);
  @override
  onInit() async {
    getDailySalahTime(currentDate);
    // print(salah.toString());
    super.onInit();
  }

  @override
  void onReady() async {
    await _localNotifications.setSalahNotifications();
    _localNotifications.showNotification(title: 'test', body: 'test 123');
    super.onReady();
  }

  Future<void> getDailySalahTime(currentDate) async {
    this.currentDate = currentDate;
    salah.value = _salah.getDailySalah(currentDate);
    salah.refresh();
    iqamaName.value = currentDate.weekday != 5
        //final iqamaName = DateTime(2022, 07, 29).weekday != 5
        ? ['Fajr', 'Dohor', 'Asr', 'Maghrib', 'Isha']
        : ['Fajr', 'Jumaa 1', 'Jumaa 2', 'Asr', 'Maghrib', 'Isha'];
    iqamaName.refresh;
    isCurrentSalah();
    // this is to avoid parallel build issues
    await Future.delayed(Duration.zero);
    getCurrentDayString(currentDate);
    // print(currentDay.value);
  }

  isCurrentSalah() {
    DateTime today = DateTime.now();
    if (currentDate.year != today.year ||
        currentDate.month != today.month ||
        currentDate.day != today.day) {
      currentSalah.value = '';
      return;
    }
    for (var i = 0; i < iqamaName.length; i++) {
      if (!toTimeOfDay(salah.value.iqamahTime[iqamaName[i]], iqamaName[i])) {
        currentSalah.value = iqamaName[i];
        break;
      }
    }
  }

  bool toTimeOfDay(String time, String salahName) {
    var d = DateTime.now();
    List<String> timeSplit = time.split(":");
    int hour = int.parse(timeSplit.first);
    int minute = int.parse(timeSplit.last);
    // check if the current day is same as today to highlight current salah
    if (salahName != 'Fajr') {
      hour = hour + 12;
    }
    var salahTime = DateTime(d.year, d.month, d.day, hour, minute);
    //print('$salahName - $time - ${d.isAfter(salahTime)}');

    return d.isAfter(salahTime);
  }

  void getCurrentDayString(DateTime d) {
    // var d = DateTime.now();
    currentDay.value = '${d.day} ${months[d.month - 1]}, ${d.year}';
    currentDayInWeek.value = daysInWeek[d.weekday - 1];
  }

  Future<void> swipe(String direction) async {
    if (direction == 'left') {
      currentDate = currentDate.subtract(const Duration(days: 1));
      // pageController.nextPage(
      //     duration: const Duration(milliseconds: 10), curve: Curves.easeIn);
      // print(currentDate);
    } else {
      currentDate = currentDate.add(const Duration(days: 1));
      // pageController.previousPage(
      //     duration: const Duration(milliseconds: 10), curve: Curves.easeIn);
      // print(currentDate);
    }
    // print(direction);
    getDailySalahTime(currentDate);
  }
}
