import 'package:flutter_test/flutter_test.dart';
import 'package:gii_authenticator/modules/account/domain/models/account.dart';
import 'package:gii_authenticator/modules/account/domain/usecases/edit_account_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../src/mocks.dart';
import '../../../../src/models.dart';

void main() {
  AccountRepositoryMock accountRepository;
  EditAccountUsecase editAccountUsecase;
  Account account;

  setUp(() {
    accountRepository = AccountRepositoryMock();
    editAccountUsecase = EditAccountUsecase(accountRepository);
    account = createAccount();
  });

  group('call', () {
    test('should forward to accountRepository', () async {
      // arrange
      const name = "test_name@gmail.com";
      // act
      await editAccountUsecase.call(account, name);
      // assert
      verify(accountRepository.editAccount(account, name));
    });
  });
}
