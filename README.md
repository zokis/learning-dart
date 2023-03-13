# Exercises to learn dart
## Iterations

### Exercise 1:
Write a program that takes an integer as input and returns whether it is a prime number or not.

```dart
import 'package:test/test.dart';

void main() {
  test('Test prime number function', () {
    expect(isPrime(7), equals(true));
    expect(isPrime(10), equals(false));
    expect(isPrime(17), equals(true));
    expect(isPrime(20), equals(false));
  });
}
```

### Exercise 2:
Write a program that takes an integer as input and returns the sum of all the even numbers from 0 to that integer.

```dart
import 'package:test/test.dart';

void main() {
  test('Test sum of even numbers function', () {
    expect(sumOfEvenNumbers(10), equals(30));
    expect(sumOfEvenNumbers(20), equals(110));
    expect(sumOfEvenNumbers(0), equals(0));
    expect(sumOfEvenNumbers(1), equals(0));
  });
}
```
### Exercise 3:
Write a program that takes two integers as input and returns the largest common divisor of the two numbers.

```dart
import 'package:test/test.dart';

void main() {
  test('Test largest common divisor function', () {
    expect(largestCommonDivisor(24, 36), equals(12));
    expect(largestCommonDivisor(20, 25), equals(5));
    expect(largestCommonDivisor(17, 23), equals(1));
    expect(largestCommonDivisor(18, 24), equals(6));
  });
}
```

### Exercise 4:
Write a program that takes an integer as input and prints out the factorial of that integer.
```dart
import 'package:test/test.dart';

void main() {
  test('Test factorial function', () {
    expect(factorial(5), equals(120));
    expect(factorial(0), equals(1));
    expect(factorial(1), equals(1));
    expect(factorial(10), equals(3628800));
  });
}
```

### Exercise 5:
Write a program that takes an integer as input and prints out a triangle made of asterisks, where the base of the triangle has a length equal to the input integer.

```dart
import 'package:test/test.dart';

void main() {
  test('Test triangle function', () {
    expect(printTriangle(15), equals("*\n**\n***\n****\n*****\n******\n*******\n********\n*********\n**********\n***********\n************\n*************\n**************\n***************"));
    expect(printTriangle(5), equals("*\n**\n***\n****\n*****"));
    expect(printTriangle(3), equals("*\n**\n***"));
    expect(printTriangle(1), equals("*"));
    expect(printTriangle(0), equals(""));
  });
}
```

## Lists

### Exercise 1:
Write a function that takes a list of integers as input and returns a new list with only the even numbers from the original list.

```dart
void main() {
  test('Test list with even numbers', () {
    expect(evenNumbers([1, 2, 3, 4, 5, 6]), equals([2, 4, 6]));
    expect(evenNumbers([2, 4, 6, 8, 10]), equals([2, 4, 6, 8, 10]));
    expect(evenNumbers([1, 3, 5, 7, 9]), equals([]));
    expect(evenNumbers([0, 1, 2, 3, 4]), equals([0, 2, 4]));
  });
}
```

