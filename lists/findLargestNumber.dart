import 'package:test/test.dart';

int? findLargestNumber(List<int> list) {
  if (list.isEmpty) {
    return null;
  }
  int largestNumber = list[0];
  for (int i = 1; i < list.length; i++) {
    if (list[i] > largestNumber) {
      largestNumber = list[i];
    }
  }
  return largestNumber;
}

void main() {
  group('findLargestNumber', () {
    test('returns the largest number in a list of positive integers', () {
      final List<int> list = [1, 3, 2, 5, 4];
      final result = findLargestNumber(list);
      expect(result, equals(5));
    });

    test('returns the largest number in a list of negative integers', () {
      final List<int> list = [-1, -3, -2, -5, -4];
      final result = findLargestNumber(list);
      expect(result, equals(-1));
    });

    test('returns the largest number in a list with a single element', () {
      final List<int> list = [42];
      final result = findLargestNumber(list);
      expect(result, equals(42));
    });

    test('returns null if the list is empty', () {
      final List<int> list = [];
      final result = findLargestNumber(list);
      expect(result, isNull);
    });
  });
}