import 'package:callkit_example/core/utils/duration_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('asCallTimer', () {
    test('pads seconds under a minute', () {
      expect(const Duration(seconds: 7).asCallTimer, '0:07');
    });

    test('drops the hour segment under an hour', () {
      expect(const Duration(minutes: 12, seconds: 5).asCallTimer, '12:05');
    });

    test('adds a padded minute segment past an hour', () {
      expect(
        const Duration(hours: 1, minutes: 3, seconds: 9).asCallTimer,
        '1:03:09',
      );
    });

    test('renders zero as 0:00', () {
      expect(Duration.zero.asCallTimer, '0:00');
    });
  });
}
