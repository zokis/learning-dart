import 'package:test/test.dart';

int factorial(int input){
	int f;
	if(input == 0){
		f = 1;
	} else {
		f = input;
	}
	while (input >= 2) {
		input--;
		f *= input;
	}
	return f;
}


void main() {
  test('Test factorial function', () {
    expect(factorial(5), equals(120));
    expect(factorial(0), equals(1));
    expect(factorial(1), equals(1));
    expect(factorial(10), equals(3628800));
  });
}
