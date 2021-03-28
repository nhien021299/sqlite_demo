import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gii_authenticator/modules/account/domain/models/account.dart';

import '../../../../src/models.dart';

void main() {
  Account account;
  Map<String, dynamic> accountJson;
  String accountJsonString;

  setUp(() {
    account = createAccount();
    accountJson = <String, dynamic>{
      "id": account.id,
      "name": account.name,
      "secret": account.secret,
      "issuer": account.issuer,
      "algorithm": account.algorithm,
      "digits": account.digits,
      "period": account.period,
      "created_at": account.createdAt.toIso8601String()
    };
    accountJsonString = json.encode(accountJson);
  });

  group("fromJson", () {
    test('should return a valid accountCode object', () {
      // arrange
      // act
      final result = Account.fromJson(accountJson);
      // assert
      expect(result.toJsonString(), account.toJsonString());
    });
  });

  group("fromJsonString", () {
    test('should return a valid accountCode object', () {
      // arrange
      // act
      final result = Account.fromJsonString(accountJsonString);
      // assert
      expect(const DeepCollectionEquality().equals(result.toJson(), account.toJson()), isTrue);
    });
  });

  group("toJson", () {
    test('should return a valid accountCode json', () {
      // arrange
      // act
      final result = account.toJson();
      // assert
      expect(const DeepCollectionEquality().equals(result, accountJson), isTrue);
    });
  });

  group("toJsonString", () {
    test('should return a valid accountCode string', () {
      // arrange
      // act
      final result = account.toJsonString();
      // assert
      expect(result, accountJsonString);
    });
  });
}
