
import 'package:flutter_test/flutter_test.dart';
import 'package:product_profile_ppm/main.dart';

void main() {
  testWidgets('Aplikasi Product Profile berhasil dibuka',
      (WidgetTester tester) async {
    await tester.pumpWidget(const ProductProfileApp());

    expect(find.text('Profil Mahasiswa'), findsOneWidget);
    expect(find.text('Produk Pilihan'), findsOneWidget);
    expect(find.text('Wireless Headphones'), findsOneWidget);
  });
}
