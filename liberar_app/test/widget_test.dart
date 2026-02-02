import 'package:flutter_test/flutter_test.dart';
import 'package:liberar_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('App loads and shows map screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    // Verify that the title is present in the AppBar.
    expect(find.text('Liberar App - Mapa'), findsOneWidget);
  });
}
