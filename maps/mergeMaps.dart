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
    expect(mergeMaps({"Daniel": 23, "Ronaldo": 17, "Clara": 32}, {"Cave": 19, "Ronaldo": 21}), equals({"Daniel": 23, "Ronaldo": 21, "Clara": 32, "Cave": 19}));
    expect(mergeMaps({"Erle": 16}, {"Toretinho": 21, "Amanda": 18}), equals({"Erle": 16, "Toretinho": 21, "Amanda": 18}));
    expect(mergeMaps({}, {}), equals({}));
  });
}