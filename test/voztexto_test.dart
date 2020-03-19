import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voztexto/voztexto.dart';

void main() {
  const MethodChannel channel = MethodChannel('voztexto');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Voztexto.platformVersion, '42');
  });
}
