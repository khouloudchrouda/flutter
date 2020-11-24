import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prianou_app/details_product.dart';
import 'package:prianou_app/networking/envirementConfig.dart';

import 'models/product.dart';

class ProductWidget extends StatefulWidget {
  Product product;

  ProductWidget({this.product});

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  DateTime date;
  var hour = "00";
  var min = "00";
  var sec = "00";

  @override
  void initState() {
    super.initState();
    date = DateTime.parse(widget.product.delai);
    Timer.periodic(Duration(seconds: 1), (timer) {
      var now = DateTime.now();
      var diff = date.difference(now);
      setState(() {
        hour = adjust(diff.inHours);
        min = adjust(diff.inMinutes % 60);
        sec = adjust((diff.inSeconds % 60) % 60);
      });
    });
  }

  adjust(int x) {
    if (x < 10) {
      return "0$x";
    }
    return x.toString();
  }

  @override
  Widget build(BuildContext context) {
    double borderRadius = 16;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff79fbc8),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 5),
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Hero(
            tag: widget.product.photo,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Image.network(
                '${EnvironmentConfig.BACKEND_URL}/images/${widget.product.photo}',
                height: 190,
                width: screenWidth,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(borderRadius))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(38 / 2)),
                        child: Center(
                          child: Text(
                            "-${widget.product.promotion}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "À ${widget.product.prixPromo}£",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          Text(
                            "Au lieu de ${widget.product.prixBase}£",
                            style: TextStyle(
                                color: Color(0xffffc366),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough,
                                decorationStyle: TextDecorationStyle.solid),
                          ),
                        ],
                      )
                    ],
                  ),
                  RaisedButton(
                    color: Color(0xffffc366),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(38 / 2),
                      side: BorderSide(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsProduct(
                                  product: widget.product,
                                )),
                      );
                    },
                    child: Text(
                      "J'en profite",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 8,
            bottom: 54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/images/timer.png",
                      width: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        "$hour",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/images/timer.png",
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        "$min",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/images/timer.png",
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        "$sec",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
