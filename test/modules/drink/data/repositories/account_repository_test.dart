import 'package:flutter_test/flutter_test.dart';
import 'package:gii_authenticator/modules/account/data/repositories/account_repository.dart';
import 'package:gii_authenticator/modules/account/domain/models/account.dart';
import 'package:mockito/mockito.dart';

import '../../../../src/mocks.dart';
import '../../../../src/models.dart';

void main() {
  AccountDatasourceMock accountDatasource;
  AccountRepository accountRepository;
  List<Account> accounts;
  Account account;

  setUp(() {
    accountDatasource = AccountDatasourceMock();
    accountRepository = AccountRepository(accountDatasource);
    account = createAccount();
    accounts = [account];
  });

  group("getAccounts", () {
    test('should return the response of AccountDataSource', () async {
      // arrange
      when(accountDatasource.getAccounts()).thenAnswer((_) async => accounts);
      // act
      final result = await accountRepository.getAccounts();
      // assert
      expect(result, accounts);
      verify(accountDatasource.getAccounts());
    });
  });

  group("addAccount", () {
    test('should forward to AccountDataSource', () async {
      // arrange
      // act
      await accountRepository.addAccount(account);
      // assert
      verify(accountDatasource.addAccount(account));
    });
  });

  group("editAccount", () {
    test('should forward AccountDataSource', () async {
      // arrange
      const name = "test_name@gmail.com";
      // act
      await accountRepository.editAccount(account, name);
      // assert
      verify(accountDatasource.editAccount(account, name));
    });
  });

  group("deleteAccount", () {
    test('should forward to AccountDataSource', () async {
      // arrange
      // act
      await accountRepository.deleteAccount(account);
      // assert
      verify(accountDatasource.deleteAccount(account));
    });
  });
}
