import 'package:test/test.dart';


String? highestScorer(Map<String, int> scores) {
	Map<String, dynamic> high = {"name": null, "score": 0};
	for(String key in scores.keys){
		if(high["score"] < scores[key]){
			high = {"name": key, "score": scores[key]};
		}
	}
	return high["name"];
}

void main() {
  test('Test map with highest score', () {
    expect(highestScorer({"Alice": 85, "Bob": 73, "Charlie": 92, "Dave": 87}), equals("Charlie"));
    expect(highestScorer({"Amy": 94, "Ben": 89, "Chris": 91}), equals("Amy"));
    expect(highestScorer({}), equals(null));
  });
}