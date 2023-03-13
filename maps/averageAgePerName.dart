import 'package:test/test.dart';

Map<String?, double> averageAgePerName(List<Map<String, dynamic>> maps) {
	Map<String?, double> newMap = {};
	Map<String?, int> countNames = {};
	for(Map p in maps){
		String name = p["name"];
		int age = p["age"];
		if(newMap.containsKey(name)){
			newMap[name] = age.toDouble() + (newMap[name] ?? 0);
			countNames[name] = (countNames[name] ?? 0) + 1;
			
		} else {
			newMap[name] = age.toDouble();
			countNames[name] = 1;
		}
	}
	for (String? key in countNames.keys){
		newMap[key] = (newMap[key] ?? 0) / (countNames[key] ?? 1);
	}
	return newMap;
}

void main() {
  test('Test map with average age for each name', () {
    expect(averageAgePerName([{"name": "Alice", "age": 23}, {"name": "Bob", "age": 17}, {"name": "Charlie", "age": 32}, {"name": "Dave", "age": 19}]), equals({"Alice": 23.0, "Bob": 17.0, "Charlie": 32.0, "Dave": 19.0}));
    expect(averageAgePerName([{"name": "Amy", "age": 16}, {"name": "Ben", "age": 21}, {"name": "Chris", "age": 18}, {"name": "David", "age": 20}, {"name": "Amy", "age": 18}]), equals({"Amy": 17.0, "Ben": 21.0, "Chris": 18.0, "David": 20.0}));
    expect(averageAgePerName([]), equals({}));
    expect(averageAgePerName([
    	{"name": "Amy", "age": 66},
    	{"name": "Amy", "age": 10},
    	{"name": "Amy", "age": 25},
    	{"name": "Amy", "age": 13},
    ]), equals({"Amy": (66.0 + 10.0 + 25.0 + 13.0) / 4}));
  });
}
