import 'package:test/test.dart';


class GameCharacter {
  int healthPoints = 100;
  int manaPoints = 50;
  int level = 1;

  String attack() => 'Character attacks!';
  String defend() => 'Character defends!';
  String heal() => 'Character heals!';
}

class Warrior extends GameCharacter {
  @override
  int healthPoints = 120;
  @override
  int manaPoints = 20;

  String charge() => 'Warrior charges with battle cry!';
  @override
  String attack() => 'Warrior attacks with sword!';
  @override
  String defend() => 'Warrior defends with shield!';
  @override
  String heal() => 'Warrior heals with potion!';
}

class Mage extends GameCharacter {
  @override
  int healthPoints = 80;
  @override
  int manaPoints = 80;

  String castSpell() => 'Mage casts spell with magic wand!';
  @override
  String attack() => 'Mage attacks with magic!';
  @override
  String defend() => 'Mage defends with magic barrier!';
  @override
  String heal() => 'Mage heals with spell!';
}

class Archer extends GameCharacter {
  String shoot() => 'Archer shoots arrow with bow!';
}


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