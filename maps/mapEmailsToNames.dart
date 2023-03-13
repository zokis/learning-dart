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
            {"Iuri": "iuri@example.com", "Dantas": "dantas@example.com", "Murillo": "murillo@example.com"}
        ),
        equals(
            {"iuri@example.com": "Iuri", "dantas@example.com": "Dantas", "murillo@example.com": "Murillo"}
        )
    );
    expect(mapEmailsToNames({"Gabriel": "gabriel@example.com"}), equals({"gabriel@example.com": "Gabriel"}));
    expect(mapEmailsToNames({}), equals({}));
  });
}