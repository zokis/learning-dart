import 'package:test/test.dart';

int? secondSmallestNumber(List<int> numbers){
	if(numbers.length < 2){
		return null;
	}
	numbers.sort((a, b) => a - b);
	return numbers[1];
}


void main() {
  test('Test second smallest number in list', () {
    expect(secondSmallestNumber([11, 21, 31, 14, 51, 61]), equals(14));
    expect(secondSmallestNumber([1, 2, 3, 4, 5, 6]), equals(2));
    expect(secondSmallestNumber([10, 20, 30, 40, 50]), equals(20));
    expect(secondSmallestNumber([1]), equals(null));
    expect(secondSmallestNumber([]), equals(null));
    expect(secondSmallestNumber([-1, -2, -3]), equals(-2));
    expect(secondSmallestNumber([1, 1, 2, 3, 4]), equals(1));
  });
}