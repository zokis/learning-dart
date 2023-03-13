import 'package:test/test.dart';


class Recipe {
  Map<String, int> ingredients = {};

  void addIngredient(String name, int count) {
    ingredients[name] = count;
  }
}

class MenuItem {
  String name;
  double price;
  Recipe recipe;
  String type;
  bool isPrepared = false;

  MenuItem(this.name, this.price, this.recipe, [this.type = "main course"]);
}

class Appetizer extends MenuItem {
  Appetizer(String name, double price, Recipe recipe) : super(name, price, recipe, "Appetizer");
}

class Entree extends MenuItem {
  Entree(String name, double price, Recipe recipe) : super(name, price, recipe, "Entree");
}

class Dessert extends MenuItem {
  Dessert(String name, double price, Recipe recipe) : super(name, price, recipe, "Dessert");
}

class Menu {
  List<dynamic> itens;
  Menu(this.itens);
}

class Inventory {
  Map<String, int> ingredients = {};

  void addIngredient(String name, int count) {
    ingredients[name] = count;
  }

  void removeIngredient(String name, int count) {
    ingredients[name] = (ingredients[name] ?? 0) - count;
  }

  int getIngredientCount(String name) {
    return ingredients[name] ?? 0;
  }
}

class Order {
  List<MenuItem> menuItems = [];

  void addMenuItem(MenuItem menuItem) {
    menuItems.add(menuItem);
  }

  void removeMenuItem(MenuItem menuItem) {
    menuItems.remove(menuItem);
  }

  List<MenuItem> getMenuItems() {
    return List.from(menuItems);
  }
}

class Chef {
  bool enoughInInventory(Map<String, int> ingredient, Inventory inventory){
    for(String key in ingredient.keys){
      int c = ingredient[key] ?? 0;
      if(inventory.getIngredientCount(key) < c){
        return false;
      }
    }
    return true;
  }

  void prepare(MenuItem menuItem, Inventory inventory) {
    bool isPreparable = true;
    for(String ingredientName in menuItem.recipe.ingredients.keys){
      Map<String, int> ingredient = {ingredientName: menuItem.recipe.ingredients[ingredientName] ?? 0};
      if(!enoughInInventory(ingredient, inventory)){
        menuItem.isPrepared = false;
        isPreparable = false;
        break;
      }
    }
    if(isPreparable){
      menuItem.isPrepared = true;
      for(String ingredientName in menuItem.recipe.ingredients.keys){
        Map<String, int> ingredient = {ingredientName: menuItem.recipe.ingredients[ingredientName] ?? 0};
        for(String key in ingredient.keys){
          inventory.removeIngredient(key, ingredient[key] ?? 0);
        }
      }
    }
  }
}

class Restaurant {
  Menu menu;
  Chef chef;
  Inventory inventory;
  Restaurant(this.menu, this.chef, this.inventory);
}

void main() {
  test('Menu Item has a name and price', () {
    final menuItem = MenuItem('Pizza', 50.99, Recipe());
    expect(menuItem.name, 'Pizza');
    expect(menuItem.price, 50.99);
  });

  test('Appetizer is a type of menu item', () {
    final appetizer = Appetizer('Nachos', 16.99, Recipe());
    expect(appetizer.name, 'Nachos');
    expect(appetizer.price, 16.99);
    expect(appetizer is MenuItem, isTrue);
  });

  test('Entree is a type of menu item', () {
    final entree = Entree('Spaghetti', 22.99, Recipe());
    expect(entree.name, 'Spaghetti');
    expect(entree.price, 22.99);
    expect(entree is MenuItem, isTrue);
  });

  test('Dessert is a type of menu item', () {
    final dessert = Dessert('Cheesecake', 27.99, Recipe());
    expect(dessert.name, 'Cheesecake');
    expect(dessert.price, 27.99);
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
    final appetizer = Appetizer('Nachos', 16.99, Recipe());
    final entree = Entree('Spaghetti', 22.99, Recipe());
    final dessert = Dessert('Cheesecake', 27.99, Recipe());
    order.addMenuItem(appetizer);
    order.addMenuItem(entree);
    order.removeMenuItem(appetizer);
    order.addMenuItem(dessert);
    expect(order.getMenuItems(), [entree, dessert]);
  });

  test('Chef can prepare menu items', () {
    final chef = Chef();
    Recipe spaghettiRecipe = Recipe();
    spaghettiRecipe.addIngredient('Pasta', 2);
    spaghettiRecipe.addIngredient('Tomato Sauce', 1);
    final spaghetti = Entree('Spaghetti', 22.99, spaghettiRecipe);
    final inventory = Inventory();
    inventory.addIngredient('Pasta', 1);
    inventory.addIngredient('Tomato Sauce', 10);
    expect(
      chef.enoughInInventory({'Pasta': 2}, inventory), isFalse
    );
    expect(
      chef.enoughInInventory({'Tomato Sauce': 2}, inventory), isTrue
    );
  });

  test('Chef prepare menu items', () {
    final chef = Chef();
    Recipe spaghettiRecipe = Recipe();
    spaghettiRecipe.addIngredient('Pasta', 2);
    spaghettiRecipe.addIngredient('Tomato Sauce', 1);

    Recipe cheesecakeRecipe = Recipe();
    cheesecakeRecipe.addIngredient('Pasta', 2);
    cheesecakeRecipe.addIngredient('Tomato Sauce', 1);

    final spaghetti = Entree('Spaghetti', 22.99, spaghettiRecipe);
    final cheesecake = Dessert('Cheesecake', 27.99, cheesecakeRecipe);
    final inventory = Inventory();
    inventory.addIngredient('Pasta', 2);
    inventory.addIngredient('Tomato Sauce', 1);
    inventory.addIngredient('Flour', 1);
    inventory.addIngredient('Sugar', 1);
    inventory.addIngredient('Cream Cheese', 1);
    chef.prepare(spaghetti, inventory);
    chef.prepare(cheesecake, inventory);
    expect(spaghetti.isPrepared, isTrue);
    expect(cheesecake.isPrepared, isFalse);
  });
}