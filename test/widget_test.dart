import 'package:flutter_test/flutter_test.dart';

import 'package:emstat_4pp/main.dart';

void main() {
  testWidgets('shows the application tabs', (WidgetTester tester) async {
    await tester.pumpWidget(const EmStatApp());

    expect(find.text('README'), findsWidgets);
    expect(find.text('Terminal'), findsOneWidget);
    expect(find.text('Switches'), findsOneWidget);
    expect(find.text('4pp'), findsOneWidget);
    expect(find.text('vdP'), findsOneWidget);
  });
}
