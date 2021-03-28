final _base32RegExp = RegExp("^(?:[A-Z2-7]{8})*(?:[A-Z2-7]{2}={6}|[A-Z2-7]{4}={4}|[A-Z2-7]{5}={3}|[A-Z2-7]{7}=)?");

bool isBase32(String input) {
  return input.isNotEmpty && input.length % 8 == 0 && _base32RegExp.hasMatch(input);
}
