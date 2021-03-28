import 'package:flutter_test/flutter_test.dart';
import 'package:gii_authenticator/modules/account/domain/models/account.dart';
import 'package:gii_authenticator/modules/account/domain/usecases/add_account_by_uri_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../src/mocks.dart';
import '../../../../src/models.dart';

void main() {
  AddAccountUsecaseMock addAccountUsecaseMock;
  AddAccountByURIUsecase addAccountByURIUsecase;
  Account account;

  setUp(() {
    addAccountUsecaseMock = AddAccountUsecaseMock();
    addAccountByURIUsecase = AddAccountByURIUsecase(addAccountUsecaseMock);
    account = createAccount();
  });

  group('call', () {
    test('should return a valid account object', () async {
      // arrange
      final uri =
          "otpauth://totp/${account.issuer}:${account.name}?secret=${account.secret}&issuer=${account.issuer}&algorithm=${account.algorithm}&digits=${account.digits}&period=${account.period}";
      when(addAccountUsecaseMock.call(
        name: account.name,
        secret: account.secret,
        issuer: account.issuer,
        algorithm: account.algorithm,
        digits: account.digits,
        period: account.period,
      )).thenAnswer((_) => Future.value(account));
      // act
      final result = await addAccountByURIUsecase.call(uri);
      // assert
      expect(result, account);
    });

    test('should throw missing secret key exception', () async {
      // arrange
      final uri =
          "otpauth://totp/${account.issuer}:${account.name}?issuer=${account.issuer}&algorithm=${account.algorithm}&digits=${account.digits}&period=${account.period}";
      // act
      // assert
      expect(() => addAccountByURIUsecase.call(uri), throwsA(isA<Exception>()));
    });
  });
}
