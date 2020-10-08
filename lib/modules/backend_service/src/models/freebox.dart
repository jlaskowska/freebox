import 'package:meta/meta.dart';

class Freebox {
  final String id;
  final String description;
  final String address;
  final String imageUrl;

  Freebox({
    @required this.id,
    @required this.description,
    @required this.address,
    @required this.imageUrl,
  });

  factory Freebox.fromJson(Map<String, dynamic> json) => Freebox(
        id: json['id'],
        description: json['description'],
        address: json['address'],
        imageUrl: json['imageUrl'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'address': address,
        'imageUrl': imageUrl,
      };

  @override
  String toString() => toJson().toString();
}
