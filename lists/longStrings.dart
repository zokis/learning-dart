import 'package:test/test.dart';

List<String> longStrings(List<String> strs){
	return strs.where((String i) => i.length > 5).toList();
}


void main() {
  test('Test list with strings longer than 5 characters', () {
    expect(longStrings(["apple", "banana", "orange", "grape", "kiwi"]), equals(["banana", "orange"]));
    expect(longStrings(["cat", "dog", "fish", "bird"]), equals([]));
    expect(longStrings([]), equals([]));
    expect(longStrings(["cherry", "pineapple", "watermelon"]), equals(["cherry", "pineapple", "watermelon"]));
  });
}