### Exercise 2:
Write a function that takes two lists of integers as input and returns a new list with only the common numbers between them.
```dart
void main() {
  test('Test list with common numbers', () {
    expect(commonNumbers([1, 2, 3, 4, 5, 6], [4, 5, 6, 7, 8]), equals([4, 5, 6]));
    expect(commonNumbers([10, 20, 30, 40], [40, 30, 20, 10]), equals([10, 20, 30, 40]));
    expect(commonNumbers([1, 2, 3], [4, 5, 6]), equals([]));
    expect(commonNumbers([1, 1, 2, 3, 4], [1, 4, 5]), equals([1, 4]));
    expect(commonNumbers([1, 1, 2, 2, 3, 4], [1, 4, 5]), equals([1, 4]));
    expect(commonNumbers([1, 2, 3], [3, 4, 5, 6, 3]), equals([3]));
  });
}
```
### Exercise 3:
Write a function that takes a list of integers as input and returns the largest number in the list.
```dart
void main() {
  group('findLargestNumber', () {
    test('returns the largest number in a list of positive integers', () {
      final list = [1, 3, 2, 5, 4];
      final result = findLargestNumber(list);
      expect(result, equals(5));
    });

    test('returns the largest number in a list of negative integers', () {
      final list = [-1, -3, -2, -5, -4];
      final result = findLargestNumber(list);
      expect(result, equals(-1));
    });

    test('returns the largest number in a list with a single element', () {
      final list = [42];
      final result = findLargestNumber(list);
      expect(result, equals(42));
    });

    test('returns null if the list is empty', () {
      final list = [];
      final result = findLargestNumber(list);
      expect(result, isNull);
    });
  });
}
```
### Exercise 4:
Write a function that takes a list of strings as input and returns a new list with only the strings that have more than 5 characters.
```dart
void main() {
  test('Test list with strings longer than 5 characters', () {
    expect(longStrings(["apple", "banana", "orange", "grape", "kiwi"]), equals(["banana", "orange"]));
    expect(longStrings(["cat", "dog", "fish", "bird"]), equals([]));
    expect(longStrings([]), equals([]));
    expect(longStrings(["cherry", "pineapple", "watermelon"]), equals(["cherry", "pineapple", "watermelon"]));
  });
}
```
### Exercise 5:
Write a function that takes a list of integers as input and returns the second smallest number in the list.
```dart
void main() {
  test('Test second smallest number in list', () {
    expect(secondSmallestNumber([11, 21, 31, 14, 51, 61]), equals(14));
    expect(secondSmallestNumber([1, 2, 3, 4, 5, 6]), equals(2));
    expect(secondSmallestNumber([10, 20, 30, 40, 50]), equals(20));
    expect(secondSmallestNumber([1]), equals(null));
    expect(secondSmallestNumber([]), equals(null));
    expect(secondSmallestNumber([-1, -2, -3]), equals(-2));
    expect(secondSmallestNumber([1, 1, 2, 3, 4]), equals(1));
  });
}
```
## maps

### Exercise 1:
Write a function that takes two maps as input and returns a new map with all the key-value pairs from both maps, with the values of overlapping keys from the second map taking precedence.
```dart
void main() {
  test('Test merging two maps with overlapping keys', () {
    expect(mergeMaps({"Daniel": 23, "Ronaldo": 17, "Clara": 32}, {"Cave": 19, "Ronaldo": 21}), equals({"Daniel": 23, "Ronaldo": 21, "Clara": 32, "Cave": 19}));
    expect(mergeMaps({"Erle": 16}, {"Toretinho": 21, "Amanda": 18}), equals({"Erle": 16, "Toretinho": 21, "Amanda": 18}));
    expect(mergeMaps({}, {}), equals({}));
  });
}
```
### Exercise 2:
Write a function that takes a map of names and email addresses as input and returns a new map with the email addresses as the keys and the names as the values.
```dart
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
```
### Exercise 3:
Write a function that takes a list of maps, where each map contains the name and age of a person, and returns a new map with the average age for each name.
```dart
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
```
### Exercise 4:
Write a function that takes a map of names and scores as input and returns the name of the person with the highest score.
```dart
void main() {
  test('Test map with highest score', () {
    expect(highestScorer({"Alice": 85, "Bruno": 73, "Djamila": 92, "Dave": 87}), equals("Djamila"));
    expect(highestScorer({"Amanda": 94, "Lúcia": 89, "Chris": 91}), equals("Amanda"));
    expect(highestScorer({}), equals(null));
  });
}
```
### Exercise 5:
Write a function that takes a list of maps, where each map contains the name, age, and gender of a person, and returns a new map with the number of people of each gender.
```dart
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
```
## object oriented programming

### Exercise 1:
Create a class hierarchy for a video game that includes a base class for the game character and derived classes for different character types (e.g. warrior, mage, archer). Implement methods that allow the characters to perform different actions and interact with each other.

