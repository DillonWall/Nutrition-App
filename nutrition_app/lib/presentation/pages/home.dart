import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition_app/config/theme/theme_manager.dart';
import 'package:nutrition_app/data/models/category_model.dart';
import 'package:nutrition_app/data/models/diet_model.dart';
import 'package:nutrition_app/data/models/popular_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          _searchField(),
          const SizedBox(height: 40),
          _categoriesSection(),
          const SizedBox(height: 40),
          _dietSection(),
          const SizedBox(height: 40),
          _popularSection(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Breakfast',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      centerTitle: true,
      leading: BackButton(context: context),
      actions: [
        SettingsButton(context: context),
        DarkModeToggle(context: context),
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [_boxShadow()]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.primaryContainer,
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Search Pancake',
            prefixIcon: SearchIcon(context: context),
            suffixIcon: SizedBox(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Theme.of(context).hintColor,
                      indent: 10,
                      endIndent: 10,
                      thickness: 1,
                    ),
                    FilterIcon(context: context),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallHeadline(context: context, text: "Category"),
        const SizedBox(height: 15),
        SizedBox(
          height: 150,
          child: HorizontalCarousel(
            context: context,
            items: categories,
            width: 100,
            separationWidth: 25,
            boxColorFunc: (context, items, index) {
              return items[index].isAltBoxColor
                  ? Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.8)
                  : Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.8);
            },
            boxChildrenFunc: (context, items, index) {
              return [
                CircleIcon(
                  iconPath: items[index].iconPath,
                  width: 50,
                  height: 50,
                ),
                Text(
                  items[index].name,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ];
            },
          ),
        ),
      ],
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallHeadline(context: context, text: "Recommendation\nfor Diet"),
        const SizedBox(height: 15),
        SizedBox(
          height: 240,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(
                  color: diets[index].isAltBoxColor
                      ? Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.5)
                      : Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(diets[index].iconPath),
                    Column(
                      children: [
                        Text(
                          diets[index].name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          '${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            diets[index].viewIsSelected
                                ? const Color(0xff9DCEFF)
                                : Colors.transparent,
                            diets[index].viewIsSelected
                                ? const Color(0xff92A3FD)
                                : Colors.transparent,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          'View',
                          style: TextStyle(
                            color: diets[index].viewIsSelected
                                ? Colors.white
                                : const Color(0xffC58BF2),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: ((context, index) => const SizedBox(width: 25)),
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
          ),
        ),
      ],
    );
  }

  Column _popularSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallHeadline(context: context, text: "Popular"),
        const SizedBox(height: 15),
        ListView.separated(
          itemCount: popularDiets.length,
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 20, right: 20),
          separatorBuilder: (context, index) => const SizedBox(height: 25),
          itemBuilder: (context, index) {
            return Container(
              height: 115,
              decoration: BoxDecoration(
                color: popularDiets[index].boxIsSelected
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                boxShadow: popularDiets[index].boxIsSelected ? [_boxShadow()] : [],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    popularDiets[index].iconPath,
                    width: 65,
                    height: 65,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        popularDiets[index].name,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        '${popularDiets[index].level} | ${popularDiets[index].duration} | ${popularDiets[index].calorie}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/icons/button.svg',
                      width: 30,
                      height: 30,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  BoxShadow _boxShadow() {
    return BoxShadow(
      color: Theme.of(context).colorScheme.shadow.withOpacity(0.3),
      blurRadius: 40,
      spreadRadius: 0.0,
    );
  }
}

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    super.key,
    required this.iconPath,
    required this.width,
    required this.height,
  });

  final String iconPath;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(iconPath),
      ),
    );
  }
}

class HorizontalCarousel extends StatelessWidget {
  const HorizontalCarousel({
    super.key,
    required this.context,
    required this.items,
    required this.width,
    required this.separationWidth,
    required this.boxColorFunc,
    required this.boxChildrenFunc,
  });

  final BuildContext context;
  final List<CategoryModel> items;
  final double width;
  final double separationWidth;
  final Color Function(BuildContext, List<CategoryModel>, int) boxColorFunc;
  final List<Widget> Function(BuildContext, List<CategoryModel>, int) boxChildrenFunc;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 20, right: 20),
      separatorBuilder: (context, index) => SizedBox(width: separationWidth),
      itemBuilder: (context, index) {
        return Container(
          width: width,
          decoration: BoxDecoration(
            color: boxColorFunc(context, items, index),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: boxChildrenFunc(context, items, index),
          ),
        );
      },
    );
  }
}

class FilterIcon extends StatelessWidget {
  const FilterIcon({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 20),
      child: SvgPicture.asset(
        'assets/icons/Filter.svg',
        colorFilter: ColorFilter.mode(Theme.of(context).hintColor, BlendMode.srcIn),
      ),
    );
  }
}

class SearchIcon extends StatelessWidget {
  const SearchIcon({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SvgPicture.asset(
        'assets/icons/Search.svg',
        colorFilter: ColorFilter.mode(Theme.of(context).hintColor, BlendMode.srcIn),
      ),
    );
  }
}

class DarkModeToggle extends StatelessWidget {
  const DarkModeToggle({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: Provider.of<ThemeManager>(context).isDark,
      onChanged: (newValue) {
        Provider.of<ThemeManager>(context, listen: false).toggleTheme();
      },
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        width: 37,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset(
          'assets/icons/dots.svg',
          colorFilter:
              ColorFilter.mode(Theme.of(context).colorScheme.onPrimaryContainer, BlendMode.srcIn),
          width: 5,
          height: 5,
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset(
          'assets/icons/Arrow - Left 2.svg',
          colorFilter:
              ColorFilter.mode(Theme.of(context).colorScheme.onPrimaryContainer, BlendMode.srcIn),
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}

class SmallHeadline extends StatelessWidget {
  const SmallHeadline({
    super.key,
    required this.context,
    required this.text,
  });

  final BuildContext context;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
