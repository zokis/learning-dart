import 'package:test/test.dart';

List<int> commonNumbers(List<int> l1, l2){
	List<int> common = [];
	for (int i = 0; i<l1.length; i++){
		for (int y = 0; y<l2.length; y++){
			if(l1[i] == l2[y] && !common.contains(l1[i])){
				common.add(l1[i]);
			}
		}
	}
	return common;
}

void main() {
  test('Test list with common numbers', () {
    expect(commonNumbers([1, 2, 3, 4, 5, 6], [4, 5, 6, 7, 8]), equals([4, 5, 6]));
    expect(commonNumbers([10, 20, 30, 40], [40, 30, 20, 10]), equals([10, 20, 30, 40]));
    expect(commonNumbers([1, 2, 3], [4, 5, 6]), equals([]));
    expect(commonNumbers([1, 1, 2, 3, 4], [1, 4, 5]), equals([1, 4]));
    expect(commonNumbers([1, 1, 2, 2, 3, 4], [1, 4, 5]), equals([1, 4]));
    expect(commonNumbers([1, 2, 3], [3, 4, 5, 6, 3]), equals([3]));
  });
}