```dart
import 'package:test/test.dart';

void main() {
  group('Game character', () {
    test('Base class should have default values', () {
      final gameChar = GameCharacter();

      expect(gameChar.healthPoints, 100);
      expect(gameChar.manaPoints, 50);
      expect(gameChar.level, 1);
    });

    test('Characters should be able to attack', () {
      final warrior = Warrior();
      final mage = Mage();
      final archer = Archer();

      expect(warrior.attack(), 'Warrior attacks with sword!');
      expect(mage.attack(), 'Mage attacks with magic!');
      expect(archer.attack(), 'Character attacks!');
    });

    test('Characters should be able to defend', () {
      final warrior = Warrior();
      final mage = Mage();
      final archer = Archer();

      expect(warrior.defend(), 'Warrior defends with shield!');
      expect(mage.defend(), 'Mage defends with magic barrier!');
      expect(mage.defend(), 'Mage defends with magic barrier!');
      expect(archer.defend(), 'Character defends!');
    });

    test('Characters should be able to heal themselves', () {
      final warrior = Warrior();
      final mage = Mage();
      final archer = Archer();

      expect(warrior.heal(), 'Warrior heals with potion!');
      expect(mage.heal(), 'Mage heals with spell!');
      expect(archer.heal(), 'Character heals!');
    });
  });

  group('Warrior', () {
    test('Warrior should have default values', () {
      final warrior = Warrior();

      expect(warrior.healthPoints, 120);
      expect(warrior.manaPoints, 20);
      expect(warrior.level, 1);
    });

    test('Warrior should have unique methods', () {
      final warrior = Warrior();

      expect(warrior.charge(), 'Warrior charges with battle cry!');
    });
  });

  group('Mage', () {
    test('Mage should have default values', () {
      final mage = Mage();

      expect(mage.healthPoints, 80);
      expect(mage.manaPoints, 80);
      expect(mage.level, 1);
    });

    test('Mage should have unique methods', () {
      final mage = Mage();

      expect(mage.castSpell(), 'Mage casts spell with magic wand!');
    });
  });

  group('Archer', () {
    test('Archer should have default values', () {
      final archer = Archer();

      expect(archer.healthPoints, 100);
      expect(archer.manaPoints, 50);
      expect(archer.level, 1);
    });

    test('Archer should have unique methods', () {
      final archer = Archer();

      expect(archer.shoot(), 'Archer shoots arrow with bow!');
    });
  });
}
```

### Exercise 2:
Implement a class for a library that allows users to search for books by title, author, or genre. Include methods for borrowing and returning books and for managing the library's collection of books.

```dart
void main() {
  group('Book tests', () {
    test('Book values', () {
      final book = Book('A elite do atraso: Da escravidão a Bolsonaro', 'Jessé José Freire de Souza', 'Political Science');
      expect(book.title, equals('A elite do atraso: Da escravidão a Bolsonaro'));
      expect(book.author, equals('Jessé José Freire de Souza'));
      expect(book.genre, equals('Political Science'));
      expect(book.isAvailable, isTrue);
    });
    test('Book borrow', () {
      final book = Book('A elite do atraso: Da escravidão a Bolsonaro', 'Jessé José Freire de Souza', 'Political Science');
      expect(book.isAvailable, isTrue);
      book.borrow();
      expect(book.isAvailable, isFalse);
    });
    test('Book return', () {
      final book = Book('A elite do atraso: Da escravidão a Bolsonaro', 'Jessé José Freire de Souza', 'Political Science', isAvailable:false);
      expect(book.isAvailable, isFalse);
      book.returnBook();
      expect(book.isAvailable, isTrue);
    });
  });
  group('Library tests', () {
    test('Search books by title', () {
      final book1 = Book('A elite do atraso: Da escravidão a Bolsonaro', 'Jessé José Freire de Souza', 'Political Science');
      final library = Library([book1]);
      final book2 = Book('The Origin of the Family, Private Property and the State', 'Friedrich Engels', 'Political Science');
      final book3 = Book('Who Rules the World?', 'Noam Chomsky', 'Philosophy');
      final book4 = Book('Problems of knowledge and freedom (The Russell lectures)', 'Noam Chomsky', 'Philosophy');

      library.addBook(book2);
      library.addBook(book3);
      library.addBook(book4);

      final searchResult = library.searchByTitle('Who Rules the World?');

      expect(searchResult, equals([book3]));
    });

    test('Search books by author', () {
      final book1 = Book('A elite do atraso: Da escravidão a Bolsonaro', 'Jessé José Freire de Souza', 'Political Science');
      final book2 = Book('The Origin of the Family, Private Property and the State', 'Friedrich Engels', 'Political Science');
      final library = Library([book1, book2]);
      final book3 = Book('Who Rules the World?', 'Noam Chomsky', 'Philosophy');
      final book4 = Book('Problems of knowledge and freedom (The Russell lectures)', 'Noam Chomsky', 'Philosophy');

      library.addBook(book3);
      library.addBook(book4);

      final searchResult = library.searchByAuthor('Noam Chomsky');

      expect(searchResult, equals([book3, book4]));
    });

    test('Search books by genre', () {
      final library = Library([]);
      final book1 = Book('A elite do atraso: Da escravidão a Bolsonaro', 'Jessé José Freire de Souza', 'Political Science');
      final book2 = Book('The Origin of the Family, Private Property and the State', 'Friedrich Engels', 'Political Science');
      final book3 = Book('Who Rules the World?', 'Noam Chomsky', 'Philosophy');
      final book4 = Book('Problems of knowledge and freedom (The Russell lectures)', 'Noam Chomsky', 'Philosophy');

      library.addBook(book1);
      library.addBook(book2);
      library.addBook(book3);
      library.addBook(book4);

      final searchResult = library.searchByGenre('Political Science');

      expect(searchResult, equals([book1, book2]));
    });

    test('Borrow and return book', () {
      final library = Library([]);
      final book1 = Book('A elite do atraso: Da escravidão a Bolsonaro', 'Jessé José Freire de Souza', 'Political Science');

      library.addBook(book1);
      library.borrowBook(book1.title, book1.author);
      expect(library.isBookAvailable(book1), isFalse);

      library.returnBook(book1);
      expect(library.isBookAvailable(book1), isTrue);
    });

    test('Manage library collection', () {
      final library = Library([]);
      final book1 = Book('A elite do atraso: Da escravidão a Bolsonaro', 'Jessé José Freire de Souza', 'Political Science');
      final book2 = Book('The Origin of the Family, Private Property and the State', 'Friedrich Engels', 'Political Science');

      library.addBook(book1);
      expect(library.getBooks(), equals([book1]));

      library.addBook(book2);
      expect(library.getBooks(), equals([book1, book2]));

      library.removeBook(book1);
      expect(library.getBooks(), equals([book2]));

      library.removeBook(book2);
      expect(library.getBooks(), isEmpty);
    });
  });
}
```

