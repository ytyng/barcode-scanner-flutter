// @dart=2.9
import 'dart:core';

import 'package:flutter_sunmi_printer/flutter_sunmi_printer.dart';

printReceipt(List<String> codes) {

  // Text with styles
  SunmiPrinter.text('left');
  SunmiPrinter.text(
    'center',
    styles: SunmiStyles(bold: true, underline: true, align: SunmiAlign.center),
  );
  SunmiPrinter.text(
    'right',
    styles: SunmiStyles(bold: true, underline: true, align: SunmiAlign.right),
  );

  // Text with styles
  SunmiPrinter.text('左');
  SunmiPrinter.text(
    '中央',
    styles: SunmiStyles(bold: true, underline: true, align: SunmiAlign.center, size: SunmiSize.xl),
  );
  SunmiPrinter.text(
    '右',
    styles: SunmiStyles(bold: true, underline: true, align: SunmiAlign.right,  size: SunmiSize.lg),
  );
  SunmiPrinter.hr();
  // Table
  // SunmiPrinter.row(
  //   cols: [
  //     SunmiCol(text: 'col1', width: 4),
  //     SunmiCol(text: 'col2', width: 4, align: SunmiAlign.center),
  //     SunmiCol(text: 'col3', width: 4, align: SunmiAlign.right),
  //   ],
  // );
  // Table
  for (var c in codes) {
    SunmiPrinter.row(
      cols: [
        SunmiCol(text: c, width: 8),
        SunmiCol(text: '1', width: 4, align: SunmiAlign.right),
      ],
    );

  }

  // Image
  // ByteData bytes = await rootBundle.load('assets/rabbit_black.jpg');
  // final buffer = bytes.buffer;
  // final imgData = base64.encode(Uint8List.view(buffer));
  // SunmiPrinter.image(imgData);
  SunmiPrinter.emptyLines(3);
}
