import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:my_masjid/service/responsive_factors.dart';

import '../styles/styles.dart';

class MSText extends StatelessWidget {
  // final SizeConfig _sizeConfig = Get.find<SizeConfig>();
  const MSText(
      {Key? key,
      this.text = '',
      this.style = const TextStyle(),
      this.textAlign,
      this.textColor})
      : super(key: key);
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  final Color? textColor;

  MSText.header(this.text, {Key? key, this.textAlign, this.textColor})
      : style = header.copyWith(color: textColor),
        super(key: key);
  MSText.headerAddress(this.text, {Key? key, this.textAlign, this.textColor})
      : style = headerAddress.copyWith(color: textColor),
        super(key: key);
  MSText.salahName(this.text, {Key? key, this.textAlign, this.textColor})
      : style = salahName.copyWith(color: textColor),
        super(key: key);
  MSText.salahTimeLabel(this.text, {Key? key, this.textAlign, this.textColor})
      : style = salahTimeLabel.copyWith(color: textColor),
        super(key: key);
  MSText.iqamahTime(this.text, {Key? key, this.textAlign, this.textColor})
      : style = iqamahTime.copyWith(color: textColor),
        super(key: key);

  MSText.screenHeader(this.text, {Key? key, this.textAlign, this.textColor})
      : style = screenHeader.copyWith(color: textColor),
        super(key: key);

  MSText.detailedEventHeader(this.text,
      {Key? key, this.textAlign, this.textColor})
      : style = detailEventHeader.copyWith(color: textColor),
        super(key: key);

  MSText.detailEventSubHeader(this.text,
      {Key? key, this.textAlign, this.textColor})
      : style = detailEventSubHeader.copyWith(color: textColor),
        super(key: key);

  MSText.detailEventBody(this.text, {Key? key, this.textAlign, this.textColor})
      : style = detailEventBody.copyWith(color: textColor),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // double responsiveFontSize =
    //     style.fontSize! * _sizeConfig.screenHeightFactor();
    // print('${style.fontSize} : $responsiveFontSize');
    return
        // Text(text,
        //     style: style.copyWith(fontSize: responsiveFontSize.ceilToDouble()),
        //     textAlign: textAlign);
        Text(text, style: style, textAlign: textAlign);
  }
}