### Exercise 3:
Create a class for a social media platform that allows users to post messages, follow other users, and receive notifications when their posts are liked or commented on. Implement methods for managing user accounts, posting messages, and displaying a user's feed.

```dart
import 'package:test/test.dart';

void main() {
  group('Social Media Platform Tests', () {
    SocialMediaPlatform platform;

    setUp(() {
      platform = SocialMediaPlatform();
    });

    test('Add User Test', () {
      platform.addUser('Augusto');
      expect(platform.getUsers(), ['Augusto']);
    });

    test('Post Message Test', () {
      platform.addUser('Augusto');
      platform.post('Augusto', 'Hello World');
      expect(platform.getPosts('Augusto'), ['Hello World']);
    });

    test('Follow User Test', () {
      platform.addUser('Augusto');
      platform.addUser('Gelox');
      platform.follow('Augusto', 'Gelox');
      expect(platform.getFollowers('Gelox'), ['Augusto']);
    });

    test('Like Post Test', () {
      platform.addUser('Augusto');
      platform.post('Augusto', 'Hello World');
      platform.like('Augusto', 0);
      expect(platform.getLikes('Augusto', 0), 1);
    });

    test('Comment Post Test', () {
      platform.addUser('Augusto');
      platform.post('Augusto', 'Hello World');
      platform.comment('Augusto', 0, 'Nice post!');
      expect(platform.getComments('Augusto', 0), ['Nice post!']);
    });

    test('Display User Feed Test', () {
      platform.addUser('Augusto');
      platform.addUser('Gelox');
      platform.post('Augusto', 'Hello World');
      platform.follow('Gelox', 'Augusto');
      expect(platform.getFeed('Gelox'), [{'user': 'Augusto', 'post': 'Hello World'}]);
    });
  });
}
```

### Exercise 4:
Develop a class hierarchy for a restaurant that includes a base class for the menu items and derived classes for different types of food (e.g. appetizers, entrees, desserts). Include methods for ordering and preparing food, and for managing the restaurant's inventory of ingredients.


