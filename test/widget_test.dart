import 'package:flutter_test/flutter_test.dart';

import 'package:mini_katalog_app/main.dart';

void main() {
  testWidgets('Ana ekran yüklenir', (WidgetTester tester) async {
    await tester.pumpWidget(const MiniKatalogApp());

    expect(find.text('Mini Katalog'), findsOneWidget);
    expect(find.text('12 ürün listeleniyor'), findsOneWidget);
  });
}
