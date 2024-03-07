class CategoryModel {
  String name;
  String iconPath;
  bool isAltBoxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.isAltBoxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
      name: 'Salad',
      iconPath: 'assets/icons/plate.svg',
      isAltBoxColor: false,
    ));

    categories.add(CategoryModel(
      name: 'Cake',
      iconPath: 'assets/icons/pancakes.svg',
      isAltBoxColor: true,
    ));

    categories.add(CategoryModel(
      name: 'Pie',
      iconPath: 'assets/icons/pie.svg',
      isAltBoxColor: false,
    ));

    categories.add(CategoryModel(
      name: 'Smoothies',
      iconPath: 'assets/icons/orange-snacks.svg',
      isAltBoxColor: true,
    ));

    return categories;
  }
}
