import 'package:flutter_test/flutter_test.dart';
import 'package:gii_authenticator/modules/account/domain/helpers/validations.dart';

void main() {
  group('isBase32', () {
    test('should return a true result', () {
      // arrange
      const input = "cjobclvizjvza57wku5xi3ll3ydimldf";
      // act
      final result = isBase32(input);
      // assert
      expect(result, isTrue);
    });

    test('should return a false result', () {
      // arrange
      const input = "1234567890";
      // act
      final result = isBase32(input);
      // assert
      expect(result, isFalse);
    });
  });
}
