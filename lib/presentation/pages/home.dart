import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition_app/core/constants/constants.dart';
import 'package:nutrition_app/domain/entities/category_entity.dart';
import 'package:nutrition_app/domain/entities/recipe_entity.dart';
import 'package:nutrition_app/presentation/bloc/categories/remote/remote_categories_bloc.dart';
import 'package:nutrition_app/presentation/bloc/random_recipes/remote/remote_random_recipes_bloc.dart';
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
  // List<CategoryModel> categories = [];
  // List<RecipeModel> diets = [];
  // List<PopularRecipeModel> popularDiets = [];

  void _getInitialInfo() {
    // categories = CategoryModel.getCategories();
    // diets = RecipeModel.getDiets();
    // popularDiets = PopularRecipeModel.getPopularDiets();
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

  BlocBuilder<RemoteCategoriesBloc, RemoteCategoriesState> _categoriesSection() {
    return BlocBuilder<RemoteCategoriesBloc, RemoteCategoriesState>(
      builder: (_, state) {
        if (state is RemoteCategoriesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteCategoriesError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteCategoriesDone) {
          return _categoriesSectionLoaded(state.categories!);
        }
        return Container();
      },
    );
  }

  Column _categoriesSectionLoaded(List<CategoryEntity> categories) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallHeadline(context: context, text: "Category"),
        const SizedBox(height: 15),
        HorizontalCarousel<CategoryEntity>(
          context: context,
          items: categories,
          height: 150,
          itemWidth: 100,
          separationWidth: 25,
          boxColorCallback: (context, items, index) {
            return index % 2 == 0
                ? Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.8)
                : Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.8);
          },
          boxChildrenCallback: (context, items, index) {
            return [
              CircleIcon(
                iconUrl: items[index].thumbnailUrl,
                width: 50,
                height: 50,
              ),
              Text(
                items[index].name ?? '...',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ];
          },
        ),
      ],
    );
  }

  BlocBuilder<RemoteRandomRecipesBloc, RemoteRandomRecipesState> _dietSection() {
    return BlocBuilder<RemoteRandomRecipesBloc, RemoteRandomRecipesState>(
      builder: (_, state) {
        if (state is RemoteRandomRecipesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteRandomRecipesError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteRandomRecipesDone) {
          return _dietSectionLoaded(state.recipes!);
        }
        return Container();
      },
    );
  }

  Column _dietSectionLoaded(List<RecipeEntity> recipes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallHeadline(context: context, text: "Recommendation\nfor Diet"),
        const SizedBox(height: 15),
        HorizontalCarousel<RecipeEntity>(
          context: context,
          items: recipes,
          height: 240,
          itemWidth: 210,
          separationWidth: 25,
          itemBorderRadius: BorderRadius.circular(20),
          boxColorCallback: (context, items, index) {
            return index % 2 == 0
                ? Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.5)
                : Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5);
          },
          boxChildrenCallback: (context, items, index) {
            return [
              CachedNetworkImage(
                imageUrl: recipes[index].thumbnailUrl ?? placeholderURL,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Column(
                children: [
                  Text(
                    recipes[index].name ?? '...',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    '${recipes[index].category} | ${recipes[index].area} | ${recipes[index].youtubeUrl}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const GradientButton(
                text: 'View',
                width: 130,
                height: 45,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                colors: [
                  Color(0xff9DCEFF),
                  Color(0xff92A3FD),
                ],
              ),
            ];
          },
        ),
      ],
    );
  }

  BlocBuilder<RemoteRandomRecipesBloc, RemoteRandomRecipesState> _popularSection() {
    return BlocBuilder<RemoteRandomRecipesBloc, RemoteRandomRecipesState>(
      builder: (_, state) {
        if (state is RemoteRandomRecipesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteRandomRecipesError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteRandomRecipesDone) {
          return _popularSectionLoaded(state.recipes!);
        }
        return Container();
      },
    );
  }

  Column _popularSectionLoaded(List<RecipeEntity> recipes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallHeadline(context: context, text: "Popular"),
        const SizedBox(height: 15),
        VerticalCarousel<RecipeEntity>(
          context: context,
          items: recipes,
          height: 300,
          itemHeight: 115,
          separationHeight: 25,
          boxColorCallback: (context, items, index) {
            return index == 0 ? Theme.of(context).colorScheme.primaryContainer : Colors.transparent;
          },
          boxShadowCallback: (context, items, index) {
            return index == 0 ? [_boxShadow()] : [];
          },
          boxChildrenCallback: ((context, items, index) {
            return [
              CachedNetworkImage(
                imageUrl: recipes[index].thumbnailUrl ?? placeholderURL,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 65,
                height: 65,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipes[index].name ?? '...',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    '${recipes[index].category} | ${recipes[index].area} | ${recipes[index].youtubeUrl}',
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
      blurRadius: 16,
      spreadRadius: 0.0,
    );
  }
}
