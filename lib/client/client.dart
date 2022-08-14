import '../domain/house.dart';

abstract class HousingClient {
  Future<House> getHouse(String houseID);
}
