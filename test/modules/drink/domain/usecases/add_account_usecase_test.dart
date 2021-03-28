import 'package:flutter_test/flutter_test.dart';
import 'package:gii_authenticator/modules/account/domain/models/account.dart';
import 'package:gii_authenticator/modules/account/domain/usecases/add_account_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../src/mocks.dart';
import '../../../../src/models.dart';

void main() {
  AccountRepositoryMock accountRepository;
  AddAccountUsecase addAccountUsecase;
  UuidMock uuid;
  ClockMock clock;
  Account account;
  String accountId;

  setUp(() {
    uuid = UuidMock();
    clock = ClockMock();
    accountRepository = AccountRepositoryMock();
    addAccountUsecase = AddAccountUsecase(accountRepository, uuid, clock);
    account = createAccount();
    accountId = account.id;
  });

  group('call', () {
    test('should return a valid account object', () async {
      // arrange
      when(clock.now).thenReturn(() => account.createdAt);
      when(uuid.v4()).thenReturn(accountId);
      // act
      final result = await addAccountUsecase.call(
        name: account.name,
        period: account.period,
        digits: account.digits,
        algorithm: account.algorithm,
        issuer: account.issuer,
        secret: account.secret,
      );
      // assert
      expect(result.toJsonString(), account.toJsonString());
      verify(accountRepository.addAccount(argThat(isA<Account>())));
    });

    test('should throw secret invalidated exception', () async {
      // arrange
      when(clock.now).thenReturn(() => account.createdAt);
      when(uuid.v4()).thenReturn(accountId);
      // act
      // assert
      expect(() => addAccountUsecase.call(secret: '1234567890'), throwsA(isA<Exception>()));
    });
  });
}
