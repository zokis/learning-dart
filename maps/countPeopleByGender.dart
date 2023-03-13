import 'package:test/test.dart';

Map<String, int> countPeopleByGender(List<Map<String, dynamic>> persons){
	Map<String, int> count = {"female": 0, "male": 0};
	for(Map<String, dynamic> p in persons){
		if(p["gender"] == "female") {
			count["female"] = (count["female"] ?? 0) + 1;
		} else if (p["gender"] == "male"){
			count["male"] = (count["male"] ?? 0) + 1;
		}
	}
	return count;
}

void main() {
  test('Test map with number of people of each gender', () {
    expect(
        countPeopleByGender([
            {"name": "Clara", "age": 23, "gender": "female"},
            {"name": "Caio", "age": 17, "gender": "male"},
            {"name": "Erle", "age": 32, "gender": "male"},
            {"name": "Victor", "age": 19, "gender": "male"}
        ]), equals({"female": 1, "male": 3})
    );
    expect(
        countPeopleByGender([
            {"name": "Marílha", "age": 16, "gender": "female"}
        ]), equals({"female": 1, "male": 0})
    );
    expect(countPeopleByGender([]), equals({"female": 0, "male": 0}));
  });
}