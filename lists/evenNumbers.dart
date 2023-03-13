import 'package:test/test.dart';

List<int> evenNumbers (List<int> numbers){
	return numbers.where((int i) => i % 2 == 0).toList();
}

void main() {
  test('Test list with even numbers', () {
    expect(evenNumbers([1, 2, 3, 4, 5, 6]), equals([2, 4, 6]));
    expect(evenNumbers([2, 4, 6, 8, 10]), equals([2, 4, 6, 8, 10]));
    expect(evenNumbers([1, 3, 5, 7, 9]), equals([]));
    expect(evenNumbers([0, 1, 2, 3, 4]), equals([0, 2, 4]));
  });
}