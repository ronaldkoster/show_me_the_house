import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../../client/client.dart';
import '../../../../domain/house.dart';

class HouseBloc extends Bloc<HouseEvent, HouseState> {
  final HousingClient _client;
  HouseBloc({required HousingClient client})
      : _client = client,
        super(
          HouseState(
            hasError: false,
            house: null,
            loading: true,
          ),
        ) {
    on<GetHouse>(_handleGetHouseEvent);
  }

  _handleGetHouseEvent(final event, final emit) async {
    emit(state.copyWith(loading: true, errorMessage: ""));

    try {
      final house = await _client.getHouse(event.houseID);

      emit(state.copyWith(loading: false, house: house));
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
  bool hasError;
  final bool loading;
  final House? house;

  HouseState({
    required final this.hasError,
    required final this.house,
    required final this.loading,
  });

  HouseState copyWith({
    final String? errorMessage,
    final bool? hasError,
    final House? house,
    final bool? loading,
  }) =>
      HouseState(
        hasError: hasError ?? this.hasError,
        house: house ?? this.house,
        loading: loading ?? this.loading,
      );
}

class GetHouse extends HouseEvent {
  final String houseID;
  GetHouse(this.houseID);
}
