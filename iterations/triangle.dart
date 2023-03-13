import 'package:test/test.dart';

String printTriangle(int input){
	String t = "";
	for(int i = 1; i <= input; i++){
		for(int y = 0; y < i; y++){
			t += "*";
		}
		if(i<input){
			t += "\n";
		}
	}
	return t;
}

void main() {
  test('Test triangle function', () {
    expect(printTriangle(15), equals("*\n**\n***\n****\n*****\n******\n*******\n********\n*********\n**********\n***********\n************\n*************\n**************\n***************"));
    expect(printTriangle(5), equals("*\n**\n***\n****\n*****"));
    expect(printTriangle(3), equals("*\n**\n***"));
    expect(printTriangle(1), equals("*"));
    expect(printTriangle(0), equals(""));
  });
}