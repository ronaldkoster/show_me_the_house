import 'address.dart';
import 'coordinates.dart';

class House {
  final Coordinates coordinates;
  final Address address;
  final String description;
  final int price;
  final String coverImage;
  final List<String> images;

  House({
    required this.coordinates,
    required this.address,
    required this.description,
    required this.price,
    required this.coverImage,
    required this.images,
  });
}
