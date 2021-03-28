import 'package:flutter_test/flutter_test.dart';
import 'package:gii_authenticator/modules/account/domain/models/account.dart';
import 'package:gii_authenticator/modules/account/domain/usecases/get_accounts_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../src/mocks.dart';
import '../../../../src/models.dart';

void main() {
  AccountRepositoryMock accountRepository;
  GetAccountsUsecase getAccountsUsecase;
  List<Account> accounts;

  setUp(() {
    accountRepository = AccountRepositoryMock();
    getAccountsUsecase = GetAccountsUsecase(accountRepository);
    accounts = [createAccount()];
  });

  group("call", () {
    test('should return the response of accountRepository', () async {
      // arrange
      when(accountRepository.getAccounts()).thenAnswer((_) => Future.value(accounts));
      // act
      final result = await getAccountsUsecase.call();
      // assert
      expect(accounts, result);
      verify(accountRepository.getAccounts());
    });
  });
}
