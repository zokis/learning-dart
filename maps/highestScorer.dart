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
    expect(highestScorer({"Alice": 85, "Bruno": 73, "Djamila": 92, "Dave": 87}), equals("Djamila"));
    expect(highestScorer({"Amanda": 94, "Lúcia": 89, "Chris": 91}), equals("Amanda"));
    expect(highestScorer({}), equals(null));
  });