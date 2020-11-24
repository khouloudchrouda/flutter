import 'dart:developer';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prianou_app/models/product.dart';

import 'envirementConfig.dart';
import 'network.dart';

class APIService {

  static Future<List<Product>> getListProducts(Map body) async {
    Network registerNetwork = Network(
        '${EnvironmentConfig.BACKEND_URL}/api/produits/getProduitBylocationUser');
    var data = await registerNetwork.postData(body);
    var list = (data['data'] as Map)["produit"] as List;
    return list.map((v) => Product.fromJson(v as Map<String, dynamic>)).toList();
  }

  static Future<String> getGoogleMapsPath(LatLng origin, LatLng des) async {
    var key = "AIzaSyBhe1_S7DJpRm9_WIDSVvRAdizGLd1ywxw";
    Network registerNetwork = Network(
        'https://maps.googleapis.com/maps/api/directions/json?key=$key&origin=${origin.latitude},${origin.longitude}&destination=${des.latitude},${des.longitude}');
    var data = await registerNetwork.postData({});
    var path = (((data["routes"] as List)[0] as Map)["overview_polyline"] as Map)["points"];
    log(path);
    return path;
  }

}
