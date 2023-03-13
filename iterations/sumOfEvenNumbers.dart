import 'package:test/test.dart';

int sumOfEvenNumbers(int input){
	int sum = 0;
	for(int i = 2; i <= input; i++){
		if(i % 2 == 0){
			sum += i;
		}
	}
	return sum;
}

void main() {
  test('Test sum of even numbers function', () {
    expect(sumOfEvenNumbers(10), equals(30));
    expect(sumOfEvenNumbers(20), equals(110));
    expect(sumOfEvenNumbers(0), equals(0));
    expect(sumOfEvenNumbers(1), equals(0));
  });
}