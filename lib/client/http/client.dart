import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/address.dart';
import '../../domain/coordinates.dart';
import '../../domain/house.dart';
import '../client.dart';
import 'get_house_response.dart';
import 'media.dart';

class HttpHousingClient implements HousingClient {
  final String _key;
  final String _baseURL;

  const HttpHousingClient({required String baseURL, required String key})
      : _key = key,
        _baseURL = baseURL;

  @override
  Future<House> getHouse(String houseID) async {
    final response = await http.get(Uri.http(
        _baseURL, "/feeds/Aanbod.svc/json/detail/$_key/koop/$houseID"));

    final houseResponse = GetHouseResponse.fromJson(jsonDecode(response.body));

    return House(
      address: _convertToAddress(houseResponse),
      coordinates: _convertToCoordinates(houseResponse),
      description: houseResponse.volledigeOmschrijving ??
          "geen omschrijving beschikbaar",
      price: houseResponse.koopPrijs ?? 0,
      coverImage: houseResponse.hoofdFoto ?? "",
      images: _parseOnlyLargeImages(houseResponse),
    );
  }

  Address _convertToAddress(GetHouseResponse response) {
    return Address(
        city: response.plaats ?? "onbekend",
        zipcode: response.postcode ?? "onbekend",
        street: response.adres ?? "onbekend");
  }

  Coordinates _convertToCoordinates(GetHouseResponse response) {
    return Coordinates(
        latitude: response.wGS84Y ?? 0, longitude: response.wGS84X ?? 0);
  }

  List<String> _parseOnlyLargeImages(GetHouseResponse response) {
    if (response.media == null) {
      return [];
    }

    final media = _filterMediaOfTypeImage(response.media!);

    final imageURLs = <String>[];

    for (final mediaItem in media) {
      if (mediaItem.mediaItems == null) {
        continue;
      }

      final mediaItemsLargeImage = _filterLargeImages(mediaItem.mediaItems!);
      for (final mediaItemLargeImage in mediaItemsLargeImage) {
        if (mediaItemLargeImage.url != null) {
          imageURLs.add(mediaItemLargeImage.url!);
        }
      }
    }

    return imageURLs;
  }

  Iterable<Media> _filterMediaOfTypeImage(List<Media> media) {
    return media
        .where((mediaItem) => mediaItem.contentType == ContentType.image);
  }

  Iterable<MediaItems> _filterLargeImages(List<MediaItems> mediaItems) {
    return mediaItems
        .where((mediaItem) => mediaItem.category == ImageCategorySize.large);
  }
}
