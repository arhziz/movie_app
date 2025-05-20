import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/app_core/app_core.dart';
import 'package:movie_app/shared/shared.dart';

///
class CategoriesWidget extends StatelessWidget {
  ///
  const CategoriesWidget({super.key, this.activeIndex = 0});

  ///
  final int activeIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const _TitleWidget(),
        const SizedBox(height: 10),
        _ListOfCategoriesWidget(
          activeIndex: activeIndex,
        ),
      ],
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Categories',
      style: AppTextStyles.bodyLarge.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
    );
  }
}

// ignore: must_be_immutable
class _ListOfCategoriesWidget extends StatelessWidget {
  _ListOfCategoriesWidget({required this.activeIndex});
  final int activeIndex;
  List<String> categories = ['Movies', 'TV Shows'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: categories.mapIndexed((index, cat) {
          return Container(
            margin: const EdgeInsets.only(right: 5),
            child: ClickableContainerWidget(
              isActive: activeIndex == index,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text(
                  categories[index],
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: AppDimens.p12,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
