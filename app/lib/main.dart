// @dart=2.9
import 'dart:core';

import 'package:app/print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> scannedBarcodes = [
    'test code',
  ];


  Future<void> _scanBarcode () async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#FF0000',
        'Cancel',
        false,
        ScanMode.BARCODE);
    if (barcodeScanRes == '-1') {
      return;
    }
    setState((){
      scannedBarcodes.add(barcodeScanRes);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  ...scannedBarcodes.map((code) => Container(
                      child: Text(
                          code
                      )
                  )
                  )
                ]
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: RaisedButton(
                    onPressed: _scanBarcode,
                    child: Text('scan')
                  )
                ),
                Expanded(
                  child: RaisedButton (
                    onPressed: () => printReceipt(
                      this.scannedBarcodes
                    ),
                    child: Text('print')
                  )
                ),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _scanBarcode,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.qr_code),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
