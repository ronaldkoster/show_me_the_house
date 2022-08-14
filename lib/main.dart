import 'package:flutter/material.dart';
import 'package:showmethehouse/app.dart';

import 'client/http/client.dart';

void main() {
  runApp(const ShowMeTheHouseApp(
    client: HttpHousingClient(
      key: "ac1b0b1572524640a0ecc54de453ea9f",
      baseURL: "partnerapi.funda.nl",
    ),
  ));
}
