class Recipe {
  String name;
  String category;
  double duration;
  String imageUrl;

  Recipe({
    required this.name,
    required this.category,
    required this.duration,
    required this.imageUrl,
  });

  static List categoryList() {
    List<String> categories = [];

    for (var i = 0; i < samples.length; i++) {
      var _category = samples[i].category;

      if (categories.isEmpty) {
        categories.add("All"); // Default value
        categories.add(_category);
      } else {
        bool categoryExists = categories.any((element) => element == _category);
        if (categoryExists) {
          continue;
        } else {
          categories.add(_category);
        }
      }
    }
    return categories;
  }

  static List<Recipe> samples = [
    Recipe(
      name: 'Spaghetti and Meatballs',
      category: "Food",
      duration: 45,
      imageUrl: 'assets/recipes/spaghetti_meatballs.jpg',
    ),
    Recipe(
      name: 'Tomato Soup',
      category: "Food",
      duration: 50,
      imageUrl: 'assets/recipes/tomato_soup.jpg',
    ),
    Recipe(
      name: 'French Toast',
      category: "Dessert",
      duration: 30,
      imageUrl: 'assets/recipes/french_toast.jpg',
    ),
    Recipe(
      name: 'Grilled Cheese',
      category: "Food",
      duration: 50,
      imageUrl: 'assets/recipes/grilled_cheese.jpg',
    ),
    Recipe(
      name: 'Chocolate Chip Cookies',
      category: "Food",
      duration: 50,
      imageUrl: 'assets/recipes/chocolate_chip_cookies.jpg',
    ),
    Recipe(
      name: 'Taco Salad',
      category: "Food",
      duration: 50,
      imageUrl: 'assets/recipes/taco_salad.jpg',
    ),
    Recipe(
      name: 'Hawaiian Pizza',
      category: "Food",
      duration: 50,
      imageUrl: 'assets/recipes/hawaiian_pizza.jpg',
    ),
    Recipe(
      name: 'Banana Bread',
      category: "Dessert",
      duration: 30,
      imageUrl: 'assets/recipes/banana_bread.jpg',
    ),
    Recipe(
      name: 'Fruit Trifle Cake',
      category: "Dessert",
      duration: 30,
      imageUrl: 'assets/recipes/fruit_trifle_cake.jpg',
    ),
    Recipe(
      name: 'Apple Crumble',
      category: "Snack",
      duration: 30,
      imageUrl: 'assets/recipes/apple_crumble.jpg',
    ),
    Recipe(
      name: 'Mojito',
      category: "Cocktail",
      duration: 30,
      imageUrl: 'assets/recipes/mojito.jpg',
    ),
  ];
}
