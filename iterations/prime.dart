import 'package:test/test.dart';

bool isPrime(int input) {
  bool isPrime = true;
  for(int i = input - 1; i > 1; i--){
  	if(input % i == 0) {
  		isPrime = false;
  		break;
  	}
  }
  return isPrime;
}

void main() {
  test('Test prime number function', () {
    expect(isPrime(7), equals(true));
    expect(isPrime(10), equals(false));
    expect(isPrime(17), equals(true));
    expect(isPrime(20), equals(false));
  });
}