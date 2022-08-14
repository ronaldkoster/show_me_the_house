// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:showmethehouse/app.dart';
import 'package:showmethehouse/client/client.dart';
import 'package:showmethehouse/domain/address.dart';
import 'package:showmethehouse/domain/coordinates.dart';
import 'package:showmethehouse/domain/house.dart';

import 'widget_test.mocks.dart';

@GenerateMocks([HousingClient])
void main() {
  testWidgets('happy_flow', (WidgetTester tester) async {
    final mockClient = MockHousingClient();

    when(mockClient.getHouse("d854e1dd-0285-4c50-b3d0-adf25e73f5e0"))
        .thenAnswer((_) => Future.value(House(
            coordinates: Coordinates(latitude: 52.632990, longitude: 4.748080),
            address: Address(
              street: "lombardsteeg 5",
              city: "Alkmaar",
              zipcode: "1811 LA",
            ),
            description: "Mijn omschrijving",
            price: 100,
            coverImageURL: "",
            imageURLs: [])));

    await tester.pumpWidget(ShowMeTheHouseApp(
      client: mockClient,
    ));

    await tester.pumpAndSettle();

    expect(find.text("1811 LA Alkmaar"), findsOneWidget);
    expect(find.text("€ 100"), findsOneWidget);
  });

  testWidgets('api_error', (WidgetTester tester) async {
    final mockClient = MockHousingClient();

    when(mockClient.getHouse("d854e1dd-0285-4c50-b3d0-adf25e73f5e0"))
        .thenThrow("error");

    await tester.pumpWidget(ShowMeTheHouseApp(
      client: mockClient,
    ));

    await tester.pumpAndSettle();

    expect(find.text("Oeps er is iets fout gegaan"), findsOneWidget);
  });
}
