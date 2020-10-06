import 'package:flutter/foundation.dart';

class Freebox {
  final String image;
  final String description;
  final String address;

  Freebox({
    @required this.address,
    @required this.description,
    @required this.image,
  });
}
