import 'package:test/test.dart';


Map<String, int?> mergeMaps(Map<String, int> map1, map2) {
	Map<String, int?> newMap = {};
	for(String key1 in map1.keys){
		newMap[key1] = map1[key1];
	}
	for(String key2 in map2.keys){
		newMap[key2] = map2[key2];
	}
	return newMap;
}

void main() {
  test('Test merging two maps with overlapping keys', () {
    expect(mergeMaps({"Alice": 23, "Bob": 17, "Charlie": 32}, {"Dave": 19, "Bob": 21}), equals({"Alice": 23, "Bob": 21, "Charlie": 32, "Dave": 19}));
    expect(mergeMaps({"Amy": 16}, {"Ben": 21, "Chris": 18}), equals({"Amy": 16, "Ben": 21, "Chris": 18}));
    expect(mergeMaps({}, {}), equals({}));
  });
}