import 'package:test/test.dart';

int largestCommonDivisor(int x, y){
	int large;
	if (x > y){
		large = x;
	} else {
		large = y;
	}
	for (int i = (large / 2).toInt(); i > 0; i--){
		if(x % i == 0 && y % i == 0){
			return i;
		}
	}
	return 1;
}

void main() {
  test('Test largest common divisor function', () {
    expect(largestCommonDivisor(24, 36), equals(12));
    expect(largestCommonDivisor(20, 25), equals(5));
    expect(largestCommonDivisor(17, 23), equals(1));
    expect(largestCommonDivisor(18, 24), equals(6));
  });
}