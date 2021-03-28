import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gii_authenticator/modules/account/domain/models/account_code.dart';

import '../../../../src/models.dart';

void main() {
  AccountCode accountCode;
  Map<String, dynamic> accountCodeJson;
  String accountCodeJsonString;

  setUp(() {
    accountCode = createAccountCode();
    accountCodeJson = <String, dynamic>{
      "id": accountCode.id,
      "code": accountCode.code,
      "account": {
        "id": accountCode.account.id,
        "name": accountCode.account.name,
        "secret": accountCode.account.secret,
        "issuer": accountCode.account.issuer,
        "algorithm": accountCode.account.algorithm,
        "digits": accountCode.account.digits,
        "period": accountCode.account.period,
        "created_at": accountCode.account.createdAt.toIso8601String(),
      },
      "created_at": accountCode.createdAt.toIso8601String(),
      "expired_at": accountCode.expiredAt.toIso8601String(),
    };
    accountCodeJsonString = json.encode(accountCodeJson);
  });

  group("fromJson", () {
    test('should return a valid accountCode object', () {
      // arrange
      // act
      final result = AccountCode.fromJson(accountCodeJson);
      // assert
      expect(result.toJsonString(), accountCode.toJsonString());
    });
  });

  group("fromJsonString", () {
    test('should return a valid accountCode object', () {
      // arrange
      // act
      final result = AccountCode.fromJsonString(accountCodeJsonString);
      // assert
      expect(const DeepCollectionEquality().equals(result.toJson(), accountCode.toJson()), isTrue);
    });
  });

  group("toJson", () {
    test('should return a valid accountCode json', () {
      // arrange
      // act
      final result = accountCode.toJson();
      // assert
      expect(const DeepCollectionEquality().equals(result, accountCodeJson), isTrue);
    });
  });

  group("toJsonString", () {
    test('should return a valid accountCode string', () {
      // arrange
      // act
      final result = accountCode.toJsonString();
      // assert
      expect(result, accountCodeJsonString);
    });
  });
}
