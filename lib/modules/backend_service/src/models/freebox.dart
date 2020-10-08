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

  factory Freebox.fromJson(Map<String, dynamic> json) => Freebox(
        image: json['image'],
        description: json['description'],
        address: json['address'],
      );

  Map<String, dynamic> toJson() => {
        'image': image,
        'description': description,
        'address': address,
      };

  @override
  String toString() => toJson().toString();
}
