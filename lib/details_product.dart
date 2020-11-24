import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prianou_app/networking/api_service.dart';

import 'models/product.dart';
import 'networking/envirementConfig.dart';

class DetailsProduct extends StatefulWidget {
  Product product;

  DetailsProduct({this.product});

  @override
  _DetailsProductState createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {
  Completer<GoogleMapController> _controller = Completer();

  static CameraPosition initialCameraPosition;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Set<Polyline> _polylines = {};


  @override
  void initState() {
    super.initState();
    initialCameraPosition = CameraPosition(
      target: LatLng(widget.product.nearByMagasin.location.latitude,
          widget.product.nearByMagasin.location.longitude),
      zoom: 14.4746,
    );
  }

  addMarkers() async {
    var user_position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    var user_pin_image = await setCustomMapPin("user.png");

    var user_position_lg = LatLng(user_position.latitude, user_position.longitude);
    Marker userMarker = Marker(
      markerId: MarkerId("user_marker"),
      position: user_position_lg,
      icon: user_pin_image
    );

    var magasin_pin_image = await setCustomMapPin("magasin.png");

    var magasin_position = LatLng(widget.product.nearByMagasin.location.latitude,
        widget.product.nearByMagasin.location.longitude);

    Marker magasinMarker = Marker(
        markerId: MarkerId("magasin_marker"),
        position: magasin_position,
        icon: magasin_pin_image
    );

    setState(() {
      // adding a new marker to map
      markers[MarkerId("user_marker")] = userMarker;
      markers[MarkerId("magasin_marker")] = magasinMarker;
    });

    var path = await APIService.getGoogleMapsPath(user_position_lg, magasin_position);
    drawPath(path);
  }

  drawPath(String path) {
    List<PointLatLng> result = PolylinePoints().decodePolyline(path);

    List<LatLng> polylineCoordinates = [];

    result.forEach((PointLatLng point){
      polylineCoordinates.add(
          LatLng(point.latitude, point.longitude));
    });

    Polyline polyline = Polyline(
        polylineId: PolylineId("destination"),
        color: Colors.black,
        width: 7,
        points: polylineCoordinates
    );

    setState(() {
      _polylines.add(polyline);
    });
  }

  Future<BitmapDescriptor> setCustomMapPin(image) async {
    return await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/$image');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.3),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: widget.product.photo,
            child: Image.network(
              '${EnvironmentConfig.BACKEND_URL}/images/${widget.product.photo}',
              height: 270,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: initialCameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                addMarkers();
              },
              markers: Set<Marker>.of(markers.values),
              polylines: _polylines,
            ),
          )
        ],
      ),
    );
  }
}
