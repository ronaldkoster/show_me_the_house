import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../../client/client.dart';

class HouseBloc extends Bloc<HouseEvent, HouseState> {
  final HousingClient _client;
  HouseBloc({required HousingClient client})
      : _client = client,
        super(
          HouseState(
            hasError: false,
            houseDetails: null,
            loading: true,
          ),
        ) {
    on<GetHouse>(_handleGetHouseEvent);
  }

  _handleGetHouseEvent(final event, final emit) async {
    emit(state.copyWith(loading: true, errorMessage: ""));

    try {
      final house = await _client.getHouse(event.houseID);

      emit(
        state.copyWith(
          loading: false,
          houseDetails: HouseDetails(
            city: house.address.city,
            coverImageURL: house.coverImageURL,
            description: house.description,
            imageURLs: house.imageURLs,
            latitude: house.coordinates.latitude,
            longitude: house.coordinates.longitude,
            price: house.price,
            street: house.address.street,
            zipcode: house.address.zipcode,
          ),
        ),
      );
    } catch (error) {
      debugPrint("could not load house from API. $error");

      emit(
        state.copyWith(loading: false, hasError: true),
      );
    }
  }
}

abstract class HouseEvent {}

class HouseState {
  final bool hasError;
  final bool loading;
  final HouseDetails? houseDetails;

  HouseState({
    required final this.hasError,
    required final this.houseDetails,
    required final this.loading,
  });

  HouseState copyWith({
    final String? errorMessage,
    final bool? hasError,
    final HouseDetails? houseDetails,
    final bool? loading,
  }) =>
      HouseState(
        hasError: hasError ?? this.hasError,
        houseDetails: houseDetails ?? this.houseDetails,
        loading: loading ?? this.loading,
      );
}

class HouseDetails {
  final String description;
  final String street;
  final String zipcode;
  final String city;
  final String coverImageURL;
  final List<String> imageURLs;
  final int price;
  final double latitude;
  final double longitude;

  HouseDetails({
    required this.description,
    required this.street,
    required this.zipcode,
    required this.city,
    required this.price,
    required this.coverImageURL,
    required this.imageURLs,
    required this.latitude,
    required this.longitude,
  });
}

class GetHouse extends HouseEvent {
  final String houseID;
  GetHouse(this.houseID);
}
