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
    expect(averageAgePerName([{"name": "Marcelo", "age": 23}, {"name": "Eduardo", "age": 17}, {"name": "Ugo", "age": 32}, {"name": "Cave", "age": 19}]), equals({"Marcelo": 23.0, "Eduardo": 17.0, "Ugo": 32.0, "Cave": 19.0}));
    expect(averageAgePerName([{"name": "Laura", "age": 16}, {"name": "Toretinho", "age": 21}, {"name": "Chris", "age": 18}, {"name": "David", "age": 20}, {"name": "Laura", "age": 18}]), equals({"Laura": 17.0, "Toretinho": 21.0, "Chris": 18.0, "David": 20.0}));
    expect(averageAgePerName([]), equals({}));
    expect(averageAgePerName([
    	{"name": "Laura", "age": 66},
    	{"name": "Laura", "age": 10},
    	{"name": "Laura", "age": 25},
    	{"name": "Laura", "age": 13},
    ]), equals({"Laura": (66.0 + 10.0 + 25.0 + 13.0) / 4}));
  });
}