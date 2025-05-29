import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_masjid/ui/home/home_viewmodel.dart';
import 'package:my_masjid/ui/styles/styles.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _viewModel = Get.put(SalahHomeViewModel());
  @override
  Widget build(BuildContext context) {
    String? swipeDirection;
    return Scaffold(
        backgroundColor: const Color(0XFFF5F5F5),
        body: GestureDetector(
          onPanUpdate: (details) {
            swipeDirection = details.delta.dx < 0 ? 'right' : 'left';
          },
          onPanEnd: (details) {
            if (swipeDirection == null) {
              return;
            }
            if (swipeDirection == 'left') {
              //handle swipe left event
              _viewModel.swipe('left');
            }
            if (swipeDirection == 'right') {
              //handle swipe right event
              _viewModel.swipe('right');
            }
          },
          child: (Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  flex: 3,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        color: primaryColor,
                      ),
                      SvgPicture.asset(
                        'assets/splash/header.svg',
                        semanticsLabel: 'splash header',
                      ),
                    ],
                  )),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text('Waterloo / ICW Salah Timing',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center),
              ),
              Obx(() => Center(
                    child: Text(_viewModel.currentDay.value,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center),
                  )),
              SizedBox(
                  height: Get.height * 0.75,
                  child: Obx(
                    () => ListView.builder(
                      itemCount: _viewModel.salah.value.iqamahTime.keys
                          .length, //_viewModel.iqamaName.length,
                      itemBuilder: (context, index) {
                        var iscurrentSalah = _viewModel.iqamaName[index] ==
                            _viewModel.currentSalah.value;
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.lightGreen,
                            ),
                            color: iscurrentSalah
                                ? Colors.green.shade800
                                : Colors.transparent,
                          ),
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: iscurrentSalah
                                          ? Colors.green.shade50
                                          : Colors.black,
                                    ),
                                    _viewModel.iqamaName[index],
                                  ),
                                  Text(
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: iscurrentSalah
                                            ? Colors.green.shade50
                                            : Colors.black,
                                      ),
                                      'Starts: ${_viewModel.salah.value.salahStartTime[_viewModel.iqamaName[index]] ?? ''}'),
                                ],
                              ),
                              Text(
                                  '${_viewModel.salah.value.iqamahTime[_viewModel.iqamaName[index]]}',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: iscurrentSalah
                                        ? Colors.green.shade50
                                        : Colors.black,
                                  ))
                            ],
                          ),
                        );
                      },
                    ),
                  )),
            ],
          )),
        ));
  }
}
