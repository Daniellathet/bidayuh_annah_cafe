import 'package:flutter_test/flutter_test.dart';

import 'package:bidayuh_annah_cafe/main.dart';

void main() {
  testWidgets('Menu screen shows title and first item', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MenuApp());

    expect(find.text('Bidayuh Annah Cafe'), findsOneWidget);
    expect(find.text('Espresso'), findsOneWidget);
  });
}
