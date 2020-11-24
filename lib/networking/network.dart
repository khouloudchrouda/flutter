import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:prianou_app/services/auth_service.dart';

class Network {
  final String url;

  Network(this.url);

  Future getData({bool isTl = false}) async {
    String token = await AuthService.getToken() ?? "";
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    if (token != "") {
      request.headers.set('Authorization', "Bearer $token");
    }
    HttpClientResponse response = await request.close();
    log("$url ${response.statusCode.toString()}");
    if (response.statusCode > 300) {
      log("$url ${response.statusCode.toString()}");
    } else {
      String data = await response.transform(utf8.decoder).join();
      httpClient.close();
      return jsonDecode(data);
    }
  }


  Future postData(body) async {
    log('Post uri: $url');
    log(body.toString());
    HttpClient httpClient = new HttpClient();
    String token = await AuthService.getToken() ?? "";
    log("token: $token");
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    if (token != "") {
      request.headers.set('Authorization', "Bearer $token");
    }
    request.add(utf8.encode(json.encode(body)));
    HttpClientResponse response = await request.close();
    if (response.statusCode > 300) {
      log(response.statusCode.toString());
    } else {
      String data = await response.transform(utf8.decoder).join();
      httpClient.close();
      return jsonDecode(data);
    }
  }

  Future putData(body) async {
    log('Put uri: $url');
    HttpClient httpClient = new HttpClient();
    String token = await AuthService.getToken() ?? "";
    log("token: $token");
    HttpClientRequest request = await httpClient.putUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    if (token != "") {
      request.headers.set('Authorization', "Bearer $token");
    }
    request.add(utf8.encode(json.encode(body)));
    HttpClientResponse response = await request.close();
    if (response.statusCode > 300) {
      log(response.statusCode.toString());
    } else {
      String data = await response.transform(utf8.decoder).join();
      httpClient.close();
      return jsonDecode(data);
    }
  }
}
