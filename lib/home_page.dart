import 'dart:developer';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_geofencing/flutter_geofencing.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prianou_app/models/product.dart';
import 'package:prianou_app/networking/api_service.dart';
import 'package:prianou_app/product_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> listProducts;
  ReceivePort port = ReceivePort();
  String geofenceState = 'N/A';

  final List<GeofenceEvent> triggers = <GeofenceEvent>[
    GeofenceEvent.enter,
    GeofenceEvent.dwell,
    GeofenceEvent.exit
  ];

  final AndroidGeofencingSettings androidSettings = AndroidGeofencingSettings(
      initialTrigger: <GeofenceEvent>[
        GeofenceEvent.enter,
        GeofenceEvent.exit,
        GeofenceEvent.dwell
      ],
      loiteringDelay: 1000 * 60);

  @override
  void initState() {
    super.initState();
    IsolateNameServer.registerPortWithName(
        port.sendPort, 'geofencing_send_port');
    port.listen((dynamic data) {
      print('Event: $data');
      setState(() {
        geofenceState = data;
      });
    });
    initPlatformState();
    getData();
  }

  getData() async {
    List<Product> list = [];
    try {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      list = await APIService.getListProducts(
          {"lat": position.latitude, "lon": position.longitude});
    } catch (_) {
      list = await APIService.getListProducts({});
    }
    list.forEach((element) {
      GeofencingManager.registerGeofence(
          GeofenceRegion(
              element.nearByMagasin.sId,
              element.nearByMagasin.location.latitude,
              element.nearByMagasin.location.longitude,
              40 * 1000.0,
              triggers,
              androidSettings: androidSettings),
          callback);
    });
    setState(() {
      listProducts = list;
    });
  }

  static void callback(List<String> ids, Location l, GeofenceEvent e) async {
    print('Fences: $ids Location $l Event: $e');
    final SendPort send =
        IsolateNameServer.lookupPortByName('geofencing_send_port');
    send?.send(e.toString());
  }

  Future<void> initPlatformState() async {
    print('Initializing...');
    await GeofencingManager.initialize();
    print('Initialization done');
  }

  @override
  Widget build(BuildContext context) {
    return listProducts == null
        ? Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                Colors.black,
              ),
            ),
          )
        : SingleChildScrollView(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: listProducts
                  .map((p) => ProductWidget(
                        product: p,
                      ))
                  .toList(),
            ),
          );
  }
}
