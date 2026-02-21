import 'package:news/utitis/app_assets.dart';

class Category {
  final String id;
  final String title;
  final String image;

  Category({
    required this.id,
    required this.title,
    required this.image,
  });

  /*
  business
  entertainment
  general
  health
  science
  sports
  technology
  */

  static List<Category> getCategoriesList(bool isDark) {
    return [
      Category(
        id: 'general',
        title: 'General',
        image: !isDark
            ? AppAssets.generalDarkImage
            : AppAssets.generalLightImage,
      ),
      Category(
        id: 'business',
        title: 'Business',
        image: !isDark
            ? AppAssets.businessDarkImage
            : AppAssets.businessLightImage,
      ),
      Category(
        id: 'entertainment',
        title: 'Entertainment',
        image: !isDark
            ? AppAssets.entertainmentDarkImage
            : AppAssets.entertainmentLightImage,
      ),
      Category(
        id: 'health',
        title: 'Health',
        image: !isDark
            ? AppAssets.healthDarkImage
            : AppAssets.healthLightImage,
      ),
      Category(
        id: 'science',
        title: 'Science',
        image: !isDark
            ? AppAssets.scienceDarkImage
            : AppAssets.scienceLightImage,
      ),
      Category(
        id: 'technology',
        title: 'Technology',
        image: !isDark
            ? AppAssets.technologyDarkImage
            : AppAssets.technologyLightImage,
      ),
      Category(
        id: 'sports',
        title: 'Sports',
        image: !isDark
            ? AppAssets.sportsDarkImage
            : AppAssets.sportsLightImage,
      ),
    ];
  }
}
