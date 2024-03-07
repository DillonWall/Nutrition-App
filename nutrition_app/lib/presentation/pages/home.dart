import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition_app/data/models/category_model.dart';
import 'package:nutrition_app/data/models/diet_model.dart';
import 'package:nutrition_app/data/models/popular_model.dart';
import 'package:nutrition_app/presentation/widgets/app_bar_back_button.dart';
import 'package:nutrition_app/presentation/widgets/circle_icon.dart';
import 'package:nutrition_app/presentation/widgets/dark_mode_toggle.dart';
import 'package:nutrition_app/presentation/widgets/filter_icon_on_right_edge.dart';
import 'package:nutrition_app/presentation/widgets/gradient_button.dart';
import 'package:nutrition_app/presentation/widgets/horizontal_carousel.dart';
import 'package:nutrition_app/presentation/widgets/search_icon.dart';
import 'package:nutrition_app/presentation/widgets/app_bar_settings_button.dart';
import 'package:nutrition_app/presentation/widgets/small_headline.dart';
import 'package:nutrition_app/presentation/widgets/vertical_carousel.dart';

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
      leading: AppBarBackButton(context: context),
      actions: [
        AppBarSettingsButton(context: context),
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
                    FilterIconOnRightEdge(context: context),
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
        HorizontalCarousel<CategoryModel>(
          context: context,
          items: categories,
          height: 150,
          itemWidth: 100,
          separationWidth: 25,
          boxColorCallback: (context, items, index) {
            return items[index].isAltBoxColor
                ? Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.8)
                : Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.8);
          },
          boxChildrenCallback: (context, items, index) {
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
      ],
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallHeadline(context: context, text: "Recommendation\nfor Diet"),
        const SizedBox(height: 15),
        HorizontalCarousel<DietModel>(
          context: context,
          items: diets,
          height: 240,
          itemWidth: 210,
          separationWidth: 25,
          itemBorderRadius: BorderRadius.circular(20),
          boxColorCallback: (context, items, index) {
            return items[index].isAltBoxColor
                ? Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.5)
                : Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5);
          },
          boxChildrenCallback: (context, items, index) {
            return [
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
              GradientButton(
                text: 'View',
                width: 130,
                height: 45,
                textStyle: TextStyle(
                  color: diets[index].viewIsSelected ? Colors.white : const Color(0xffC58BF2),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                colors: [
                  diets[index].viewIsSelected ? const Color(0xff9DCEFF) : Colors.transparent,
                  diets[index].viewIsSelected ? const Color(0xff92A3FD) : Colors.transparent,
                ],
              ),
            ];
          },
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
        VerticalCarousel<PopularDietsModel>(
          context: context,
          items: popularDiets,
          itemHeight: 115,
          separationHeight: 25,
          shrinkWrap: true,
          boxColorCallback: (context, items, index) {
            return popularDiets[index].boxIsSelected
                ? Theme.of(context).colorScheme.primaryContainer
                : Colors.transparent;
          },
          boxShadowCallback: (context, items, index) {
            return items[index].boxIsSelected ? [_boxShadow()] : [];
          },
          boxChildrenCallback: ((context, items, index) {
            return [
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
              ),
            ];
          }),
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
