import 'package:flutter_test/flutter_test.dart';
import 'package:gii_authenticator/modules/account/domain/models/account.dart';
import 'package:gii_authenticator/modules/account/domain/models/account_code.dart';
import 'package:gii_authenticator/modules/account/domain/usecases/generate_account_code_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../src/mocks.dart';
import '../../../../src/models.dart';

void main() {
  Account account;
  AccountCode accountCode;
  GenerateAccountCodeUsecase generateAccountCodeUsecase;
  UuidMock uuid;
  ClockMock clock;

  setUp(() {
    uuid = UuidMock();
    clock = ClockMock();
    generateAccountCodeUsecase = GenerateAccountCodeUsecase(uuid, clock);
    accountCode = createAccountCode();
    account = accountCode.account;
  });

  group("call", () {
    test('should return an AccountCode object', () {
      // arrange
      when(uuid.v4()).thenReturn(accountCode.id);
      when(clock.now).thenReturn(() => accountCode.createdAt);
      // act
      final result = generateAccountCodeUsecase.call(account);
      // assert
      expect(result.toJsonString(), accountCode.toJsonString());
    });

    test('should return an invalid AccountCode', () {
      // arrange
      when(uuid.v4()).thenReturn(accountCode.id);
      when(clock.now).thenReturn(() => accountCode.createdAt.subtract(const Duration(seconds: 1)));
      // act
      final result = generateAccountCodeUsecase.call(account);
      // assert
      expect(result.code, isNot(accountCode.code));
    });
  });
}
