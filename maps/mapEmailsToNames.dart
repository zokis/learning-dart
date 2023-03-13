import 'package:test/test.dart';

Map<String?, String> mapEmailsToNames(Map<String, String> map) {
	Map<String?, String> newMap = {};
	for(String key in map.keys){
		newMap[map[key]] = key;
	}
	return newMap;
}

void main() {
  test('Test map with email addresses as keys and names as values', () {
    expect(
    	mapEmailsToNames(
    		{"Alice": "alice@example.com", "Bob": "bob@example.com", "Charlie": "charlie@example.com"}
    	),
    	equals(
    		{"alice@example.com": "Alice", "bob@example.com": "Bob", "charlie@example.com": "Charlie"}
    	)
    );
    expect(mapEmailsToNames({"Amy": "amy@example.com"}), equals({"amy@example.com": "Amy"}));
    expect(mapEmailsToNames({}), equals({}));
  });
}