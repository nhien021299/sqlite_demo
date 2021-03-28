import 'package:flutter_test/flutter_test.dart';
import 'package:gii_authenticator/modules/account/domain/models/account.dart';
import 'package:gii_authenticator/modules/account/domain/usecases/delete_account_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../src/mocks.dart';
import '../../../../src/models.dart';

void main() {
  AccountRepositoryMock accountRepository;
  DeleteAccountUsecase deleteAccountUsecase;
  Account account;

  setUp(() {
    accountRepository = AccountRepositoryMock();
    deleteAccountUsecase = DeleteAccountUsecase(accountRepository);
    account = createAccount();
  });

  group('call', () {
    test('should forward to accountRepository', () async {
      // arrange
      // act
      await deleteAccountUsecase.call(account);
      // assert
      verify(accountRepository.deleteAccount(account));
    });
  });
}
