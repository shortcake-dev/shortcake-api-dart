import 'package:shortcake/shortcake.dart';
import 'package:test/test.dart';

void main() {
  group('ShortcakeClient.introspect()', () {
    var client = ShortcakeApi('http://localhost:8000');

    test('does not create an exception', () async {
      var result = await client.introspect();
      assert(!result.hasException);
    });

    test('contains data', () async {
      var result = await client.introspect();
      assert(result.data?.containsKey('__typename') ?? false);
    });
  });
}