```dart
void main() {
  test('Menu Item has a name and price', () {
    final menuItem = MenuItem('Pizza', 10.99);
    expect(menuItem.name, 'Pizza');
    expect(menuItem.price, 10.99);
  });

  test('Appetizer is a type of menu item', () {
    final appetizer = Appetizer('Nachos', 6.99);
    expect(appetizer.name, 'Nachos');
    expect(appetizer.price, 6.99);
    expect(appetizer is MenuItem, isTrue);
  });

  test('Entree is a type of menu item', () {
    final entree = Entree('Spaghetti', 12.99);
    expect(entree.name, 'Spaghetti');
    expect(entree.price, 12.99);
    expect(entree is MenuItem, isTrue);
  });

  test('Dessert is a type of menu item', () {
    final dessert = Dessert('Cheesecake', 7.99);
    expect(dessert.name, 'Cheesecake');
    expect(dessert.price, 7.99);
    expect(dessert is MenuItem, isTrue);
  });

  test('Inventory can add and remove ingredients', () {
    final inventory = Inventory();
    inventory.addIngredient('Flour', 10);
    inventory.addIngredient('Sugar', 5);
    inventory.removeIngredient('Flour', 2);
    expect(inventory.getIngredientCount('Flour'), 8);
    expect(inventory.getIngredientCount('Sugar'), 5);
  });

  test('Order can add and remove menu items', () {
    final order = Order();
    final appetizer = Appetizer('Nachos', 6.99);
    final entree = Entree('Spaghetti', 12.99);
    final dessert = Dessert('Cheesecake', 7.99);
    order.addMenuItem(appetizer);
    order.addMenuItem(entree);
    order.removeMenuItem(appetizer);
    order.addMenuItem(dessert);
    expect(order.getMenuItems(), [entree, dessert]);
  });

  test('Chef can prepare menu items', () {
    final chef = Chef();
    final spaghetti = Entree('Spaghetti', 12.99);
    final cheesecake = Dessert('Cheesecake', 7.99);
    final inventory = Inventory();
    inventory.addIngredient('Pasta', 2);
    inventory.addIngredient('Tomato Sauce', 1);
    inventory.addIngredient('Flour', 1);
    inventory.addIngredient('Sugar', 1);
    inventory.addIngredient('Cream Cheese', 1);
    chef.prepare(spaghetti, inventory);
    chef.prepare(cheesecake, inventory);
    expect(spaghetti.isPrepared(), isTrue);
    expect(cheesecake.isPrepared(), isFalse);
  });
}
```

### Exercise 5:
Implement a class for a banking system that allows users to open accounts, deposit and withdraw money, and transfer funds between accounts. Include methods for managing user accounts, displaying account balances, and generating transaction reports.

```dart
void main() {
  group('Banking System Tests', () {
    test('Can create an account with a balance of 0', () {
      final bankingSystem = BankingSystem();
      final account = bankingSystem.openAccount('Caio');
      expect(account.ownerName, equals('Caio'));
      expect(account.balance, equals(0));
    });

    test('Can deposit money into an account', () {
      final bankingSystem = BankingSystem();
      final account = bankingSystem.openAccount('Caio');
      bankingSystem.deposit(account.id, 500.0);
      expect(account.balance, equals(500.0));
    });

    test('Can withdraw money from an account', () {
      final bankingSystem = BankingSystem();
      final account = bankingSystem.openAccount('Caio');
      bankingSystem.deposit(account.id, 1000.0);
      bankingSystem.withdraw(account.id, 500.0);
      expect(account.balance, equals(500.0));
    });

    test('Can transfer money between accounts', () {
      final bankingSystem = BankingSystem();
      final account1 = bankingSystem.openAccount('Caio');
      final account2 = bankingSystem.openAccount('Marília');
      bankingSystem.deposit(account1.id, 1000.0);
      bankingSystem.transfer(account1.id, account2.id, 500.0);
      expect(account1.balance, equals(500.0));
      expect(account2.balance, equals(500.0));
    });

    test('Can display account balances', () {
      final bankingSystem = BankingSystem();
      final account1 = bankingSystem.openAccount('Caio');
      final account2 = bankingSystem.openAccount('Marília');
      bankingSystem.deposit(account1.id, 1000.0);
      bankingSystem.deposit(account2.id, 500.0);
      expect(bankingSystem.displayAccountBalance(account1.id), equals(1000.0));
      expect(bankingSystem.displayAccountBalance(account2.id), equals(500.0));
    });

    test('Can generate transaction reports', () {
      final bankingSystem = BankingSystem();
      final account1 = bankingSystem.openAccount('Caio');
      final account2 = bankingSystem.openAccount('Marília');
      bankingSystem.deposit(account1.id, 1000.0);
      bankingSystem.deposit(account2.id, 500.0);
      bankingSystem.transfer(account1.id, account2.id, 500.0);
      final report = bankingSystem.generateTransactionReport();
      expect(report.length, equals(4));

      expect(report[0], equals('Caio deposited 1000.0'));
      expect(report[1], equals('Caio transferred 500.0 to Marília'));
      expect(report[2], equals('Marília deposited 500.0'));
      expect(report[3], equals('Marília received 500.0 from Caio'));
    });
  });
}
```
